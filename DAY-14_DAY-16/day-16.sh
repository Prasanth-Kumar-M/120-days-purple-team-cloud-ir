#!/bin/bash
# Day 16: Trigger CloudTrail events via CLI

# Create a new S3 bucket
aws s3 mb s3://purple-journey-120-days-bucket

# List buckets
aws s3 ls

# Delete bucket (be careful!)
aws s3 rb s3://purple-journey-120-days-bucket

# Check CloudTrail logs for CreateBucket
aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventName,AttributeValue=CreateBucket

# Check CloudTrail logs for DeleteBucket
aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventName,AttributeValue=DeleteBucket
