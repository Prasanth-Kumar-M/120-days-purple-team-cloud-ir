# Day 2 — Attacker & Victim Lab (Concise)

**Date:** Day 2 of 120  
**Focus:** Provision isolated attacker and victim machines in AWS, enable basic telemetry, and run safe simulations to validate detection.

## Objective
- Build a simple, repeatable Purple Team lab (attacker + target).
- Ensure telemetry: CloudTrail, VPC Flow Logs (or CloudWatch), and GuardDuty.
- Run small, non-destructive tests and verify logs/alerts.

## Quick Steps
1. Create VPC and two subnets: `attacker-subnet`, `target-subnet`.  
2. Create restricted security groups (SSH from my IP; allow attacker → target internal traffic).  
3. Launch two small EC2 instances (attacker, target) and install basic tools/agents.  
4. Enable CloudTrail (deliver to S3) and VPC Flow Logs (to CloudWatch or S3).  
5. Enable GuardDuty.  
6. Run one benign test (e.g., `nmap` scan or simple HTTP request) and record timestamps.  
7. Validate logs in CloudTrail, Flow Logs, and GuardDuty.

## Artifacts
- `artifacts/nmap_scan.png`  
- `artifacts/cloudtrail_event.png`  
- `Notes.md` (detailed commands, issues, and fixes)

## Safety
All testing is restricted to resources I control in my lab account. No testing against production or third-party systems.

## Next
- Tune detection rules and create a short triage playbook.
- Automate daily tests and begin mapping tests → detections.

**Commit suggestion:**  
`git add Day-02-Attacker-Victim && git commit -m "Day 2: attacker & victim lab - minimal README" && git push`
