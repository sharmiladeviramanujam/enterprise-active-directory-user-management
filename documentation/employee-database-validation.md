# Employee Database Validation

## 1. Overview

This document describes the validation framework used to maintain the integrity and consistency of the Northstar Technologies employee database.

The employee dataset contains 50 fictional employee records distributed across five organizational departments.

A PowerShell automation script, `Test-EmployeeDatabase.ps1`, validates the CSV dataset before it is used by employee lifecycle management workflows.

## 2. Validation Objectives

- Ensure employee records contain all required attributes.
- Identify missing employee information.
- Prevent duplicate employee identifiers.
- Prevent duplicate usernames and email addresses.
- Validate department assignments.
- Verify fictional company email addresses.
- Validate employment types and account statuses.
- Verify manager references.
- Confirm the expected employee count.

## 3. Required Employee Attributes

| Attribute | Validation |
|---|---|
| EmployeeID | Must be present and unique |
| FirstName | Must not be empty |
| LastName | Must not be empty |
| Username | Must be present and unique |
| Email | Must use northstar.example |
| Department | Must match an approved department |
| JobTitle | Must not be empty |
| Manager | Must reference an existing employee when provided |
| Location | Must not be empty |
| EmploymentType | FullTime or PartTime |
| HireDate | YYYY-MM-DD format |
| AccountStatus | Enabled or Disabled |

## 4. Department Validation

The following departments are approved:

| Department | Expected Employees |
|---|---:|
| Human Resources | 8 |
| Finance | 8 |
| Information Technology | 10 |
| Sales | 14 |
| Management | 10 |
| **Total** | **50** |

## 5. Duplicate Detection

The validation script checks three unique attributes:

- EmployeeID
- Username
- Email

Duplicate records are reported as validation errors.

## 6. Manager Reference Validation

Every non-empty manager field must reference an existing employee username.

This prevents invalid reporting relationships in the employee dataset.

## 7. Automation Script

**Script:** `scripts/Test-EmployeeDatabase.ps1`

The script uses built-in PowerShell functionality to:

1. Import employee records from CSV.
2. Validate required columns.
3. Detect missing values.
4. Identify duplicate records.
5. Validate departments and email addresses.
6. Validate employment attributes.
7. Check manager references.
8. Generate a validation summary.

## 8. Expected Validation Results

| Test | Expected Result |
|---|---|
| CSV file availability | PASS |
| Required columns | PASS |
| Required employee fields | PASS |
| Unique employee IDs | PASS |
| Unique usernames | PASS |
| Unique email addresses | PASS |
| Approved departments | PASS |
| Email format | PASS |
| Employment type | PASS |
| Account status | PASS |
| Manager references | PASS |
| Employee record count | 50 |

These are expected results, not verified execution results. Actual results will be recorded after the script is executed.

## 9. Error Handling

The validation process identifies:

- Missing CSV files.
- Empty employee datasets.
- Missing required columns.
- Duplicate identifiers.
- Invalid department values.
- Invalid email addresses.
- Invalid employment attributes.
- Missing manager references.
- Unexpected employee counts.

Validation errors cause the script to return a failure exit code.

## 10. Security Considerations

- Only fictional employee information is used.
- No passwords are stored in the CSV.
- No real employee personal information is included.
- The dataset is intended for demonstration and testing.

## 11. Implementation Status

| Component | Status |
|---|---|
| Employee CSV design | Completed |
| Employee dataset | Prepared |
| Validation script | Uploaded |
| Validation documentation | Prepared |
| Script execution testing | Pending |

**Project:** Northstar Technologies Identity Management Lab

**Documentation Version:** 1.0.0
