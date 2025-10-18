# Day 1 – Detailed Notes

## Objective
Set up a secure AWS environment for future Purple Teaming and Incident Response labs.

---

## 1️⃣ What I Did
- Created AWS account using Free Tier
- Set up billing alerts via CloudWatch
- Enabled Multi-Factor Authentication (MFA)
- Explored AWS Identity and Access Management (IAM) basics

---

## 2️⃣ Commands / Steps / Configurations
### MFA Setup
1. Navigate to IAM → Users → Security Credentials → Enable MFA
2. Scanned QR code using Google Authenticator
3. Verified MFA codes

### Billing Alerts
1. Open CloudWatch → Alarms → Create Alarm
2. Metric: Billing → EstimatedCharges (USD)
3. Set threshold = 1 USD
4. Action: Send email to registered address

---

## 3️⃣ Issues Faced & How I Solved Them
- **Issue:** MFA setup option not visible.  
  **Fix:** Needed to enable IAM user permissions first.  
- **Issue:** Billing alarm not sending notifications.  
  **Fix:** Confirmed SNS subscription via verification email.

---

## 4️⃣ Key Learnings
- AWS separates permissions for root and IAM users — least privilege matters even in labs.
- Billing alarms are region-specific (set in N. Virginia region).
- MFA adds an essential security layer for both root and IAM users.

---

## 5️⃣ References
- [AWS Billing Alarms Documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html)
- [AWS MFA Setup Guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa.html)

---

## 6️⃣ Next Steps
Tomorrow I’ll start setting up:
- **Attacker machine** (Kali Linux or similar)
- **Victim/Target machine** (Windows Server or Ubuntu)
to begin the hands-on Purple Team phase.
