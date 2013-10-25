class ControleEc2
  require 'aws-sdk'
  require 'yaml'

  def initialize(instance_id)
    @instance_id = instance_id
  end

  def setup(region)
    AWS.config(YAML.load(File.read("config.yml")))
    AWS.config(region: region)
  end

  %w(start stop).each do |name|
    define_method name do
      begin
        puts "Trying to #{name} EC2..."
        instance = AWS::EC2.new.instances[@instance_id]
        instance.send(name)
      rescue => e
        puts "Failed to #{name}."
      ensure
        puts "Status: #{instance.status}."
      end
    end
  end

end

ec2 = ControleEc2.new(ARGV[1])
ec2.setup(ARGV[0])
ec2.send(ARGV[2])
