#
# Script module for module 'Az.Sql' that is executed when 'Az.Sql' is imported in a PowerShell session.
#
# Generated by: Microsoft Corporation
#
# Generated on: 02/02/2022 12:52:03
#

$PSDefaultParameterValues.Clear()
Set-StrictMode -Version Latest

function Test-DotNet
{
    try
    {
        if ((Get-PSDrive 'HKLM' -ErrorAction Ignore) -and (-not (Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\' -ErrorAction Stop | Get-ItemPropertyValue -ErrorAction Stop -Name Release | Where-Object { $_ -ge 461808 })))
        {
            throw ".NET Framework versions lower than 4.7.2 are not supported in Az.  Please upgrade to .NET Framework 4.7.2 or higher."
        }
    }
    catch [System.Management.Automation.DriveNotFoundException]
    {
        Write-Verbose ".NET Framework version check failed."
    }
}

function Preload-Assembly {
    param (
        [string]
        $AssemblyDirectory
    )
    if($PSEdition -eq 'Desktop' -and (Test-Path $AssemblyDirectory -ErrorAction Ignore))
    {
        try
        {
            Get-ChildItem -ErrorAction Stop -Path $AssemblyDirectory -Filter "*.dll" | ForEach-Object {
                try
                {
                    Add-Type -Path $_.FullName -ErrorAction Ignore | Out-Null
                }
                catch {
                    Write-Verbose $_
                }
            }
        }
        catch {}
    }    
}

if ($true -and ($PSEdition -eq 'Desktop'))
{
    if ($PSVersionTable.PSVersion -lt [Version]'5.1')
    {
        throw "PowerShell versions lower than 5.1 are not supported in Az. Please upgrade to PowerShell 5.1 or higher."
    }

    Test-DotNet
}

if ($true -and ($PSEdition -eq 'Core'))
{
    if ($PSVersionTable.PSVersion -lt [Version]'6.2.4')
    {
        throw "Current Az version doesn't support PowerShell Core versions lower than 6.2.4. Please upgrade to PowerShell Core 6.2.4 or higher."
    }
}

if (Test-Path -Path "$PSScriptRoot\StartupScripts" -ErrorAction Ignore)
{
    Get-ChildItem "$PSScriptRoot\StartupScripts" -ErrorAction Stop | ForEach-Object {
        . $_.FullName
    }
}

if (Get-Module AzureRM.profile -ErrorAction Ignore)
{
    Write-Warning ("AzureRM.Profile already loaded. Az and AzureRM modules cannot be imported in the same session or used in the same script or runbook. If you are running PowerShell in an environment you control you can use the 'Uninstall-AzureRm' cmdlet to remove all AzureRm modules from your machine. " +
        "If you are running in Azure Automation, take care that none of your runbooks import both Az and AzureRM modules. More information can be found here: https://aka.ms/azps-migration-guide.")
    throw ("AzureRM.Profile already loaded. Az and AzureRM modules cannot be imported in the same session or used in the same script or runbook. If you are running PowerShell in an environment you control you can use the 'Uninstall-AzureRm' cmdlet to remove all AzureRm modules from your machine. " +
        "If you are running in Azure Automation, take care that none of your runbooks import both Az and AzureRM modules. More information can be found here: https://aka.ms/azps-migration-guide.")
}

$preloadPath = (Join-Path $PSScriptRoot -ChildPath "PreloadAssemblies")
Preload-Assembly -AssemblyDirectory $preloadPath
$preloadPath = (Join-Path $PSScriptRoot -ChildPath "ModuleAlcAssemblies")
Preload-Assembly -AssemblyDirectory $preloadPath

$netCorePath = (Join-Path $PSScriptRoot -ChildPath "NetCoreAssemblies")
if($PSEdition -eq 'Core' -and (Test-Path $netCorePath -ErrorAction Ignore))
{
    try
    {
        $loadedAssemblies = ([System.AppDomain]::CurrentDomain.GetAssemblies() | ForEach-Object {New-Object -TypeName System.Reflection.AssemblyName -ArgumentList $_.FullName} )
        Get-ChildItem -ErrorAction Stop -Path $netCorePath -Filter "*.dll" | ForEach-Object {
            $assemblyName = ([System.Reflection.AssemblyName]::GetAssemblyName($_.FullName))
            $matches = ($loadedAssemblies | Where-Object {$_.Name -eq $assemblyName.Name})
            if (-not $matches)
            {
                try
                {
                    Add-Type -Path $_.FullName -ErrorAction Ignore | Out-Null
                }
                catch {
                    Write-Verbose $_
                }
            }
        }
    }
    catch {}
}


$module = Get-Module Az.Accounts 
        if ($module -ne $null -and $module.Version -lt [System.Version]"2.7.1") 
{ 
    Write-Error "This module requires Az.Accounts version 2.7.1. An earlier version of Az.Accounts is imported in the current PowerShell session. Please open a new session before importing this module. This error could indicate that multiple incompatible versions of the Azure PowerShell cmdlets are installed on your system. Please see https://aka.ms/azps-version-error for troubleshooting information." -ErrorAction Stop 
} 
elseif ($module -eq $null) 
{ 
    Import-Module Az.Accounts -MinimumVersion 2.7.1 -Scope Global 
}
Import-Module (Join-Path -Path $PSScriptRoot -ChildPath Microsoft.Azure.PowerShell.Cmdlets.Sql.dll)


if (Test-Path -Path "$PSScriptRoot\PostImportScripts" -ErrorAction Ignore)
{
    Get-ChildItem "$PSScriptRoot\PostImportScripts" -ErrorAction Stop | ForEach-Object {
        . $_.FullName
    }
}

$FilteredCommands = @('Clear-AzSqlDatabaseVulnerabilityAssessmentSetting:ResourceGroupName','Get-AzSqlDatabaseVulnerabilityAssessmentSetting:ResourceGroupName','Update-AzSqlDatabaseVulnerabilityAssessmentSetting:ResourceGroupName','Clear-AzSqlInstanceDatabaseVulnerabilityAssessmentSetting:ResourceGroupName','Get-AzSqlInstanceDatabaseVulnerabilityAssessmentSetting:ResourceGroupName','Update-AzSqlInstanceDatabaseVulnerabilityAssessmentSetting:ResourceGroupName','Convert-AzSqlDatabaseVulnerabilityAssessmentScan:ResourceGroupName','Get-AzSqlDatabaseVulnerabilityAssessmentScanRecord:ResourceGroupName','Start-AzSqlDatabaseVulnerabilityAssessmentScan:ResourceGroupName','Convert-AzSqlInstanceDatabaseVulnerabilityAssessmentScan:ResourceGroupName','Get-AzSqlInstanceDatabaseVulnerabilityAssessmentScanRecord:ResourceGroupName','Start-AzSqlInstanceDatabaseVulnerabilityAssessmentScan:ResourceGroupName','Clear-AzSqlDatabaseVulnerabilityAssessmentRuleBaseline:ResourceGroupName','Get-AzSqlDatabaseVulnerabilityAssessmentRuleBaseline:ResourceGroupName','Set-AzSqlDatabaseVulnerabilityAssessmentRuleBaseline:ResourceGroupName','Clear-AzSqlInstanceDatabaseVulnerabilityAssessmentRuleBaseline:ResourceGroupName','Get-AzSqlInstanceDatabaseVulnerabilityAssessmentRuleBaseline:ResourceGroupName','Set-AzSqlInstanceDatabaseVulnerabilityAssessmentRuleBaseline:ResourceGroupName','Get-AzSqlServerVirtualNetworkRule:ResourceGroupName','New-AzSqlServerVirtualNetworkRule:ResourceGroupName','Remove-AzSqlServerVirtualNetworkRule:ResourceGroupName','Set-AzSqlServerVirtualNetworkRule:ResourceGroupName','Get-AzSqlDatabaseTransparentDataEncryption:ResourceGroupName','Get-AzSqlDatabaseTransparentDataEncryptionActivity:ResourceGroupName','Get-AzSqlServerTransparentDataEncryptionProtector:ResourceGroupName','Set-AzSqlDatabaseTransparentDataEncryption:ResourceGroupName','Set-AzSqlServerTransparentDataEncryptionProtector:ResourceGroupName','Get-AzSqlDatabaseAdvancedThreatProtectionSetting:ResourceGroupName','Get-AzSqlServerAdvancedThreatProtectionSetting:ResourceGroupName','Clear-AzSqlDatabaseAdvancedThreatProtectionSetting:ResourceGroupName','Clear-AzSqlServerAdvancedThreatProtectionSetting:ResourceGroupName','Update-AzSqlDatabaseAdvancedThreatProtectionSetting:ResourceGroupName','Update-AzSqlServerAdvancedThreatProtectionSetting:ResourceGroupName','Get-AzSqlDatabaseUpgradeHint:ResourceGroupName','Get-AzSqlServerUpgradeHint:ResourceGroupName','New-AzSqlServer:ResourceGroupName','Remove-AzSqlServer:ResourceGroupName','Set-AzSqlServer:ResourceGroupName','New-AzSqlServerTrustGroup:ResourceGroupName','Remove-AzSqlServerTrustGroup:ResourceGroupName','Add-AzSqlServerKeyVaultKey:ResourceGroupName','Get-AzSqlServerKeyVaultKey:ResourceGroupName','Remove-AzSqlServerKeyVaultKey:ResourceGroupName','Get-AzSqlServerDnsAlias:ResourceGroupName','New-AzSqlServerDnsAlias:ResourceGroupName','Set-AzSqlServerDnsAlias:ResourceGroupName','Get-AzSqlServerDisasterRecoveryConfiguration:ResourceGroupName','Get-AzSqlServerDisasterRecoveryConfigurationActivity:ResourceGroupName','New-AzSqlServerDisasterRecoveryConfiguration:ResourceGroupName','Remove-AzSqlServerDisasterRecoveryConfiguration:ResourceGroupName','Set-AzSqlServerDisasterRecoveryConfiguration:ResourceGroupName','Get-AzSqlServerCommunicationLink:ResourceGroupName','New-AzSqlServerCommunicationLink:ResourceGroupName','Remove-AzSqlServerCommunicationLink:ResourceGroupName','Get-AzSqlServerActiveDirectoryAdministrator:ResourceGroupName','Remove-AzSqlServerActiveDirectoryAdministrator:ResourceGroupName','Set-AzSqlServerActiveDirectoryAdministrator:ResourceGroupName','Get-AzSqlDatabaseReplicationLink:ResourceGroupName','New-AzSqlDatabaseCopy:ResourceGroupName','New-AzSqlDatabaseSecondary:ResourceGroupName','Remove-AzSqlDatabaseSecondary:ResourceGroupName','Set-AzSqlDatabaseSecondary:ResourceGroupName','Get-AzSqlElasticPoolRecommendation:ResourceGroupName','Get-AzSqlDatabaseRecommendedAction:ResourceGroupName','Get-AzSqlElasticPoolRecommendedAction:ResourceGroupName','Get-AzSqlServerRecommendedAction:ResourceGroupName','Set-AzSqlDatabaseRecommendedActionState:ResourceGroupName','Set-AzSqlElasticPoolRecommendedActionState:ResourceGroupName','Set-AzSqlServerRecommendedActionState:ResourceGroupName','Get-AzSqlServerOutboundFirewallRule:ResourceGroupName','New-AzSqlServerOutboundFirewallRule:ResourceGroupName','Remove-AzSqlServerOutboundFirewallRule:ResourceGroupName','Invoke-AzSqlInstanceFailover:ResourceGroupName','Get-AzSqlInstanceDatabaseLogReplay:ResourceGroupName','Get-AzSqlDeletedInstanceDatabaseBackup:ResourceGroupName','Get-AzSqlInstanceDatabaseBackupLongTermRetentionPolicy:ResourceGroupName','Set-AzSqlInstanceDatabaseBackupLongTermRetentionPolicy:ResourceGroupName','New-AzSqlInstancePool:ResourceGroupName','Get-AzSqlDatabaseInstanceFailoverGroup:ResourceGroupName','New-AzSqlDatabaseInstanceFailoverGroup:ResourceGroupName','Get-AzSqlDatabaseIndexRecommendation:ResourceGroupName','Start-AzSqlDatabaseExecuteIndexRecommendation:ResourceGroupName','Stop-AzSqlDatabaseExecuteIndexRecommendation:ResourceGroupName','New-AzSqlDatabaseExport:ResourceGroupName','New-AzSqlDatabaseImport:ResourceGroupName','Get-AzSqlServerFirewallRule:ResourceGroupName','New-AzSqlServerFirewallRule:ResourceGroupName','Remove-AzSqlServerFirewallRule:ResourceGroupName','Set-AzSqlServerFirewallRule:ResourceGroupName','Add-AzSqlDatabaseToFailoverGroup:ResourceGroupName','Get-AzSqlDatabaseFailoverGroup:ResourceGroupName','New-AzSqlDatabaseFailoverGroup:ResourceGroupName','Remove-AzSqlDatabaseFromFailoverGroup:ResourceGroupName','Remove-AzSqlDatabaseFailoverGroup:ResourceGroupName','Set-AzSqlDatabaseFailoverGroup:ResourceGroupName','Switch-AzSqlDatabaseFailoverGroup:ResourceGroupName','Get-AzSqlElasticPool:ResourceGroupName','Get-AzSqlElasticPoolActivity:ResourceGroupName','Get-AzSqlElasticPoolDatabase:ResourceGroupName','Invoke-AzSqlElasticPoolFailover:ResourceGroupName','New-AzSqlElasticPool:ResourceGroupName','Remove-AzSqlElasticPool:ResourceGroupName','Set-AzSqlElasticPool:ResourceGroupName','Stop-AzSqlElasticPoolActivity:ResourceGroupName','Get-AzSqlDatabase:ResourceGroupName','Get-AzSqlDatabaseActivity:ResourceGroupName','Get-AzSqlDatabaseExpanded:ResourceGroupName','Invoke-AzSqlDatabaseFailover:ResourceGroupName','New-AzSqlDatabase:ResourceGroupName','Remove-AzSqlDatabase:ResourceGroupName','Set-AzSqlDatabase:ResourceGroupName','Stop-AzSqlDatabaseActivity:ResourceGroupName','Get-AzSqlDatabaseGeoBackup:ResourceGroupName','Get-AzSqlDeletedDatabaseBackup:ResourceGroupName','Get-AzSqlDatabaseBackupLongTermRetentionPolicy:ResourceGroupName','Get-AzSqlDatabaseGeoBackupPolicy:ResourceGroupName','Get-AzSqlDatabaseRestorePoint:ResourceGroupName','New-AzSqlDatabaseRestorePoint:ResourceGroupName','Remove-AzSqlDatabaseRestorePoint:ResourceGroupName','Restore-AzSqlDatabase:ResourceGroupName','Set-AzSqlDatabaseBackupLongTermRetentionPolicy:ResourceGroupName','Set-AzSqlDatabaseGeoBackupPolicy:ResourceGroupName','Resume-AzSqlDatabase:ResourceGroupName','Suspend-AzSqlDatabase:ResourceGroupName','Get-AzSqlSyncAgent:ResourceGroupName','Get-AzSqlSyncAgentLinkedDatabase:ResourceGroupName','Get-AzSqlSyncGroup:ResourceGroupName','Get-AzSqlSyncGroupLog:ResourceGroupName','Get-AzSqlSyncMember:ResourceGroupName','Get-AzSqlSyncSchema:ResourceGroupName','New-AzSqlSyncAgent:ResourceGroupName','New-AzSqlSyncAgentKey:ResourceGroupName','New-AzSqlSyncGroup:ResourceGroupName','New-AzSqlSyncMember:ResourceGroupName','Remove-AzSqlSyncAgent:ResourceGroupName','Remove-AzSqlSyncGroup:ResourceGroupName','Remove-AzSqlSyncMember:ResourceGroupName','Start-AzSqlSyncGroupSync:ResourceGroupName','Stop-AzSqlSyncGroupSync:ResourceGroupName','Update-AzSqlSyncGroup:ResourceGroupName','Update-AzSqlSyncMember:ResourceGroupName','Update-AzSqlSyncSchema:ResourceGroupName','Get-AzSqlDatabaseDataMaskingPolicy:ResourceGroupName','Get-AzSqlDatabaseDataMaskingRule:ResourceGroupName','New-AzSqlDatabaseDataMaskingRule:ResourceGroupName','Remove-AzSqlDatabaseDataMaskingRule:ResourceGroupName','Set-AzSqlDatabaseDataMaskingPolicy:ResourceGroupName','Set-AzSqlDatabaseDataMaskingRule:ResourceGroupName','Get-AzSqlDatabaseAdvisor:ResourceGroupName','Get-AzSqlElasticPoolAdvisor:ResourceGroupName','Get-AzSqlServerAdvisor:ResourceGroupName','Set-AzSqlDatabaseAdvisorAutoExecuteStatus:ResourceGroupName','Set-AzSqlElasticPoolAdvisorAutoExecuteStatus:ResourceGroupName','Set-AzSqlServerAdvisorAutoExecuteStatus:ResourceGroupName','Disable-AzSqlInstanceAdvancedDataSecurity:ResourceGroupName','Disable-AzSqlServerAdvancedDataSecurity:ResourceGroupName','Enable-AzSqlInstanceAdvancedDataSecurity:ResourceGroupName','Enable-AzSqlServerAdvancedDataSecurity:ResourceGroupName','Get-AzSqlInstanceAdvancedDataSecurityPolicy:ResourceGroupName','Get-AzSqlServerAdvancedDataSecurityPolicy:ResourceGroupName')

if ($Env:ACC_CLOUD -eq $null)
{
    $FilteredCommands | ForEach-Object {

        $existingDefault = $false
        foreach ($key in $global:PSDefaultParameterValues.Keys)
        {
    	    if ($_ -like "$key")
    	        {
        	    $existingDefault = $true
    	        }
	    }

        if (!$existingDefault)
        {
            $global:PSDefaultParameterValues.Add($_,
                {
                    if ((Get-Command Get-AzContext -ErrorAction Ignore) -eq $null)
                    {
                        $context = Get-AzureRmContext
                    }
                    else
                    {
                        $context = Get-AzContext
                    }
                    if (($context -ne $null) -and $context.ExtendedProperties.ContainsKey("Default Resource Group")) {
                        $context.ExtendedProperties["Default Resource Group"]
                    }
                })
        }
    }
}

# SIG # Begin signature block
# MIInoAYJKoZIhvcNAQcCoIInkTCCJ40CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCPrbCLJ6qKMirX
# w9mpDTcKUo/30uhSE1chvBDdUULq5qCCDYEwggX/MIID56ADAgECAhMzAAACUosz
# qviV8znbAAAAAAJSMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjEwOTAyMTgzMjU5WhcNMjIwOTAxMTgzMjU5WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDQ5M+Ps/X7BNuv5B/0I6uoDwj0NJOo1KrVQqO7ggRXccklyTrWL4xMShjIou2I
# sbYnF67wXzVAq5Om4oe+LfzSDOzjcb6ms00gBo0OQaqwQ1BijyJ7NvDf80I1fW9O
# L76Kt0Wpc2zrGhzcHdb7upPrvxvSNNUvxK3sgw7YTt31410vpEp8yfBEl/hd8ZzA
# v47DCgJ5j1zm295s1RVZHNp6MoiQFVOECm4AwK2l28i+YER1JO4IplTH44uvzX9o
# RnJHaMvWzZEpozPy4jNO2DDqbcNs4zh7AWMhE1PWFVA+CHI/En5nASvCvLmuR/t8
# q4bc8XR8QIZJQSp+2U6m2ldNAgMBAAGjggF+MIIBejAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUNZJaEUGL2Guwt7ZOAu4efEYXedEw
# UAYDVR0RBEkwR6RFMEMxKTAnBgNVBAsTIE1pY3Jvc29mdCBPcGVyYXRpb25zIFB1
# ZXJ0byBSaWNvMRYwFAYDVQQFEw0yMzAwMTIrNDY3NTk3MB8GA1UdIwQYMBaAFEhu
# ZOVQBdOCqhc3NyK1bajKdQKVMFQGA1UdHwRNMEswSaBHoEWGQ2h0dHA6Ly93d3cu
# bWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY0NvZFNpZ1BDQTIwMTFfMjAxMS0w
# Ny0wOC5jcmwwYQYIKwYBBQUHAQEEVTBTMFEGCCsGAQUFBzAChkVodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY0NvZFNpZ1BDQTIwMTFfMjAx
# MS0wNy0wOC5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEAFkk3
# uSxkTEBh1NtAl7BivIEsAWdgX1qZ+EdZMYbQKasY6IhSLXRMxF1B3OKdR9K/kccp
# kvNcGl8D7YyYS4mhCUMBR+VLrg3f8PUj38A9V5aiY2/Jok7WZFOAmjPRNNGnyeg7
# l0lTiThFqE+2aOs6+heegqAdelGgNJKRHLWRuhGKuLIw5lkgx9Ky+QvZrn/Ddi8u
# TIgWKp+MGG8xY6PBvvjgt9jQShlnPrZ3UY8Bvwy6rynhXBaV0V0TTL0gEx7eh/K1
# o8Miaru6s/7FyqOLeUS4vTHh9TgBL5DtxCYurXbSBVtL1Fj44+Od/6cmC9mmvrti
# yG709Y3Rd3YdJj2f3GJq7Y7KdWq0QYhatKhBeg4fxjhg0yut2g6aM1mxjNPrE48z
# 6HWCNGu9gMK5ZudldRw4a45Z06Aoktof0CqOyTErvq0YjoE4Xpa0+87T/PVUXNqf
# 7Y+qSU7+9LtLQuMYR4w3cSPjuNusvLf9gBnch5RqM7kaDtYWDgLyB42EfsxeMqwK
# WwA+TVi0HrWRqfSx2olbE56hJcEkMjOSKz3sRuupFCX3UroyYf52L+2iVTrda8XW
# esPG62Mnn3T8AuLfzeJFuAbfOSERx7IFZO92UPoXE1uEjL5skl1yTZB3MubgOA4F
# 8KoRNhviFAEST+nG8c8uIsbZeb08SeYQMqjVEmkwggd6MIIFYqADAgECAgphDpDS
# AAAAAAADMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0
# ZSBBdXRob3JpdHkgMjAxMTAeFw0xMTA3MDgyMDU5MDlaFw0yNjA3MDgyMTA5MDla
# MH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMT
# H01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQCr8PpyEBwurdhuqoIQTTS68rZYIZ9CGypr6VpQqrgG
# OBoESbp/wwwe3TdrxhLYC/A4wpkGsMg51QEUMULTiQ15ZId+lGAkbK+eSZzpaF7S
# 35tTsgosw6/ZqSuuegmv15ZZymAaBelmdugyUiYSL+erCFDPs0S3XdjELgN1q2jz
# y23zOlyhFvRGuuA4ZKxuZDV4pqBjDy3TQJP4494HDdVceaVJKecNvqATd76UPe/7
# 4ytaEB9NViiienLgEjq3SV7Y7e1DkYPZe7J7hhvZPrGMXeiJT4Qa8qEvWeSQOy2u
# M1jFtz7+MtOzAz2xsq+SOH7SnYAs9U5WkSE1JcM5bmR/U7qcD60ZI4TL9LoDho33
# X/DQUr+MlIe8wCF0JV8YKLbMJyg4JZg5SjbPfLGSrhwjp6lm7GEfauEoSZ1fiOIl
# XdMhSz5SxLVXPyQD8NF6Wy/VI+NwXQ9RRnez+ADhvKwCgl/bwBWzvRvUVUvnOaEP
# 6SNJvBi4RHxF5MHDcnrgcuck379GmcXvwhxX24ON7E1JMKerjt/sW5+v/N2wZuLB
# l4F77dbtS+dJKacTKKanfWeA5opieF+yL4TXV5xcv3coKPHtbcMojyyPQDdPweGF
# RInECUzF1KVDL3SV9274eCBYLBNdYJWaPk8zhNqwiBfenk70lrC8RqBsmNLg1oiM
# CwIDAQABo4IB7TCCAekwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFEhuZOVQ
# BdOCqhc3NyK1bajKdQKVMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1Ud
# DwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFHItOgIxkEO5FAVO
# 4eqnxzHRI4k0MFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwubWljcm9zb2Z0
# LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcmwwXgYIKwYBBQUHAQEEUjBQME4GCCsGAQUFBzAChkJodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcnQwgZ8GA1UdIASBlzCBlDCBkQYJKwYBBAGCNy4DMIGDMD8GCCsGAQUFBwIB
# FjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2RvY3MvcHJpbWFyeWNw
# cy5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABlAGcAYQBsAF8AcABvAGwAaQBjAHkA
# XwBzAHQAYQB0AGUAbQBlAG4AdAAuIB0wDQYJKoZIhvcNAQELBQADggIBAGfyhqWY
# 4FR5Gi7T2HRnIpsLlhHhY5KZQpZ90nkMkMFlXy4sPvjDctFtg/6+P+gKyju/R6mj
# 82nbY78iNaWXXWWEkH2LRlBV2AySfNIaSxzzPEKLUtCw/WvjPgcuKZvmPRul1LUd
# d5Q54ulkyUQ9eHoj8xN9ppB0g430yyYCRirCihC7pKkFDJvtaPpoLpWgKj8qa1hJ
# Yx8JaW5amJbkg/TAj/NGK978O9C9Ne9uJa7lryft0N3zDq+ZKJeYTQ49C/IIidYf
# wzIY4vDFLc5bnrRJOQrGCsLGra7lstnbFYhRRVg4MnEnGn+x9Cf43iw6IGmYslmJ
# aG5vp7d0w0AFBqYBKig+gj8TTWYLwLNN9eGPfxxvFX1Fp3blQCplo8NdUmKGwx1j
# NpeG39rz+PIWoZon4c2ll9DuXWNB41sHnIc+BncG0QaxdR8UvmFhtfDcxhsEvt9B
# xw4o7t5lL+yX9qFcltgA1qFGvVnzl6UJS0gQmYAf0AApxbGbpT9Fdx41xtKiop96
# eiL6SJUfq/tHI4D1nvi/a7dLl+LrdXga7Oo3mXkYS//WsyNodeav+vyL6wuA6mk7
# r/ww7QRMjt/fdW1jkT3RnVZOT7+AVyKheBEyIXrvQQqxP/uozKRdwaGIm1dxVk5I
# RcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIZdTCCGXECAQEwgZUwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAlKLM6r4lfM52wAAAAACUjAN
# BglghkgBZQMEAgEFAKCBrjAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgyj3a2FUL
# hWpA2saP4LpKpf49dtpOLGY66UOzXwvWlq0wQgYKKwYBBAGCNwIBDDE0MDKgFIAS
# AE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbTAN
# BgkqhkiG9w0BAQEFAASCAQCZjaTkNi0n/JVOWPtpuCYZkSKzLtWNFjmLCm1y6rp1
# ufJ0014p/si1DVE8S2jvieMZ9APxJ8+dmZ2XdWFu2PCkbs6KEf4tq7EgE4Oe7Wnv
# 57WyXBq13W/93fRFivHz4qipe89u/zE6EYWT+RzzY+YyXX+XiMYG+XXYmJj5iX1s
# B2jr5fVLdSBjBvoaM5Zs3Zx2ZNTlH1KN7i9tlMTL7KQhlYIQMh0tPRO/FdqCzWPH
# 1lm2C+4LNrmAneunYUOUT6i3oWTTaOvmT3e5iwAHKsdE6NNL4DHKHYn5p1J5Txey
# OJA8hV8UyHr1ahtcv6iDseGXl+8os1ePube0qZZEpaEooYIW/zCCFvsGCisGAQQB
# gjcDAwExghbrMIIW5wYJKoZIhvcNAQcCoIIW2DCCFtQCAQMxDzANBglghkgBZQME
# AgEFADCCAVAGCyqGSIb3DQEJEAEEoIIBPwSCATswggE3AgEBBgorBgEEAYRZCgMB
# MDEwDQYJYIZIAWUDBAIBBQAEICuX9ieZag5dek6xbAcTUx6WMyD8RG8kk+dQDnDs
# mgWCAgZh7vO/uU4YEjIwMjIwMjAyMTMxODA3LjY4WjAEgAIB9KCB0KSBzTCByjEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWlj
# cm9zb2Z0IEFtZXJpY2EgT3BlcmF0aW9uczEmMCQGA1UECxMdVGhhbGVzIFRTUyBF
# U046M0U3QS1FMzU5LUEyNUQxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFNlcnZpY2WgghFXMIIHDDCCBPSgAwIBAgITMwAAAaDpu4y7DqLRegABAAABoDAN
# BgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3Rv
# bjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0
# aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0y
# MTEyMDIxOTA1MjNaFw0yMzAyMjgxOTA1MjNaMIHKMQswCQYDVQQGEwJVUzETMBEG
# A1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
# cm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBP
# cGVyYXRpb25zMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjozRTdBLUUzNTktQTI1
# RDElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZTCCAiIwDQYJ
# KoZIhvcNAQEBBQADggIPADCCAgoCggIBAL/a4g5ocZ0A6PZi+GEjoLyIUCrvCuX/
# lak+OPR8QcKLoi/H8jTYmyz8dWGR8ZMwa21HmNGGGslfJ1YOc6bNFTcHgbnblPun
# CQU0UFe6Yz/3yXmTRTZeJpn5u6Vcd7njHq6P/q/lUYW/7QeHV3KMZRM9pETBLvH3
# xN7m0UcSKY9r4CwbaYz6f03B9BGN3UuIQJtwJkWSDBuWJD9qSIyvW1maOQNvG27Z
# pBxeMR8Odrwkf7BmZ927RfuTp0nlYZEXDNmIs4lbhCEASl6HZzWaZu0B8GeFI834
# TnJQt+l9NPbBfxFsfpd8CDqxnHzz3rGrT6BQP2YfLxm2l0R4TVkDQeAHINbaskJt
# MAkCG3vUHtHPak9CaDlHf69IKuLwF5xIH5nybBgve45LdHpt5QEnuITis9L1YLXD
# V9lHsrjhlKZ7Z0j473+eGBvcwtiCbrPHceG0ugaEZU8v5agOQye33cgag7qQ0EIz
# Zf4KzbaqXa0+OQhHLHDEXpGxeH9AeeEomAHN8757zgjdNhsjSLb3MBMvrIc6/mwS
# zXNo0yKHbsjB9aDhDv7jQvt7ry4LrIPwRQSloPazZPn02FJq5PMIScCnlitKxxz0
# xBUiLuD7kYB0LykK/7SJFrtAi9qVT72VaCTIAFT+eIUdY+PIagHjHcrOje1cHpoL
# fJn91NFekmdpAgMBAAGjggE2MIIBMjAdBgNVHQ4EFgQUcrkuUNgpTpG4kWwUL0TP
# C2GM0OgwHwYDVR0jBBgwFoAUn6cVXQBeYl2D9OXSZacbUzUZ6XIwXwYDVR0fBFgw
# VjBUoFKgUIZOaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWlj
# cm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3JsMGwGCCsGAQUF
# BwEBBGAwXjBcBggrBgEFBQcwAoZQaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3Br
# aW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgx
# KS5jcnQwDAYDVR0TAQH/BAIwADATBgNVHSUEDDAKBggrBgEFBQcDCDANBgkqhkiG
# 9w0BAQsFAAOCAgEAMX3GAqv436yUCaVtwSpAGWkvk98EypwuRLrJJ4YmMb4spfda
# i/mnKCuEp+1dn3Q1hZR+0hmnN1izh6FHlGVoTd5i5taVw2XCwqRysZIMkprBtsMZ
# +87iH/UvXeyDrqE+JvruYb3oICpFUXRzkwDXCIqOOX/mB+tt00seC1ERDzMKlsrj
# 7rqXUV3S6n2bFw4QSmGEmvxTfCHAXCgr5An+TFaiAa18OJqrpHKgVaE/y4pItUNX
# 4xMRMdlvenY7CcFYTVbrTvVcMp3FGQ3+kARnXkTUsk2/2JijWXU/9F0X4jOkwsYM
# B/8+VW9NTDdWsf25qptiv6tHG2L5szdpvXC/2/fFEtz7A+ieJLFbanr0M3haj3og
# MVkiQtH4dxYKKodXAVeeCQJR90x7fGa84hdhGRMrQ/rA8t8L46zuh5VF4yPZMDVA
# wySBn6uE87TuJbs3nvMAG8yIclB0dEx4rcUGBHh9oS9ONQB0pFCQoVXza4TvDRQy
# ex4l9fsQsNj1PhpbHarASpqb2XsYdfgDZmbSefWhpr9jFzMnuAhURFIZI5YvAQzF
# wWoEY+b1BJDuiAwGflYfCR1NOSZqcFv9nZwOnEHF3W86PIibgE4WUuMHimK8KU7Z
# mSxYofuoFiWhhrTtTU7cLyO1vMZR0fIsJpUYFXwN8PmHx46fKOtoEbs801kwggdx
# MIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqGSIb3DQEBCwUAMIGI
# MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVk
# bW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQDEylN
# aWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAxMDAeFw0yMTA5
# MzAxODIyMjVaFw0zMDA5MzAxODMyMjVaMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBD
# QSAyMDEwMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA5OGmTOe0ciEL
# eaLL1yR5vQ7VgtP97pwHB9KpbE51yMo1V/YBf2xK4OK9uT4XYDP/XE/HZveVU3Fa
# 4n5KWv64NmeFRiMMtY0Tz3cywBAY6GB9alKDRLemjkZrBxTzxXb1hlDcwUTIcVxR
# MTegCjhuje3XD9gmU3w5YQJ6xKr9cmmvHaus9ja+NSZk2pg7uhp7M62AW36MEByd
# Uv626GIl3GoPz130/o5Tz9bshVZN7928jaTjkY+yOSxRnOlwaQ3KNi1wjjHINSi9
# 47SHJMPgyY9+tVSP3PoFVZhtaDuaRr3tpK56KTesy+uDRedGbsoy1cCGMFxPLOJi
# ss254o2I5JasAUq7vnGpF1tnYN74kpEeHT39IM9zfUGaRnXNxF803RKJ1v2lIH1+
# /NmeRd+2ci/bfV+AutuqfjbsNkz2K26oElHovwUDo9Fzpk03dJQcNIIP8BDyt0cY
# 7afomXw/TNuvXsLz1dhzPUNOwTM5TI4CvEJoLhDqhFFG4tG9ahhaYQFzymeiXtco
# dgLiMxhy16cg8ML6EgrXY28MyTZki1ugpoMhXV8wdJGUlNi5UPkLiWHzNgY1GIRH
# 29wb0f2y1BzFa/ZcUlFdEtsluq9QBXpsxREdcu+N+VLEhReTwDwV2xo3xwgVGD94
# q0W29R6HXtqPnhZyacaue7e3PmriLq0CAwEAAaOCAd0wggHZMBIGCSsGAQQBgjcV
# AQQFAgMBAAEwIwYJKwYBBAGCNxUCBBYEFCqnUv5kxJq+gpE8RjUpzxD/LwTuMB0G
# A1UdDgQWBBSfpxVdAF5iXYP05dJlpxtTNRnpcjBcBgNVHSAEVTBTMFEGDCsGAQQB
# gjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wEwYDVR0lBAwwCgYIKwYBBQUHAwgw
# GQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQDAgGGMA8GA1UdEwEB
# /wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb186aGMQwVgYDVR0f
# BE8wTTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJv
# ZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoGCCsGAQUFBwEBBE4w
# TDBKBggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0
# cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwDQYJKoZIhvcNAQELBQADggIB
# AJ1VffwqreEsH2cBMSRb4Z5yS/ypb+pcFLY+TkdkeLEGk5c9MTO1OdfCcTY/2mRs
# fNB1OW27DzHkwo/7bNGhlBgi7ulmZzpTTd2YurYeeNg2LpypglYAA7AFvonoaeC6
# Ce5732pvvinLbtg/SHUB2RjebYIM9W0jVOR4U3UkV7ndn/OOPcbzaN9l9qRWqveV
# tihVJ9AkvUCgvxm2EhIRXT0n4ECWOKz3+SmJw7wXsFSFQrP8DJ6LGYnn8AtqgcKB
# GUIZUnWKNsIdw2FzLixre24/LAl4FOmRsqlb30mjdAy87JGA0j3mSj5mO0+7hvoy
# GtmW9I/2kQH2zsZ0/fZMcm8Qq3UwxTSwethQ/gpY3UA8x1RtnWN0SCyxTkctwRQE
# cb9k+SS+c23Kjgm9swFXSVRk2XPXfx5bRAGOWhmRaw2fpCjcZxkoJLo4S5pu+yFU
# a2pFEUep8beuyOiJXk+d0tBMdrVXVAmxaQFEfnyhYWxz/gq77EFmPWn9y8FBSX5+
# k77L+DvktxW/tM4+pTFRhLy/AsGConsXHRWJjXD+57XQKBqJC4822rpM+Zv/Cuk0
# +CQ1ZyvgDbjmjJnW4SLq8CdCPSWU5nR0W2rRnj7tfqAxM328y+l7vzhwRNGQ8cir
# Ooo6CGJ/2XBjU02N7oJtpQUQwXEGahC0HVUzWLOhcGbyoYICzjCCAjcCAQEwgfih
# gdCkgc0wgcoxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
# VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAj
# BgNVBAsTHE1pY3Jvc29mdCBBbWVyaWNhIE9wZXJhdGlvbnMxJjAkBgNVBAsTHVRo
# YWxlcyBUU1MgRVNOOjNFN0EtRTM1OS1BMjVEMSUwIwYDVQQDExxNaWNyb3NvZnQg
# VGltZS1TdGFtcCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQATBriNaNpxs5hT773n
# J0nuFIKLmKCBgzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0G
# CSqGSIb3DQEBBQUAAgUA5aSmQjAiGA8yMDIyMDIwMjE0NDIxMFoYDzIwMjIwMjAz
# MTQ0MjEwWjB3MD0GCisGAQQBhFkKBAExLzAtMAoCBQDlpKZCAgEAMAoCAQACAg1R
# AgH/MAcCAQACAhHgMAoCBQDlpffCAgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisG
# AQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQEFBQAD
# gYEAb7d4FJnZtBpdETw83xDOzWXaniQmFJW+gPv2Nr/jfrfGFVmYnnpSQb/jtLG+
# LciNZDLj+dcwlR4gB590GeUmyH+ogdsKvwUapQuPSe8OwFYWrkOqVZTn5kM8PfQw
# a170aoMz9BtKA6aq27U5mpiD0IsiieojeehV9OSU0lPeW1kxggQNMIIECQIBATCB
# kzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQD
# Ex1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAaDpu4y7DqLRegAB
# AAABoDANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJ
# EAEEMC8GCSqGSIb3DQEJBDEiBCCn+ZG29Rsp8RQluAibWb9tg5CLUiUUj/4LLhfc
# PfeYkzCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIC9HijxoZQQiEi3dES+z
# HT6y+czpaJqBrlI9oriDr7TTMIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# UENBIDIwMTACEzMAAAGg6buMuw6i0XoAAQAAAaAwIgQgZIwM+b4pG0tjxhUY5HDo
# AQtCjXC/JYoB0WUEhH1S8gAwDQYJKoZIhvcNAQELBQAEggIAV3s7SJ85YHFCrC21
# 5G7AMepEwZ+N/ZyBL5bymj+6DnvuZpU7Bpw8slLDVrDDTlA8PqRMVRhznUVpiqkr
# 1KLkKqoMA/Mum5ZTnK44jdGkBTxYDiWUrbSWxr9mpMcRtU3bS5ZUJtn8p2Zk5Xg6
# iiwxzPpLNE8yYQSCO7WRjGbw7yTqrNmfAogTpAcQQOEIMzqCpDSyMfQo9OnxKZAS
# 5T02XKjqFrRTGzkWByYbayDo7wYDTIheQyZrN2SRLBPzKs6Y19DaAYdkmYM+2eEd
# bdsCnrf+UfNLxr4h7zQrE7tVMd5B0IZnhDWS7M8Y/Kx30dhwjE0v6nBcVnSVJnMm
# 94p9crBccFeJRzCATLLCuwUGdrj7HqPwdWsxhMgdBr1tx2OOTHGP8bZA1VhjiLLj
# yvfDYeUQZFN2zSDNjmH+a1AV10Xx6yybz42gq6nQIjvpLvcQlw8h0loeXAuOMc7R
# CpTQ+Rehrg5qTk31W/W7/XG9CQ15Ix7pMwYttIwAG2JT4vzhjWVxPNbxCY6TWMxW
# ksVPJful7Q1BUEmAepj3vaS1cMzsjdZRVdyaymFDhUS5eDnDYHCDQ5jnZSP5s8LU
# ixT9F+k8DahgXnAkK+yZsZ5Wl8qg80sLrSWpGfOnZKr+lGuRXeL9V7K9hFPRWdFr
# QWHPhdkf8saoLurhDzunNX9AN1g=
# SIG # End signature block
