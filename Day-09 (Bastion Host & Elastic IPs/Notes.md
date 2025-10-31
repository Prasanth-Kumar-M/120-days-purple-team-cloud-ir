Make access stable using Bastion + Elastic IP.

# Allocate EIP and associate to bastion
ALLOCATION_ID=$(aws ec2 allocate-address --domain vpc --query 'AllocationId' --output text)
aws ec2 associate-address --instance-id i-BASTION --allocation-id $ALLOCATION_ID

# Modify instance SG attachment
ENI=$(aws ec2 describe-instances --instance-ids i-ATTACKER --region $REGION --query 'Reservations[0].Instances[0].NetworkInterfaces[0].NetworkInterfaceId' --output text)
aws ec2 modify-network-interface-attribute --network-interface-id $ENI --groups sg-AAA sg-BBB --region $REGION

Best practice
Restrict inbound to bastion EIP; then SSH from bastion to private instances.
