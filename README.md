# Enterprise Active Directory & Microsoft 365 User Lifecycle Management

## Project Overview

The **Enterprise Active Directory & Microsoft 365 User Lifecycle Management** project demonstrates the design and planning of an enterprise identity management environment for a fictional organization, Northstar Technologies.

The project focuses on employee identity management, employee database validation, onboarding and offboarding workflows, organizational unit design, security group management, and centralized reporting using PowerShell automation source code.

It demonstrates how identity lifecycle processes can be structured and prepared for automation in a corporate IT environment.

## Organization Profile

| Property | Details |
|---|---|
| Organization | Northstar Technologies |
| Industry | Technology |
| Location | Coimbatore, India |
| Employees | 50 fictional employees |
| Domain Design | northstar.local |
| NetBIOS Name | NORTHSTAR |
| Domain Controller Design | NS-DC01 |
| Server Platform Design | Windows Server 2025 |
| Client Platform Design | Windows 11 |
| Identity Management | Active Directory and Microsoft 365 |

## Project Objectives

- Design an enterprise Active Directory organizational structure.
- Create a structured fictional employee database.
- Validate employee identity records using PowerShell.
- Prepare employee onboarding workflows.
- Prepare employee offboarding workflows.
- Design department-based security groups.
- Apply the AGDLP group management model.
- Generate centralized identity management reporting.
- Document identity lifecycle management procedures.

## Repository Structure

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
│   ├── active-directory-design.md
│   ├── employee-database-validation.md
│   ├── employee-onboarding-process.md
│   ├── employee-offboarding-process.md
│   ├── identity-management-reporting.md
│   └── project-overview.md
│
├── scripts/
│   ├── Test-EmployeeDatabase.ps1
│   ├── New-OnboardingPlan.ps1
│   ├── New-OffboardingPlan.ps1
│   └── Get-IdentityManagementReport.ps1
│
├── reports/
│
├── .gitignore
└── README.md
```

*Note: The reports directory is intended for generated output. It may not appear in GitHub until it contains a tracked file.*

## Employee Database

The project includes a fictional employee database containing 50 employee records.

| Department | Employee Count |
|---|---:|
| Human Resources | 8 |
| Finance | 8 |
| Information Technology | 10 |
| Sales | 14 |
| Management | 10 |
| **Total** | **50** |

The employee database includes:

- Employee ID
- First and last name
- Username
- Email address
- Department
- Job title
- Reporting manager
- Location
- Employment type
- Hire date
- Account status

All employee information is fictional and intended for demonstration purposes.

## Active Directory Design

The proposed Active Directory environment uses the domain:

`northstar.local`

The organizational structure is designed to separate users, groups, computers, servers, service accounts, and disabled accounts.

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

## Security Group Management

Department-based security groups are designed to organize employee access.

| Department | Security Group |
|---|---|
| Human Resources | GG_HR_Users |
| Finance | GG_FIN_Users |
| Information Technology | GG_IT_Users |
| Sales | GG_SAL_Users |
| Management | GG_MGT_Users |

Additional groups include:

- GG_All_Employees
- GG_IT_Helpdesk
- GG_IT_Admins
- GG_HR_Managers
- GG_FIN_Managers

The project documents the AGDLP (Accounts → Global Groups → Domain Local Groups → Permissions) model for structured access management.

## PowerShell Automation

The project includes the following PowerShell source-code deliverables.

### 1. Employee Database Validation

**Script:** `Test-EmployeeDatabase.ps1`

Designed to:

- Validate required CSV columns.
- Check employee records.
- Validate usernames and email addresses.
- Verify department values.
- Check employee account statuses.
- Identify data quality issues.

### 2. Employee Onboarding Planning

**Script:** `New-OnboardingPlan.ps1`

Designed to:

- Identify eligible employee records.
- Prepare onboarding task information.
- Map departments to proposed security groups.
- Generate onboarding planning output.

### 3. Employee Offboarding Planning

**Script:** `New-OffboardingPlan.ps1`

Designed to:

- Identify employees marked as disabled.
- Prepare offboarding task information.
- Document access removal requirements.
- Generate offboarding planning output.

### 4. Centralized Identity Management Reporting

**Script:** `Get-IdentityManagementReport.ps1`

Designed to:

- Summarize employee records.
- Count enabled and disabled accounts.
- Display department distribution.
- Display employment type distribution.
- Check onboarding and offboarding report availability.
- Generate a centralized text report.

## Documentation

The `documentation/` directory contains detailed project documentation covering:

- Active Directory architecture and design.
- Employee database validation.
- Employee onboarding procedures.
- Employee offboarding procedures.
- Identity management reporting.
- Overall project scope and objectives.

## Technologies and Concepts

| Technology / Concept | Purpose |
|---|---|
| PowerShell | Identity management automation source code |
| Active Directory | Directory services architecture design |
| Microsoft 365 | Cloud identity lifecycle planning |
| CSV | Employee database storage |
| JSON | Project configuration |
| GitHub | Source code and documentation management |
| AGDLP | Security group management model |
| Windows Server 2025 | Proposed server platform |
| Windows 11 | Proposed client platform |

## Project Scope and Limitations

This is a portfolio-based identity management design and automation project.

The repository contains documentation, fictional employee data, and PowerShell source code prepared for execution in a suitable PowerShell environment.

**The project does not currently include:**

- A deployed Windows Server domain controller.
- A live Active Directory domain.
- Live Active Directory user provisioning.
- A connected Microsoft 365 tenant.
- Live Microsoft 365 account provisioning.
- Live account or permission modification.

The PowerShell scripts are source-code deliverables. Their execution and runtime validation are separate from uploading them to GitHub.

## Learning Outcomes

This project demonstrates knowledge of:

- Enterprise identity management concepts.
- Active Directory architecture.
- Organizational Unit planning.
- Security group management.
- Employee lifecycle workflows.
- PowerShell scripting concepts.
- CSV data validation.
- Identity management reporting.
- GitHub repository organization and documentation.

## Disclaimer

Northstar Technologies is a fictional organization created for educational and portfolio demonstration purposes.

All employee records, usernames, email addresses, and infrastructure details are fictional.

This project is not connected to a production Active Directory environment or Microsoft 365 tenant.
