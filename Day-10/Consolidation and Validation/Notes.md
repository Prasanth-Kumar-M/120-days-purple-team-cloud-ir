Consolidate scripts, validate end-to-end, create printable checklist.

Add attacker IP to SG

#!/bin/bash
REGION="us-east-x"
SG_ID="sg-XXXXX"
MYIP=$(curl -s https://checkip.amazonaws.com)
aws ec2 authorize-security-group-ingress --group-id $SG_ID --protocol tcp --port 5985 --cidr ${MYIP}/32 --region $REGION

Enable WinRM HTTP (PowerShell on Windows target)

winrm quickconfig -q
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
netsh advfirewall firewall add rule name="WinRM HTTP" dir=in action=allow protocol=TCP localport=5985

pywinrm quick test
source ~/pywinrm-venv/bin/activate
python3 - <<'PY'
from winrm import Session
s = Session('10.xxx.xx.xxx', auth=('Administrator','YourPassword'))
r = s.run_cmd('whoami')
print(r.status_code, r.std_out.decode())
PY
