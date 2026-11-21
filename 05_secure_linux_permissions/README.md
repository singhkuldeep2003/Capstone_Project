# Project 5: Secure Linux Server Permissions

## 1. Goal
Implement discretionary access control (DAC) and user-based permission boundaries on a Linux server to restrict directory and file access based on group membership.

## 2. Implementation Overview
- **Secured Directory:** `/opt/secure_data`
- **User Group:** `developers`
- **Authorized User:** `alice` (Primary group: `developers`)
- **Restricted User:** `bob` (Standard user, non-member)

## 3. Permission Model
- **Ownership:** `root:developers`
- **Directory Mode:** `770` (`drwxrwx---`)
  - **Owner (`root`):** Full read, write, and execute permissions (`rwx`).
  - **Group (`developers`):** Full read, write, and execute permissions (`rwx`), allowing authorized members to navigate the directory, inspect contents, and create new files.
  - **Others (`other`):** Zero permissions (`---`), denying all access to users outside the `developers` group.
- **File Mode:** `660` (`-rw-rw----`) on `/opt/secure_data/confidential.txt`.

## 4. Test Evidence
- **Allowed Access (User: `alice`):**
  - Read: `sudo -u alice cat /opt/secure_data/confidential.txt` -> Returned `Confidential Data: Developers Only`.
  - Write: `sudo -u alice touch /opt/secure_data/alice_work.txt` -> Successfully created file.
- **Denied Access (User: `bob`):**
  - Read attempt: `sudo -u bob cat /opt/secure_data/confidential.txt` -> `cat: /opt/secure_data/confidential.txt: Permission denied`.
  - Directory listing: `sudo -u bob ls -la /opt/secure_data` -> `ls: cannot open directory '/opt/secure_data': Permission denied`.
