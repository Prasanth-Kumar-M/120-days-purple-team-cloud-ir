# Day 11 — CloudTrail Logs Forwarding Pipeline (S3 → SQS → Filebeat → Elasticsearch/OpenSearch)

**Date:** YYYY-MM-DD  
**Lab Environment:** AWS (us-east-2)  
**EC2 Instance:** Linux (attacker machine)

---

## 🎯 Goal

Set up a pipeline to collect AWS CloudTrail logs and forward them to Elasticsearch/OpenSearch for visualization and incident response analysis.

---

## 🛠 Activities

1. Configured **CloudTrail** to deliver logs to an **S3 bucket**.
2. Created an **SQS queue** to receive notifications from S3.
3. Installed **Filebeat** on a Linux EC2 instance.
4. Configured Filebeat to:
   - Consume logs from the SQS queue.
   - Forward logs to Elasticsearch/OpenSearch.
5. Validated log flow and connectivity.

---

## ⚠️ Challenges & Mistakes

- Filebeat **YAML syntax errors** prevented the service from starting.  
- Elasticsearch connectivity issues when using AWS CloudShell.  
- Misconfigured IAM roles slowed pipeline setup.  

---

## ✅ Lessons Learned

- Always **validate YAML configurations** before starting Filebeat.  
- Double-check **IAM roles and permissions** for S3, SQS, and EC2.  
- Debug services using foreground mode:  
```bash
sudo filebeat -e -d "*"
