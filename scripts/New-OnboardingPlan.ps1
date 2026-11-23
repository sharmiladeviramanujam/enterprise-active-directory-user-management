
<#
.SYNOPSIS
    Enterprise employee onboarding preparation automation.

.DESCRIPTION
    Validates employee records and generates structured onboarding
    plans for enabled Northstar Technologies employees.

    This version prepares provisioning data only.
    It does not create actual Active Directory or Microsoft 365 accounts.

.AUTHOR
    Northstar Technologies - IT Administration Lab

.VERSION
    1.1.0
#>

[CmdletBinding()]
param(
    [string]$InputPath = (
        Join-Path $PSScriptRoot "..\data\employees.csv"
    ),

    [string]$OutputPath = (
        Join-Path $PSScriptRoot "..\reports\onboarding-plan.csv"
    )
)

$ErrorActionPreference = "Stop"

# Department-to-security-group mapping
$DepartmentGroups = @{
    "Human Resources"        = "GG_HR_Users"
    "Finance"                = "GG_FIN_Users"
    "Information Technology" = "GG_IT_Users"
    "Sales"                  = "GG_SAL_Users"
    "Management"             = "GG_MGT_Users"
}

# Department-to-OU mapping
$DepartmentOUs = @{
    "Human Resources"        = "HR"
    "Finance"                = "Finance"
    "Information Technology" = "IT"
    "Sales"                  = "Sales"
    "Management"             = "Management"
}

# Required employee database fields
$RequiredColumns = @(
    "EmployeeID",
    "FirstName",
    "LastName",
    "Username",
    "Email",
    "Department",
    "JobTitle",
    "AccountStatus"
)

try {
    Write-Host "`nNORTHSTAR TECHNOLOGIES" -ForegroundColor Cyan
    Write-Host "EMPLOYEE ONBOARDING PREPARATION"
    Write-Host "========================================"

    # STEP 1: Check input file
    if (-not (Test-Path -LiteralPath $InputPath -PathType Leaf)) {
        throw "Employee database not found: $InputPath"
    }

    # STEP 2: Import employee database
    $Employees = @(Import-Csv -LiteralPath $InputPath)

    if ($Employees.Count -eq 0) {
        throw "Employee database contains no records."
    }

    # STEP 3: Validate required columns
    $ActualColumns = @(
        $Employees[0].PSObject.Properties.Name
    )

    foreach ($Column in $RequiredColumns) {
        if ($Column -notin $ActualColumns) {
            throw "Required column missing: $Column"
        }
    }

    # STEP 4: Identify enabled employees
    $ActiveEmployees = @(
        $Employees | Where-Object {
            ([string]$_.AccountStatus).Trim() -eq "Enabled"
        }
    )

    if ($ActiveEmployees.Count -eq 0) {
        throw "No enabled employees found."
    }

    # STEP 5: Prepare onboarding records
    $OnboardingRecords = foreach ($Employee in $ActiveEmployees) {

        $Department = ([string]$Employee.Department).Trim()

        if (-not $DepartmentGroups.ContainsKey($Department)) {
            throw "Unknown department for employee $($Employee.EmployeeID): $Department"
        }

        if (-not $DepartmentOUs.ContainsKey($Department)) {
            throw "OU mapping not found for department: $Department"
        }

        $FullName = "$(([string]$Employee.FirstName).Trim()) $(([string]$Employee.LastName).Trim())"

        [PSCustomObject]@{
            EmployeeID              = $Employee.EmployeeID
            EmployeeName            = $FullName
            Username                = $Employee.Username
            Email                   = $Employee.Email
            Department              = $Department
            JobTitle                = $Employee.JobTitle

            ProposedADDomain        = "northstar.local"

            ProposedOU              = "OU=$($DepartmentOUs[$Department]),OU=Users,OU=Northstar,DC=northstar,DC=local"

            RecommendedGroup        = $DepartmentGroups[$Department]

            ADAccountCreation       = "Pending"
            SecurityGroupAssignment = "Pending"
            M365AccountProvisioning = "Pending"
            LicenseAssignment       = "Pending"
            ComputerPreparation     = "Pending"
            AccessVerification      = "Pending"

            OverallStatus           = "Not Started"
            ExecutionMode           = "Planning Only"
        }
    }

    # STEP 6: Prepare output directory
    $OutputDirectory = Split-Path -Parent $OutputPath

    if (-not (Test-Path -LiteralPath $OutputDirectory)) {
        New-Item -ItemType Directory `
            -Path $OutputDirectory `
            -Force | Out-Null
    }

    # STEP 7: Export onboarding report
    $OnboardingRecords |
        Export-Csv -LiteralPath $OutputPath `
            -NoTypeInformation `
            -Encoding UTF8

    # STEP 8: Display summary
    Write-Host "`nONBOARDING PREPARATION SUMMARY" `
        -ForegroundColor Green

    Write-Host "----------------------------------------"

    Write-Host "Total employees imported : $($Employees.Count)"
    Write-Host "Enabled employees        : $($ActiveEmployees.Count)"
    Write-Host "Onboarding records       : $($OnboardingRecords.Count)"
    Write-Host "Execution mode           : Planning Only"
    Write-Host "Output report            : $OutputPath"

    Write-Host "`nDEPARTMENT SUMMARY"

    $OnboardingRecords |
        Group-Object Department |
        Sort-Object Name |
        Select-Object Name, Count |
        Format-Table -AutoSize

    Write-Host "`nSUCCESS: Onboarding preparation completed." `
        -ForegroundColor Green

    Write-Host "No actual accounts or licenses were created."
}
catch {
    Write-Error "ONBOARDING PREPARATION FAILED: $($_.Exception.Message)"
    exit 1
}
