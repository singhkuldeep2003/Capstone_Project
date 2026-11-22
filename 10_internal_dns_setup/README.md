# Project 10: Internal DNS Setup

## 1. Goal
Deploy an internal DNS server to configure private hostname resolution and access applications via domain names instead of raw IP addresses.

## 2. DNS Server Architecture
- **DNS Server:** Samba Internal DNS (`127.0.0.1:53`)
- **Forward Lookup Zone:** `corp.local`
- **Configured Record:**
  - **Hostname:** `web.corp.local`
  - **Record Type:** `A`
  - **Target IP:** `127.0.0.1`

## 3. Verification & Proof
- Executed `samba-tool dns query` verifying `A: 127.0.0.1`.
- Verified domain name resolution using `nslookup web.corp.local 127.0.0.1`.
- Verified local HTTP endpoint routing via `http://web.corp.local:8080`.
