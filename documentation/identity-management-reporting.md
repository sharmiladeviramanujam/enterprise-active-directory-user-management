# Identity Management Reporting

## Overview

The Identity Management Reporting component of the Northstar Technologies project provides a centralized summary of the fictional employee database.

The PowerShell script `Get-IdentityManagementReport.ps1` reads employee information from the CSV database and generates a text-based identity management summary.

This component is designed to demonstrate reporting and administrative visibility in an enterprise identity management environment.

## Script Details

| Property | Details |
|---|---|
| Script Name | `Get-IdentityManagementReport.ps1` |
| Location | `scripts/` |
| Input File | `data/employees.csv` |
| Output File | `reports/identity-management-summary.txt` |
| Execution Type | Reporting Only |

## Reporting Features

The script is designed to:

- Read employee records from the CSV database.
- Calculate the total number of employees.
- Count enabled employee accounts.
- Count disabled employee accounts.
- Display employee distribution by department.
- Display employee distribution by employment type.
- Check whether onboarding and offboarding report files are available.
- Generate a centralized text-based summary report.

## Report Structure

The generated report is designed to contain the following sections:

1. Report generation timestamp.
2. Total employee count.
3. Enabled account count.
4. Disabled account count.
5. Department distribution
