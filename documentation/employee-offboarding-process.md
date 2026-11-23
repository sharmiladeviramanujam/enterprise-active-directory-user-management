# Employee Offboarding Process

## 1. Overview

This document describes the employee offboarding workflow designed for Northstar Technologies.

The process provides a structured approach to employee account closure, access review, license management, device recovery and administrative approval.

The workflow is supported by a PowerShell planning script that prepares offboarding records from the employee database.

## 2. Objective

The objectives are to:

- Establish a consistent employee departure process.
- Identify employee accounts marked as Disabled.
- Prepare account disablement verification tasks.
- Review department security group memberships.
- Document Microsoft 365 access restrictions.
- Track license reassignment requirements.
- Record company device recovery.
- Maintain an auditable offboarding checklist.

## 3. Source Employee Database

The source file is:

`data/employees.csv`

The script identifies employees using the `AccountStatus` field.

| Account Status | Processing |
|---|---|
| Enabled | Not included in offboarding report |
| Disabled | Included in offboarding preparation |

## 4. Offboarding Automation Script

Script location:

`scripts/New-OffboardingPlan.ps1`

The script performs the following operations:

1. Checks whether the employee database exists.
2. Imports employee records.
3. Validates required CSV columns.
4. Identifies employees marked Disabled.
5. Prepares offboarding task records.
6. Creates the reports directory when needed.
7. Exports the offboarding report as CSV.
8. Displays a processing summary.

## 5. Offboarding Checklist

Each employee offboarding record includes:

| Task | Purpose |
|---|---|
| AD Account Disablement | Verify account disablement |
| Security Group Review | Review group memberships |
| Microsoft 365 Sign-in Restriction | Review cloud access restrictions |
| Session Revocation Review | Review active sessions |
| License Reassignment Review | Review assigned licenses |
| Mailbox and Data Ownership Review | Confirm business data ownership |
| Company Device Recovery | Track device return |
| Manager Confirmation | Record manager confirmation |
| Offboarding Approval | Track final approval |

## 6. Output Report

Expected output location:

`reports/offboarding-plan.csv`

The report includes employee identification information, department details, manager information, task statuses and overall progress.

All generated task statuses initially remain Pending or Verify, as appropriate.

## 7. Security Considerations

The offboarding process follows these principles:

- Timely access removal.
- Least-privilege access.
- Review of privileged group membership.
- Protection of organizational data.
- Controlled license reassignment.
- Documented administrative approval.
- Device recovery tracking.

Mailbox access, retention and data transfer must follow organizational policy and applicable authorization requirements.

## 8. Implementation Limitations

The current script is a planning and reporting tool.

It does not:

- Disable actual Active Directory accounts.
- Block real Microsoft 365 sign-ins.
- Revoke actual user sessions.
- Remove actual security group memberships.
- Reassign Microsoft 365 licenses.
- Recover physical company devices.

These operations require a properly configured environment, administrative permissions and approved procedures.

## 9. Testing Status

The script is maintained as source code in the GitHub repository.

Runtime execution and output verification are pending until a suitable PowerShell environment is available.

The current employee dataset contains 50 Enabled employee records. Therefore, no offboarding records are expected from the current dataset.

## 10. Expected Outcome

This workflow demonstrates an organized approach to employee offboarding and identity lifecycle management.

It provides a foundation for future integration with Active Directory Domain Services and Microsoft Entra ID.

---

**Project:** Enterprise Active Directory & Microsoft 365 User Lifecycle Management

**Organization:** Northstar Technologies

**Document:** Employee Offboarding Process
