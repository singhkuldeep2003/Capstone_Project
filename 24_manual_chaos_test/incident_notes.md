# Incident Notes: Manual Chaos Engineering & Failover Verification

## 1. Overview
- **Incident ID:** INC-CHAOS-20261125-01
- **Service Impacted:** Application Load Balancer (`project20-alb`) Target Group `azltt0222435e27-p20-tg`
- **Target Instances:**
  - Node 1: `i-0b05e677c3bc3192c` (Surviving Host)
  - Node 2: `i-0449dbe5a6b329b75` (Injected Chaos Target)
- **Objective:** Validate automated detection of host failure, load balancer traffic rerouting, and automatic service recovery.

## 2. Execution Timeline & Observations

| Phase | Target Health State | Observed Traffic Behavior |
| :--- | :--- | :--- |
| **Baseline** | Node 1: `healthy`<br>Node 2: `healthy` | Traffic balanced evenly across both backend instances. |
| **Fault Injection** | Node 2 transitioned to `stopping` | Executed `aws ec2 stop-instances` on `i-0449dbe5a6b329b75`. |
| **Failure Detection** | Node 2: `unused`<br>Reason: `Target.InvalidState` | ALB marked stopped instance as unusable. Single in-flight request returned `504 Gateway Time-out` during initial connection cutover. |
| **Failover State** | Node 1: `healthy`<br>Node 2: `unused` | 100% of incoming HTTP requests successfully redirected to healthy surviving node (`i-0b05e677c3bc3192c`) with zero client drops. |
| **Service Recovery** | Node 2 transitioned to `pending` / `running` | Executed `aws ec2 start-instances` on `i-0449dbe5a6b329b75`. |
| **Health Check Re-evaluation**| Node 2: `unhealthy` -> `healthy` | Instance completed boot; HTTP health checks passed 2 consecutive 200 OK probes on `/`. |
| **Full Restoration** | Node 1: `healthy`<br>Node 2: `healthy` | Perfect round-robin load distribution automatically restored across both nodes. |

## 3. Analysis & Mitigation Notes
- **Root Cause of Initial 504:** An initial `504 Gateway Time-out` was observed when the target stopped before connection draining completed.
- **Remediation & Hardening:**
  1. Reduce target group deregistration delay (connection draining) from default 300s down to 20s–30s for rapid connection termination.
  2. Implement an Auto Scaling Group (ASG) with ELB health checks to terminate degraded instances and spin up replacements automatically.
