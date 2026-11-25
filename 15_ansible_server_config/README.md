# Project 15: Automate Server Config with Ansible

## 1. Goal
Implement remote configuration automation to setup an Ansible controller and install/configure an Nginx web server using an Ansible playbook.

## 2. Architecture & Components
- **Automation Engine:** Ansible Core
- **Inventory:** `inventory.ini` managing targeted webservers
- **Target OS:** Ubuntu Linux
- **Managed Package:** Nginx
- **Service Configuration:** Enabled, auto-start, custom web document root (`/var/www/html/index.html`)

## 3. Playbook Execution
```bash
# Check connectivity
ansible webservers -m ping

# Run configuration playbook
ansible-playbook playbook.yaml

# Verify HTTP output
curl -I http://localhost
curl -s http://localhost
```

## 4. Deliverables
- Proof screenshots showing playbook execution (failed=0) and functional Nginx service response.
