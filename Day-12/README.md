# 120 Days of Purple Teaming & Cloud Incident Response — Day 12

**Focus:** Install Sysmon on Windows EC2 (Target) using a community configuration, forward logs using Winlogbeat, and document issues and lessons learned.

---

## Purpose
Day 12 is about **endpoint monitoring**. Sysmon provides detailed logging of system activity, including process creation, network connections, and file changes. Forwarding these logs to a central collector (via Winlogbeat) enables analysis in Elastic Cloud or other SIEM tools.

---

## Environment
- **Attacker Machine:** Linux EC2  
- **Target Machine:** Windows EC2  
- **Cloud:** AWS (us-east-2)  
- **Tools:** Sysmon, Winlogbeat, Elastic Stack (optional)

---

## Step 1: Prepare Windows EC2
1. Ensure your **Windows EC2** instance is running.  
2. Confirm **RDP access** or PowerShell remote session is functional.  

---

## Step 2: Install Sysmon
1. Download Sysmon from [Sysinternals](https://docs.microsoft.com/en-us/sysinternals/downloads/sysmon).  
2. Place `Sysmon64.exe` in `C:\Temp\Sysmon`.  
3. Download a community configuration, e.g., [SwiftOnSecurity Sysmon config](https://github.com/SwiftOnSecurity/sysmon-config).  
4. Open **PowerShell as Administrator** and run:

C:\Temp\Sysmon\Sysmon64.exe -accepteula -i C:\Temp\Sysmon\sysmon-config.xml


Step 3: Verify Sysmon Installation
Get-Service Sysmon
Get-WinEvent -LogName "Microsoft-Windows-Sysmon/Operational" -MaxEvents 10

Step 4: Install Winlogbeat

Download Winlogbeat from Elastic Downloads
.

Extract to C:\Temp\Winlogbeat.

Install as a service:

cd C:\Temp\Winlogbeat
.\winlogbeat.exe install


Step 5: Configure Winlogbeat

Edit winlogbeat.yml to include Sysmon logs:

winlogbeat.event_logs:
  - name: Microsoft-Windows-Sysmon/Operational
    ignore_older: 72h

output.console:
  enabled: true


Step 6: Start Winlogbeat
Start-Service winlogbeat
Get-Service winlogbeat

Step 7: Verify Logs
Get-Content -Path "C:\ProgramData\winlogbeat\Logs\winlogbeat" -Tail 50 -Wait:$false
