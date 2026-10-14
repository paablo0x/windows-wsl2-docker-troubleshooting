# Incident 001: WSL VM startup failures

**Status:** Open / root cause not confirmed  
**Area:** Windows, WSL2, Ubuntu  
**Last updated:** 2026-10-14

## Summary

During setup and troubleshooting of WSL2 and Docker Desktop on Windows 11, Ubuntu later failed to start. The errors recorded were:

```text
Wsl/Service/CreateInstance/CreateVm/E_ABORT
```

and:

```text
Wsl/Service/ERROR_TIMEOUT
```

The cause has not been established yet.

## Environment recorded at the time

- Windows 11 Pro
- Windows build `26300.9550`
- WSL version `3.0.3.0`
- WSL kernel `6.18.54.1-1`
- WSLg `1.0.79`
- Ubuntu distribution
- Docker Desktop

These are historical values and need to be checked against a fresh diagnostic snapshot.

## Timeline

1. Docker Desktop initially reported that required virtualization support was unavailable.
2. Enabled `VirtualMachinePlatform` and `Microsoft-Windows-Subsystem-Linux`.
3. Restarted Windows.
4. Installed Ubuntu through WSL.
5. Ran `sfc /scannow`; Windows reported no integrity violations.
6. Later, WSL failed to start Ubuntu with `E_ABORT`.
7. A subsequent attempt returned `ERROR_TIMEOUT`.
8. Ran `wsl --update`; the outcome has not been verified.
9. A diagnostic command was followed by a reported system crash, but no confirmed causal relationship has been established.

## Actions already attempted

- Enabled required Windows optional features.
- Restarted Windows.
- Installed Ubuntu.
- Ran `wsl --shutdown`.
- Ran `wsl --update`.
- Ran `sfc /scannow`.
- Inspected WSL-related services and Windows features.

## Current interpretation

The errors indicate that WSL failed while attempting to create or start the Linux virtual machine, but the available evidence does not identify the underlying cause. The SFC result only says that it did not detect integrity violations; it does not rule out all Windows, virtualization, driver, or WSL issues.

## Next steps

- Capture a fresh diagnostic snapshot.
- Reproduce the error and preserve the exact output.
- Review relevant WSL and virtualization logs around the failure time.
- Check whether Ubuntu starts independently of Docker Desktop.
- Test one change at a time and record the result.

## Outcome

**Not resolved in the available notes.** Update this section only after a fix has been tested and verified.
