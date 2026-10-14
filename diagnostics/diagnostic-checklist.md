# Diagnostic checklist

Use this checklist to record the current state before trying another fix.

## Baseline

- [ ] Record Windows version and build.
- [ ] Record `wsl --version`.
- [ ] Record `wsl --status`.
- [ ] Record `wsl --list --verbose`.
- [ ] Check the `VirtualMachinePlatform` and `Microsoft-Windows-Subsystem-Linux` feature states.
- [ ] Check whether Windows reports a hypervisor present.
- [ ] Record `docker --version`.
- [ ] Run `docker info` and save the exact error if it fails.
- [ ] Record the status of WSL-related services.
- [ ] Try launching Ubuntu once and copy the exact error.

## Before changing anything

- [ ] Note the date and time.
- [ ] Record the command or setting changed.
- [ ] Change one thing at a time.
- [ ] Capture the exact result.
- [ ] Reboot only when appropriate and record whether the behaviour changes.
- [ ] Avoid resetting or unregistering a distribution unless its data is backed up and the consequences are understood.

## When sharing output

Remove or redact usernames, computer names, private paths, IP addresses if sensitive, tokens, keys, and other identifying information. Do not upload raw logs without reviewing them.
