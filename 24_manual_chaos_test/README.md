# Project 24: Manual Chaos Test

## 1. Goal
Record and validate recovery from failure under manual chaos testing, evaluating automated load balancer failover, connection draining, and post-restoration health recovery.

## 2. Test Summary
- **Target Node Terminated:** `i-0449dbe5a6b329b75`
- **Detection State:** `unused (Target.InvalidState)`
- **Failover Traffic:** Rerouted to surviving node `i-0b05e677c3bc3192c`
- **Restoration:** Successfully restarted and recovered to `healthy` state with round-robin traffic restored.

## 3. Deliverables
- `incident_notes.md`: Post-incident report documenting failure timeline, health status transitions, and resilience mitigations.
