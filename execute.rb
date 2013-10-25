require 'aws-sdk'
require 'ControleEc2'

ec2 = ControleEc2.new(ARGV[0], ARGV[1])
ec2.send(ARGV[2])
