#!/bin/bash
# Day 14: Explore CloudTrail fields

# List last 10 CloudTrail events
aws cloudtrail lookup-events --max-results 10
