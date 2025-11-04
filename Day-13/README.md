Day 13  Lab Architecture Documentation

Objective

Day 13 was dedicated to documenting the end-to-end security lab architecture I've been building from Day 1 to Day 12.

Clear design = repeatability, faster debugging, better future automation.

What I Did Today

Drew full cloud + endpoint pipeline
Documented AWS log forwarding flow
Mapped Sysmon + Winlogbeat architecture
Captured IAM + region dependencies
prepared references for detection engineering phase


Architecture Overview
Cloud Environment (AWS — us-east-2)
Component ->	Purpose
Windows EC2	-> Target host, Sysmon + Winlogbeat configured
Linux EC2 (Collector)	-> Filebeat agent pulls logs from S3/SQS
AWS CloudTrail ->	API & account logging
S3 Bucket ->	CloudTrail log storage
SQS Queue ->	Notification + decoupling pipeline
Filebeat ->	Consumes CloudTrail events & ships to SIEM
IAM Roles & Policies	 -> Least-privilege access to S3 & SQS


Host Telemetry Pipeline
Tool ->	Function
Sysmon ->	Advanced Windows event logging
Winlogbeat -> 	Ships Sysmon + Event Logs to collector


Windows EC2 
  └─ Sysmon → Winlogbeat → Collector (Filebeat)

AWS Control Plane  
  └─ CloudTrail → S3 → SQS → Filebeat (Linux)

If Filebeat  → No CloudTrail ingestion
If Sysmon  → No endpoint visibility

