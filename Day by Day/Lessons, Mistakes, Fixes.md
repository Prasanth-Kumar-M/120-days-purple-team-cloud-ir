Frequent mistakes & fixes

Used Console “My IP” while running CloudShell → whitelisted wrong IP.

Fix: curl https://checkip.amazonaws.com in the environment that initiates the connection.

Tried PowerShell-only commands from bash (Enter-PSSession, Get-Credential).

Fix: Run them on a Windows client (or use pwsh with proper setup) or use Linux tools (pywinrm / evil-winrm).

Ruby / evil-winrm gem install failures due to old Ruby / OpenSSL.

Fixes: Use Python approach (pywinrm), install newer Ruby via rbenv or compile system Ruby to /usr/local, or use Docker image.

nc / curl timeouts — misdiagnosed as app issues.

Fix: Check SG, NACL, route table (IGW), instance firewall, and use private IP inside VPC.

Terraform state errors & incompatible versions.

Fix: Backup terraform.tfstate, use terraform init -reconfigure or -migrate-state, match Terraform version.

Leaving ports open too broadly (0.0.0.0/0).

Fix: Use SSM, bastion, and SG-to-SG rules for intra-VPC access instead.
