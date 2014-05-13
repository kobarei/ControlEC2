ControlEC2
===========

ruby script running and stopping EC2 instance


## Installation

Install AWS SDK for Ruby with rubygems.

    gem install aws-sdk

Modify config.yml with your Access Key ID and Secret Access Key.

    access_key_id: 'YourAccessKeyId'
    secret_access_key: 'YourSecretAccessKey'


## Basic Usage

Run:

    ruby control_ec2.rb AvailabilityZone InstanceID run

Stop:

    ruby control_ec2.rb AvailabilityZone InstanceID stop

Check Status:

    ruby control_ec2.rb AvailabilityZone InstanceID status
