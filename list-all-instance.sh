#!/bin/bash


aws ec2 describe-instances --query 'Reservations[*].Instances[*].{InstanceName:Tags[?Key==`Name`] | [0].Value,InstanceID:InstanceId,InstanceType:InstanceType,InstanceState:State.Name,SubnetID:SubnetId,VPCID:VpcId}' --output table --region us-east-1
