# Employee Database Design

## 1. Overview

This directory contains the fictional employee dataset used by the Northstar Technologies identity management simulation.

The employee records are designed to support bulk account provisioning, department-based access management, reporting, onboarding, and offboarding workflows.

## 2. Database Format

- Format: CSV
- Encoding: UTF-8
- Data type: Fictional employee information
- Expected records: 50
- Unique identifier: EmployeeID
- Unique login identifier: Username

## 3. Employee Attributes

| Attribute | Data Type | Required | Description |
|---|---|---|---|
| EmployeeID | String | Yes | Unique employee identifier |
| FirstName | String | Yes | Employee first name |
| LastName | String | Yes | Employee last name |
| Username | String | Yes | Unique login name |
| Email | String | Yes | Fictional company email |
| Department | String | Yes | Employee department |
| JobTitle | String | Yes | Employee job title |
| Manager | String | Yes | Manager username |
| Location | String | Yes | Office location |
| EmploymentType | String | Yes | FullTime or PartTime |
| HireDate | Date | Yes | Employment start date |
| AccountStatus | String | Yes | Enabled or Disabled |

## 4. Department Codes

| Department | Code |
|---|---|
| Human Resources | HR |
| Finance | FIN |
| Information Technology | IT |
| Sales | SAL |
| Management | MGT |

## 5. Data Validation Rules

1. EmployeeID must be unique.
2. Username must be unique.
3. Email must use the northstar.example domain.
4. Department must match an approved department.
5. HireDate must use YYYY-MM-DD format.
6. AccountStatus must be Enabled or Disabled.
7. Every manager reference must resolve to a valid employee account.
8. No real passwords or sensitive personal information may be stored in the dataset.

## 6. Data Usage

The employee CSV dataset will be consumed by PowerShell scripts for:

- Bulk user provisioning simulations.
- Employee account reporting.
- Department and security group mapping.
- Employee onboarding.
- Employee offboarding.
- Account validation.

**Important:** This is a simulation dataset, not a production employee database.
