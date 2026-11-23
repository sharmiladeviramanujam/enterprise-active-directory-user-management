
# ============================================================
# Project : Northstar Technologies
# Script  : Get-IdentityManagementReport.ps1
# Purpose : Generate identity management summary reports
# Version : 1.0.0
# ============================================================

[CmdletBinding()]
param(
    [string]$CsvPath = (
        Join-Path $PSScriptRoot "..\data\employees.csv"
    ),

    [string]$OutputPath = (
        Join-Path $PSScriptRoot "..\reports\identity-management-summary.txt"
    )
)

$ErrorActionPreference = "Stop"

try {
    Write-Host "`nNORTHSTAR TECHNOLOGIES" -ForegroundColor Cyan
    Write-Host "IDENTITY MANAGEMENT REPORT"
    Write-Host "========================================"

    # STEP 1: Validate source file
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
        "Department",
        "EmploymentType",
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

    # STEP 4: Calculate account statistics
    $TotalEmployees = $Employees.Count

    $EnabledAccounts = @(
        $Employees | Where-Object {
            $_.AccountStatus.Trim() -eq "Enabled"
        }
    ).Count

    $DisabledAccounts = @(
        $Employees | Where-Object {
            $_.AccountStatus.Trim() -eq "Disabled"
        }
    ).Count

    # STEP 5: Prepare report content
    $Report = @()

    $Report += "NORTHSTAR TECHNOLOGIES"
    $Report += "IDENTITY MANAGEMENT SUMMARY"
    $Report += "Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    $Report += "========================================"
    $Report += ""
    $Report += "EMPLOYEE SUMMARY"
    $Report += "----------------"
    $Report += "Total Employees: $TotalEmployees"
    $Report += "Enabled Accounts: $EnabledAccounts"
    $Report += "Disabled Accounts: $DisabledAccounts"
    $Report += ""

    $Report += "DEPARTMENT DISTRIBUTION"
    $Report += "-----------------------"

    foreach ($Department in (
        $Employees | Group-Object Department | Sort-Object Name
    )) {
        $Report += "$($Department.Name): $($Department.Count)"
    }

    $Report += ""
    $Report += "EMPLOYMENT TYPE DISTRIBUTION"
    $Report += "----------------------------"

    foreach ($Type in (
        $Employees | Group-Object EmploymentType | Sort-Object Name
    )) {
        $Report += "$($Type.Name): $($Type.Count)"
    }

    $Report += ""
    $Report += "LIFECYCLE REPORT AVAILABILITY"
    $Report += "-----------------------------"

    $ReportsDirectory = Split-Path -Parent $OutputPath

    $OnboardingReport = Join-Path $ReportsDirectory "onboarding-plan.csv"
    $OffboardingReport = Join-Path $ReportsDirectory "offboarding-plan.csv"

    if (Test-Path -LiteralPath $OnboardingReport) {
        $Report += "Onboarding Report: Available"
    }
    else {
        $Report += "Onboarding Report: Not Generated"
    }

    if (Test-Path -LiteralPath $OffboardingReport) {
        $Report += "Offboarding Report: Available"
    }
    else {
        $Report += "Offboarding Report: Not Generated"
    }

    $Report += ""
    $Report += "IMPLEMENTATION STATUS"
    $Report += "---------------------"
    $Report += "Execution Mode: Reporting Only"
    $Report += "Live AD Integration: Not Configured"
    $Report += "Live Microsoft 365 Integration: Not Configured"

    # STEP 6: Create output directory
    if (-not (Test-Path -LiteralPath $ReportsDirectory)) {
        New-Item -ItemType Directory `
            -Path $ReportsDirectory `
            -Force | Out-Null
    }

    # STEP 7: Export report
    $Report | Set-Content -LiteralPath $OutputPath -Encoding UTF8

    # STEP 8: Display summary
    Write-Host "`nREPORT SUMMARY" -ForegroundColor Green
    Write-Host "Total Employees : $TotalEmployees"
    Write-Host "Enabled Accounts: $EnabledAccounts"
    Write-Host "Disabled Accounts: $DisabledAccounts"
    Write-Host "Output File     : $OutputPath"

    Write-Host "`nSUCCESS: Identity report prepared." `
        -ForegroundColor Green

    Write-Host "No actual accounts or permissions were modified."
}
catch {
    Write-Error "REPORT GENERATION FAILED: $($_.Exception.Message)"
    exit 1
}
