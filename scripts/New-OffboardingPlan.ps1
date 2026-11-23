
# ============================================================
# Project : Northstar Technologies
# Script  : New-OffboardingPlan.ps1
# Purpose : Prepare employee offboarding plans
# Version : 1.0.0
# ============================================================

[CmdletBinding()]
param(
    [string]$CsvPath = (
        Join-Path $PSScriptRoot "..\data\employees.csv"
    ),

    [string]$OutputPath = (
        Join-Path $PSScriptRoot "..\reports\offboarding-plan.csv"
    )
)

$ErrorActionPreference = "Stop"

Write-Host "`nNORTHSTAR TECHNOLOGIES" -ForegroundColor Cyan
Write-Host "EMPLOYEE OFFBOARDING PREPARATION"
Write-Host "========================================"

try {

    # STEP 1: Verify employee database
    if (-not (Test-Path -LiteralPath $CsvPath -PathType Leaf)) {
        throw "Employee database not found: $CsvPath"
    }

    # STEP 2: Import employee records
    $Employees = @(Import-Csv -LiteralPath $CsvPath)

    if ($Employees.Count -eq 0) {
        throw "Employee database contains no records."
    }

    # STEP 3: Validate required columns
    $RequiredColumns = @(
        "EmployeeID",
        "FirstName",
        "LastName",
        "Username",
        "Email",
        "Department",
        "JobTitle",
        "Manager",
        "AccountStatus"
    )

    $ActualColumns = @(
        $Employees[0].PSObject.Properties.Name
    )

    foreach ($Column in $RequiredColumns) {
        if ($Column -notin $ActualColumns) {
            throw "Required column missing: $Column"
        }
    }

    # STEP 4: Identify disabled employee accounts
    $DisabledEmployees = @(
        $Employees | Where-Object {
            $_.AccountStatus.Trim() -eq "Disabled"
        }
    )

    if ($DisabledEmployees.Count -eq 0) {
        Write-Host "`nNo disabled employee accounts found." `
            -ForegroundColor Yellow

        Write-Host "No offboarding report was generated."
        Write-Host "The employee database remains unchanged."

        return
    }

    # STEP 5: Prepare offboarding records
    $OffboardingRecords = foreach ($Employee in $DisabledEmployees) {

        [PSCustomObject]@{
            EmployeeID                = $Employee.EmployeeID
            EmployeeName              = "$($Employee.FirstName) $($Employee.LastName)"
            Username                  = $Employee.Username
            Email                     = $Employee.Email
            Department                = $Employee.Department
            JobTitle                  = $Employee.JobTitle
            Manager                   = $Employee.Manager

            ADAccountDisablement      = "Verify"
            SecurityGroupReview       = "Pending"
            M365SignInRestriction     = "Pending"
            SessionRevocationReview   = "Pending"
            LicenseReassignmentReview = "Pending"
            MailboxDataOwnershipReview = "Pending"
            CompanyDeviceRecovery     = "Pending"
            ManagerConfirmation       = "Pending"
            OffboardingApproval       = "Pending"

            OverallStatus             = "Not Started"
            ExecutionMode             = "Planning Only"
        }
    }

    # STEP 6: Create reports directory
    $OutputDirectory = Split-Path -Parent $OutputPath

    if (-not (Test-Path -LiteralPath $OutputDirectory)) {
        New-Item -ItemType Directory `
            -Path $OutputDirectory `
            -Force | Out-Null
    }

    # STEP 7: Export offboarding report
    $OffboardingRecords |
        Export-Csv -LiteralPath $OutputPath `
            -NoTypeInformation `
            -Encoding UTF8

    # STEP 8: Display summary
    Write-Host "`nOFFBOARDING PREPARATION SUMMARY" `
        -ForegroundColor Green

    Write-Host "----------------------------------------"

    Write-Host "Total employees imported : $($Employees.Count)"
    Write-Host "Disabled employees       : $($DisabledEmployees.Count)"
    Write-Host "Offboarding records      : $($OffboardingRecords.Count)"
    Write-Host "Execution mode           : Planning Only"
    Write-Host "Output report            : $OutputPath"

    Write-Host "`nSUCCESS: Offboarding plans prepared." `
        -ForegroundColor Green

    Write-Host "No actual accounts or licenses were modified."
}
catch {
    Write-Error "OFFBOARDING PREPARATION FAILED: $($_.Exception.Message)"
    exit 1
}
