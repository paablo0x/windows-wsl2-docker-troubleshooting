# Windows WSL2 & Docker Troubleshooting

A small troubleshooting project documenting my experience setting up WSL2, Ubuntu, and Docker Desktop on Windows 11.

## What is this?

I've been setting up my Windows environment to run Linux tools and eventually experiment with local AI projects. During the process, I ran into some problems with WSL2 and Docker that took me down a bit of a troubleshooting rabbit hole.

Instead of just trying random fixes and forgetting what I did, I decided to document the process here.

I'm using this repository to keep track of the errors I encountered, the commands I tried, what worked, and what still needs investigating.

I also used AI as a troubleshooting assistant to help me understand error messages, explore possible causes, and come up with diagnostic commands. I'm documenting the results myself and checking what actually works rather than assuming every suggestion is correct.

## My Setup

- **OS:** Windows 11 Pro
- **Windows build:** `26300.9550` (recorded during troubleshooting)
- **WSL version:** `3.0.3.0` (recorded during troubleshooting)
- **WSL kernel:** `6.18.54.1-1` (recorded during troubleshooting)
- **Linux distro:** Ubuntu
- **Container platform:** Docker Desktop
- **Shell:** PowerShell

These are the versions recorded during the troubleshooting. I'll update them if my setup changes.

## Problems I Ran Into

### 1. Docker couldn't find the required virtualization support

Initially, Docker Desktop complained that the required virtualization support wasn't available.

I enabled the `VirtualMachinePlatform` and `Microsoft-Windows-Subsystem-Linux` Windows features and restarted the computer.

### 2. Ubuntu refused to start

Later, I started getting errors when trying to launch Ubuntu through WSL.

The two errors I recorded were:

```text
Wsl/Service/CreateInstance/CreateVm/E_ABORT
```

and

```text
Wsl/Service/ERROR_TIMEOUT
```

I tried shutting WSL down and starting it again, and I also ran `wsl --update`. The actual cause of these errors hasn't been confirmed yet.

### 3. Checking Windows system files

I ran:

```powershell
sfc /scannow
```

Windows reported that it didn't find any integrity violations. That was useful information, but it didn't explain why WSL was failing.

## Things I've Tried

- Enabled the required Windows optional features.
- Restarted Windows.
- Installed Ubuntu through WSL.
- Ran `wsl --shutdown`.
- Updated WSL using `wsl --update`.
- Checked Windows system files using SFC.
- Used `docker info` to check Docker during the initial setup.
- Used PowerShell commands to inspect WSL services and Windows features.

## Current Status

The initial Docker CLI check worked, but later attempts to start Ubuntu resulted in WSL VM startup errors.

I haven't confirmed the root cause or a permanent fix yet. I also need to check the current state of Docker and WSL before drawing any conclusions.

I'll update this repository as I continue investigating.

## What's Next?

- Check the current WSL and Docker status.
- Collect diagnostic information about virtualization and Windows features.
- Look into the relevant logs for clues about the startup failures.
- Test possible fixes one at a time.
- Record the results, including unsuccessful attempts.
- Verify that any fix works after restarting Windows.

## Why I'm Documenting This

I'm interested in cybersecurity, but I also want to get better at understanding the systems and infrastructure behind the tools I use.

Troubleshooting is part of that. Not everything works on the first try, and I think there's value in documenting the process instead of only showing the final result.

This is also a way to practise PowerShell, Windows administration, Linux troubleshooting, and technical documentation.

## AI Assistance

I used AI to help me investigate errors, understand diagnostic output, and identify commands worth testing.

The troubleshooting process and results are documented here, including what remains unresolved. AI suggestions are treated as things to investigate, not as proof that a problem has been fixed.

---

**Status:** Still investigating.

More updates coming as I figure this out.
