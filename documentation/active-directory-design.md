# Active Directory Design

## 1. Domain Configuration

| Attribute | Configuration |
|---|---|
| Domain Name | northstar.local |
| NetBIOS Name | NORTHSTAR |
| Domain Controller | NS-DC01 |
| Server Design | Windows Server 2025 |
| Functional Design | Windows Server 2025 |
| Client Design | Windows 11 |

These are proposed lab configuration values, not a deployed domain.

## 2. Organizational Unit Structure

```text
northstar.local
└── Northstar
    ├── Users
    │   ├── HR
    │   ├── Finance
    │   ├── IT
    │   ├── Sales
    │   └── Management
    ├── Groups
    ├── Computers
    ├── Servers
    ├── Service Accounts
    └── Disabled Accounts
```

## 3. Account Naming Convention

- Username: firstname.lastname
- Employee ID: NST0001 to NST0050
- Workstation: NS-PC-001
- Server: NS-SRV-001
- Domain Controller: NS-DC01

## 4. Administrative Principles

- Apply least-privilege access.
- Separate standard and administrative accounts.
- Organize users according to department.
- Use security groups for access assignments.
- Separate computer accounts from user accounts.
- Review inactive accounts regularly.
- Restrict administrative access according to responsibility.

## 5. Implementation Status

Architecture: Designed

Live Active Directory Deployment: Not performed

Implementation Type: PowerShell simulation and technical design.
