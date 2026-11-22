# Project 9: Domain Controller Setup

## 1. Goal
Deploy an Active Directory Domain Controller (AD DC) to configure centralized user identity management and authentication.

## 2. Infrastructure Architecture
- **Service:** Samba Active Directory Domain Controller (`samba-ad-dc`)
- **Domain Realm:** `CORP.LOCAL`
- **Domain NetBIOS Name:** `CORP`
- **KDC Server:** `127.0.0.1`

## 3. Provisioned Accounts
- `user1`: `user1@CORP.LOCAL` (John Doe)
- `user2`: `user2@CORP.LOCAL` (Jane Smith)

## 4. Authentication Proof
- Successfully acquired Kerberos Ticket Granting Tickets (TGT) via `kinit` for domain accounts.
- Validated active ticket cache via `klist` for principal `user2@CORP.LOCAL`.
- Verified authenticated SMB sessions against `sysvol` and `netlogon` shares using `smbclient` with user credentials.
