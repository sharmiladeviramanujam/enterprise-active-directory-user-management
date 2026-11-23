# Employee Onboarding Process

## 1. Overview

The Employee Onboarding component of the Northstar Technologies project documents a structured process for introducing new employees into the organization's identity management environment.

The process uses the fictional employee database to prepare onboarding information, identify department-based group assignments, and outline the steps required for account provisioning.

This is a portfolio-based automation design. It does not provision accounts in a live Active Directory domain or Microsoft 365 tenant.

## 2. Onboarding Objectives

The onboarding process is designed to:

- Maintain consistent employee identity information.
- Validate employee records before onboarding.
- Identify the appropriate department.
- Determine the employee's proposed organizational unit (OU).
- Identify department-based security group assignments.
- Prepare account provisioning information.
- Document Microsoft 365 account provisioning requirements.
- Maintain a structured onboarding workflow.

## 3. Employee Information

The onboarding process uses employee records from:

`data/employees.csv`

The database contains the following information:

| Field | Description |
|---|---|
| EmployeeID | Unique employee identifier |
| FirstName | Employee first name |
| LastName | Employee last name |
| Username | Proposed account username |
| Email | Fictional organizational email address |
| Department | Employee department |
| JobTitle | Employee job title |
| Manager | Reporting manager |
| Location | Employee work location |
| EmploymentType | Employment classification |
| HireDate | Employee joining date |
| AccountStatus | Employee account status |

## 4. Onboarding Workflow

The proposed onboarding workflow consists of the following stages.

### Stage 1 — Employee Record Validation

- Review the employee information.
- Verify required fields.
- Check username and email formats.
- Validate department information.
- Confirm that the employee record is suitable for onboarding.

The validation process is documented in `employee-database-validation.md`.

### Stage 2 — Identity Preparation

- Identify the employee's unique Employee ID.
- Prepare the proposed username.
- Identify the employee's department.
- Identify the reporting manager.
- Confirm the employee's work location.

### Stage 3 — Organizational Unit Assignment

The proposed OU structure follows the Active Directory design:

| Department | Proposed OU |
|---|---|
| Human Resources | HR |
| Finance | Finance |
| Information Technology | IT |
| Sales | Sales |
| Management | Management |

### Stage 4 — Security Group Assignment

Department-based security groups are identified according to the employee's department.

| Department | Proposed Security Group |
|---|---|
| Human Resources | GG_HR_Users |
| Finance | GG_FIN_Users |
| Information Technology | GG_IT_Users |
| Sales | GG_SAL_Users |
| Management | GG_MGT_Users |

All employees are also associated with the proposed `GG_All_Employees` group.

Additional role-based groups are assigned only when justified by the employee's responsibilities and approved access requirements.

### Stage 5 — Active Directory Account Provisioning

In a production environment, an authorized administrator would:

- Create the user account.
- Apply the approved username.
- Place the account in the appropriate OU.
- Assign approved security groups.
- Apply organizational account policies.
- Verify the account configuration.

These actions are documented as proposed procedures and are not executed against a live domain in this project.

### Stage 6 — Microsoft 365 Account Provisioning

In a production environment, the Microsoft 365 onboarding process would include:

- Creating or assigning the organizational cloud identity.
- Assigning an approved license.
- Configuring the required services.
- Applying appropriate access policies.
- Verifying account availability.

Live Microsoft 365 integration is not configured in this project.

### Stage 7 — Onboarding Verification

Before completing onboarding, an administrator should verify:

- Employee information is accurate.
- Username is correct.
- Department assignment is appropriate.
- Proposed group assignments are approved.
- Required access is documented.
- Account provisioning tasks are completed in the production environment.

## 5. Automation Script

The onboarding planning component is implemented through:

` scripts/New-OnboardingPlan.ps1 `

The script is designed to read the employee database and prepare onboarding plan information for eligible employee records.

Its intended responsibilities include:

- Reading employee records.
- Identifying eligible employees.
- Mapping departments to proposed security groups.
- Preparing onboarding task information.
- Generating an onboarding planning report.

The script is a source-code deliverable and is not connected to a live Active Directory or Microsoft 365 environment.

## 6. Security Considerations

The onboarding process follows these security principles:

- Use unique employee identities.
- Assign only approved access.
- Follow the principle of least privilege.
- Separate standard user access from administrative access.
- Validate employee records before provisioning.
- Require appropriate authorization for account creation and access changes.
- Maintain onboarding records for administrative review.

## 7. Project Scope and Limitations

This project demonstrates an identity management workflow using fictional employee records and PowerShell automation source code.

| Component | Scope |
|---|---|
| Employee Database | Fictional CSV records |
| Employee Validation | PowerShell source code |
| Onboarding Planning | PowerShell source code |
| OU Assignment | Proposed design |
| Security Group Assignment | Proposed design |
| Active Directory Provisioning | Not implemented |
| Microsoft 365 Provisioning | Not implemented |
| Live Account Verification | Not configured |

## 8. Conclusion

The employee onboarding process provides a structured approach to preparing employee identities, organizational placement, security group assignments, and account provisioning requirements.

It demonstrates how onboarding activities can be organized and prepared for automation in an enterprise identity management environment.
