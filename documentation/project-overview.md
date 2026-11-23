# Enterprise Active Directory & Microsoft 365 User Lifecycle Management

## 1. Project Overview

The **Enterprise Active Directory & Microsoft 365 User Lifecycle Management** project is an enterprise IT administration lab designed to demonstrate employee identity management, account lifecycle planning, department-based access control, and administrative automation using PowerShell.

The project uses a fictional organization, Northstar Technologies, to model how an IT department manages employee identities throughout their employment lifecycle.

The lab focuses on structured identity-management workflows, employee database validation, Active Directory architecture design, security group planning, onboarding preparation, and offboarding procedures.

**Project Type:** Enterprise IT Administration Lab

**Organization:** Northstar Technologies

**Location:** Coimbatore, India

## 2. Project Objectives

- Design a structured Active Directory environment.
- Maintain a centralized employee database.
- Validate employee records using PowerShell.
- Develop employee onboarding automation.
- Design department-based security group assignments.
- Document Microsoft 365 and Entra ID provisioning workflows.
- Establish employee account lifecycle procedures.
- Apply identity security and access management principles.
- Generate structured administrative reports.

## 3. Organization Scenario

Northstar Technologies is a fictional company with 50 employees distributed across five departments.

| Department | Employees |
|---|---:|
| HR | 8 |
| Finance | 8 |
| IT | 10 |
| Sales | 14 |
| Management | 10 |
| **Total** | **50** |

The company requires a centralized identity-management approach to organize employee accounts, department memberships, and access-management procedures.

All employee records used in this project are fictional.

## 4. Technology Stack

| Technology | Purpose |
|---|---|
| Windows Server 2025 | Target server platform in the lab design |
| Active Directory Domain Services | Identity and directory architecture |
| Microsoft Entra ID | Cloud identity-management design |
| Microsoft 365 | Productivity account provisioning design |
| PowerShell | Administrative automation scripts |
| CSV | Employee database and report format |
| JSON | Centralized project configuration |
| GitHub | Source code and documentation management |

**Implementation note:** This is a design and automation portfolio lab. It does not represent a deployed Windows Server domain or a live Microsoft 365 tenant.

## 5. Active Directory Environment Design

The proposed Active Directory domain is:

- Domain Name: `northstar.local`
- NetBIOS Name: `NORTHSTAR`
- Domain Controller: `NS-DC01`
- Server Platform: Windows Server 2025
- Client Platform: Windows 11

### Proposed Organizational Unit Structure

```text
northstar.local
│
└── Northstar
    │
    ├── Users
    │   ├── HR
    │   ├── Finance
    │   ├── IT
    │   ├── Sales
    │   └── Management
    │
    ├── Groups
    ├── Computers
    ├── Servers
    ├── Service Accounts
    └── Disabled Accounts
```

This structure is a proposed directory design, not an existing live Active Directory environment.

## 6. Employee Database Management

The project maintains a centralized employee database in:

`data/employees.csv`

The database contains employee information such as:

- Employee ID
- First Name
- Last Name
- Username
- Email Address
- Department
- Job Title
- Manager
- Hire Date
- Employment Type
- Account Status

Employee IDs follow the format `NST0001` through `NST0050`.

Usernames follow the format `firstname.lastname`.

The fictional email domain is `northstar.example`.

## 7. PowerShell Automation

### Employee Database Validation

Script:

`scripts/Test-EmployeeDatabase.ps1`

The validation script is designed to check:

- Required CSV columns.
- Missing employee information.
- Duplicate employee IDs.
- Duplicate usernames.
- Duplicate email addresses.
- Department validity.
- Email address format.
- Manager references.
- Account status and employment type.

### Employee Onboarding Preparation

Script:

`scripts/New-OnboardingPlan.ps1`

The onboarding preparation script is designed to:

- Import employee records.
- Identify active employees.
- Prepare proposed Active Directory account attributes.
- Recommend department-based security groups.
- Prepare Microsoft 365 provisioning task statuses.
- Generate a structured onboarding CSV report.

The current implementation prepares provisioning information only. It does not create actual Active Directory accounts, Microsoft 365 accounts, or licenses.

## 8. Security Group Design

Department-based security groups are proposed to organize employee access.

| Department | Security Group |
|---|---|
| HR | GG_HR_Users |
| Finance | GG_FIN_Users |
| IT | GG_IT_Users |
| Sales | GG_SAL_Users |
| Management | GG_MGT_Users |

Additional proposed groups include:

- `GG_All_Employees`
- `GG_IT_Helpdesk`
- `GG_IT_Admins`
- `GG_HR_Managers`
- `GG_FIN_Managers`

The project follows the AGDLP access-management design principle: Accounts → Global Groups → Domain Local Groups → Permissions.

## 9. Employee Lifecycle Management

The proposed lifecycle includes:

### Onboarding
- Validate employee information.
- Prepare identity attributes.
- Determine department group membership.
- Prepare account and license provisioning tasks.
- Track onboarding progress.

### Role Changes
- Review employee department and job role.
- Reassess group membership.
- Update proposed access assignments.
- Document approval and verification.

### Offboarding
- Review employee departure information.
- Prepare account disablement tasks.
- Identify access removal requirements.
- Document mailbox and data ownership review.
- Track offboarding completion.

These are documented workflows and planned automation capabilities unless explicitly implemented and tested.

## 10. Repository Structure

```text
enterprise-active-directory-user-management/
│
├── config/
│   └── project-config.json
│
├── data/
│   ├── employees.csv
│   ├── department-groups.csv
│   └── README.md
│
├── documentation/
│   ├── project-overview.md
│   └── active-directory-design.md
│
├── scripts/
│   ├── Test-EmployeeDatabase.ps1
│   └── New-OnboardingPlan.ps1
│
├── reports/
│   └── Generated reports will be stored here
│
└── README.md
```

Repository contents may evolve as additional scripts and documentation are implemented.

## 11. Security Considerations

The project demonstrates the following identity-security principles:

- Least-privilege access.
- Department-based access control.
- Separation of administrative responsibilities.
- Employee account lifecycle tracking.
- Validation of identity data.
- Controlled privileged-group membership.
- Secure handling of account information.

No real employee credentials, passwords, or confidential company information are included.

## 12. Project Limitations

This portfolio project is currently implemented as a design and automation lab.

The following capabilities require a suitable Windows Server or cloud environment and have not been established as live services:

- Active Directory domain deployment.
- Actual user account creation.
- Live security group assignment.
- Microsoft Entra ID synchronization.
- Microsoft 365 license assignment.
- Live account disablement and access revocation.

PowerShell scripts are maintained as source code in GitHub. Uploading a script does not mean it has been executed or successfully tested.

## 13. Expected Learning Outcomes

This project demonstrates practical understanding of:

- Active Directory architecture.
- Organizational Unit design.
- Employee identity administration.
- PowerShell scripting.
- CSV data management.
- Security group planning.
- Microsoft 365 identity lifecycle concepts.
- IT documentation.
- Enterprise access management.

## 14. Project Status

The project is being developed incrementally.

Implemented source files, documented designs, generated reports, and tested execution results will be identified separately as the project progresses.

---

**Project:** Enterprise Active Directory & Microsoft 365 User Lifecycle Management

**Organization:** Northstar Technologies

**Purpose:** IT Administration and Identity Management Portfolio Lab
