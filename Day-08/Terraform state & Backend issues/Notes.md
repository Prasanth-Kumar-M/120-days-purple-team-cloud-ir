Fix terraform Backend configuration changed / unsupported attribute "use_legacy_workflow" / reinstall Terraform.

#Common fixes

Reinstall correct Terraform binary and ensure PATH picks it up.

Free disk space if unzip fails (terraform write error (disk full?)).

Backup state: cp terraform.tfstate terraform.tfstate.bak.

Re-init with options:

**terraform init -migrate-state   # attempt migrate state
terraform init -reconfigure     # force reinit/backends**


Mistakes I made:

Deleting .terraform without backing up terraform.tfstate (avoid this).

Lesson

**Always backup state; use correct Terraform versions for state compatibility.**
