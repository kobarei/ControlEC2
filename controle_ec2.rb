class ControleEc2
  require 'aws-sdk'
  require 'yaml'

  def setup(region)
    AWS.config(YAML.load(File.read("config.yml")))
    AWS.config(region: region)
  end

  %w(run stop status).each do |name|
    define_method name do |instance_id|
      begin
        new_instance(instance_id)
        change_status(name) unless name == "status"
      rescue => e
        puts "Failed to #{name}."
      ensure
        puts "Status: #{@instance.status}."
      end
    end
  end

  def new_instance(instance_id)
    @instance = AWS::EC2.new.instances[instance_id]
  end

  def change_status(name)
    puts "Trying to #{name} EC2..."
    @instance.send(name)
  end

end

ec2 = ControleEc2.new
ec2.setup(ARGV[0])
ec2.send(ARGV[2], ARGV[1])
