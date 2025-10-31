
related:

Attach least-privilege IAM role for SSM and use Session Manager as reliable access method.


Commands

# Create role and attach AmazonSSMManagedInstanceCore (or custom limited policy)
aws iam create-role --role-name lab-ssm-role --assume-role-policy-document '{
  "Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]
}'
aws iam attach-role-policy --role-name lab-ssm-role --policy-arn arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore

# Associate role to instance
aws ec2 associate-iam-instance-profile --instance-id i-<TARGET> --iam-instance-profile Name=lab-ssm-role

Use SSM
aws ssm start-session --target i-<TARGET> --region us-east-2

Lesson

SSM removes need to open management ports, safer and faster for debugging.
