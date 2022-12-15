
# ----------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is regenerated.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Updates entity in users
.Description
Updates entity in users
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}

.Outputs
System.Boolean
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

APPROLEASSIGNMENT <IMicrosoftGraphAppRoleAssignmentAutoGenerated2[]>: Represents the app roles a user has been granted for an application. Supports $expand.
  [DeletedDateTime <DateTime?>]: 
  [Id <String>]: Read-only.
  [AppRoleId <String>]: The identifier (id) for the app role which is assigned to the principal. This app role must be exposed in the appRoles property on the resource application's service principal (resourceId). If the resource application has not declared any app roles, a default app role ID of 00000000-0000-0000-0000-000000000000 can be specified to signal that the principal is assigned to the resource app without any specific app roles. Required on create.
  [CreatedDateTime <DateTime?>]: The time when the app role assignment was created.The Timestamp type represents date and time information using ISO 8601 format and is always in UTC time. For example, midnight UTC on Jan 1, 2014 is 2014-01-01T00:00:00Z. Read-only.
  [PrincipalDisplayName <String>]: The display name of the user, group, or service principal that was granted the app role assignment. Read-only. Supports $filter (eq and startswith).
  [PrincipalId <String>]: The unique identifier (id) for the user, group or service principal being granted the app role. Required on create.
  [PrincipalType <String>]: The type of the assigned principal. This can either be User, Group or ServicePrincipal. Read-only.
  [ResourceDisplayName <String>]: The display name of the resource app's service principal to which the assignment is made.
  [ResourceId <String>]: The unique identifier (id) for the resource service principal for which the assignment is made. Required on create. Supports $filter (eq only).

IDENTITY <IMicrosoftGraphObjectIdentity[]>: Represents the identities that can be used to sign in to this user account. An identity can be provided by Microsoft (also known as a local account), by organizations, or by social identity providers such as Facebook, Google, and Microsoft, and tied to a user account. May contain multiple items with the same signInType value. Supports $filter (eq) only where the signInType is not userPrincipalName.
  [Issuer <String>]: Specifies the issuer of the identity, for example facebook.com.For local accounts (where signInType is not federated), this property is the local B2C tenant default domain name, for example contoso.onmicrosoft.com.For external users from other Azure AD organization, this will be the domain of the federated organization, for example contoso.com.Supports $filter. 512 character limit.
  [IssuerAssignedId <String>]: Specifies the unique identifier assigned to the user by the issuer. The combination of issuer and issuerAssignedId must be unique within the organization. Represents the sign-in name for the user, when signInType is set to emailAddress or userName (also known as local accounts).When signInType is set to: emailAddress, (or a custom string that starts with emailAddress like emailAddress1) issuerAssignedId must be a valid email addressuserName, issuerAssignedId must be a valid local part of an email addressSupports $filter. 100 character limit.
  [SignInType <String>]: Specifies the user sign-in types in your directory, such as emailAddress, userName or federated. Here, federated represents a unique identifier for a user from an issuer, that can be in any format chosen by the issuer. Additional validation is enforced on issuerAssignedId when the sign-in type is set to emailAddress or userName. This property can also be set to any custom string.

PASSWORDPROFILE <IMicrosoftGraphPasswordProfile>: passwordProfile
  [(Any) <Object>]: This indicates any property can be added to this object.
  [ForceChangePasswordNextSignIn <Boolean?>]: true if the user must change her password on the next login; otherwise false. If not set, default is false. NOTE:  For Azure B2C tenants, set to false and instead use custom policies and user flows to force password reset at first sign in. See Force password reset at first logon.
  [ForceChangePasswordNextSignInWithMfa <Boolean?>]: If true, at next sign-in, the user must perform a multi-factor authentication (MFA) before being forced to change their password. The behavior is identical to forceChangePasswordNextSignIn except that the user is required to first perform a multi-factor authentication before password change. After a password change, this property will be automatically reset to false. If not set, default is false.
  [Password <String>]: The password for the user. This property is required when a user is created. It can be updated, but the user will be required to change the password on the next login. The password must satisfy minimum requirements as specified by the user’s passwordPolicies property. By default, a strong password is required.
.Link
https://docs.microsoft.com/powershell/module/az.resources/update-azaduser
#>
function Update-AzADUser {
    [OutputType([System.Boolean])]
    [CmdletBinding(DefaultParameterSetName='UPNOrObjectIdParameterSet', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    [Alias('Set-AzADUser')]
    param(
        [Parameter(ParameterSetName='UPNOrObjectIdParameterSet', Mandatory)]
        [System.String]
        # The user principal name or object id of the user to be updated.
        ${UPNOrObjectId},
        
        [Parameter(ParameterSetName='ObjectIdParameterSet', Mandatory)]
        [System.String]
        # The user principal name of the user to be updated.
        ${ObjectId},
        
        [Parameter(ParameterSetName = 'InputObjectParameterSet', Mandatory, ValueFromPipeline)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphUser]
        # user input object
        ${InputObject},

        [Parameter()]
        [System.Boolean]
        [Alias('EnableAccount')]
        # true for enabling the account; otherwise, false.
        ${AccountEnabled},
        
        [Parameter()]
        [SecureString]
        # Password for the user. It must meet the tenant's password complexity requirements. It is recommended to set a strong password.
        ${Password},

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        # It must be specified if the user must change the password on the next successful login (true). Default behavior is (false) to not change the password on the next successful login.
        ${ForceChangePasswordNextLogin},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Sets the age group of the user.
        # Allowed values: null, minor, notAdult and adult.
        # Refer to the legal age group property definitions for further information.
        # Supports $filter (eq, ne, NOT, and in).
        ${AgeGroup},
        
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The city in which the user is located.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${City},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The company name which the user is associated.
        # This property can be useful for describing the company that an external user comes from.
        # The maximum length of the company name is 64 characters.Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${CompanyName},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Sets whether consent has been obtained for minors.
        # Allowed values: null, granted, denied and notRequired.
        # Refer to the legal age group property definitions for further information.
        # Supports $filter (eq, ne, NOT, and in).
        ${ConsentProvidedForMinor},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The country/region in which the user is located; for example, US or UK.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${Country},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.DateTime]
        # .
        ${DeletedDateTime},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The name for the department in which the user works.
        # Maximum length is 64 characters.Supports $filter (eq, ne, NOT , ge, le, and in operators).
        ${Department},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The name displayed in the address book for the user.
        # This value is usually the combination of the user's first name, middle initial, and last name.
        # This property is required when a user is created and it cannot be cleared during updates.
        # Maximum length is 256 characters.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith), $orderBy, and $search.
        ${DisplayName},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.DateTime]
        # The date and time when the user was hired or will start work in case of a future hire.
        # Supports $filter (eq, ne, NOT , ge, le, in).
        ${EmployeeHireDate},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The employee identifier assigned to the user by the organization.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${EmployeeId},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Captures enterprise worker type.
        # For example, Employee, Contractor, Consultant, or Vendor.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${EmployeeType},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # For an external user invited to the tenant using the invitation API, this property represents the invited user's invitation status.
        # For invited users, the state can be PendingAcceptance or Accepted, or null for all other users.
        # Supports $filter (eq, ne, NOT , in).
        ${ExternalUserState},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.DateTime]
        # Shows the timestamp for the latest change to the externalUserState property.
        # Supports $filter (eq, ne, NOT , in).
        ${ExternalUserStateChangeDateTime},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The fax number of the user.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${FaxNumber},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The given name (first name) of the user.
        # Maximum length is 64 characters.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${GivenName},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Read-only.
        ${Id},
    
        [Parameter()]
        [AllowEmptyCollection()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphObjectIdentity[]]
        # Represents the identities that can be used to sign in to this user account.
        # An identity can be provided by Microsoft (also known as a local account), by organizations, or by social identity providers such as Facebook, Google, and Microsoft, and tied to a user account.
        # May contain multiple items with the same signInType value.
        # Supports $filter (eq) only where the signInType is not userPrincipalName.
        # To construct, see NOTES section for IDENTITY properties and create a hash table.
        ${Identity},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # Do not use – reserved for future use.
        ${IsResourceAccount},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The user's job title.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${JobTitle},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The SMTP address for the user, for example, admin@contoso.com.
        # Changes to this property will also update the user's proxyAddresses collection to include the value as an SMTP address.
        # While this property can contain accent characters, using them can cause access issues with other Microsoft applications for the user.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith, endsWith).
        ${Mail},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The mail alias for the user.
        # This property must be specified when a user is created.
        # Maximum length is 64 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${MailNickname},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The office location in the user's place of business.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${OfficeLocation},

        [Parameter()]
        [System.String]
        # This property is used to associate an on-premises Active Directory user account to their Azure AD user object.
        # This property must be specified when creating a new user account in the Graph if you are using a federated domain for the user's userPrincipalName (UPN) property.
        # NOTE: The $ and _ characters cannot be used when specifying this property.
        # Returned only on $select.
        # Supports $filter (eq, ne, NOT, ge, le, in)..
        ${OnPremisesImmutableId},
    
        [Parameter()]
        [AllowEmptyCollection()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String[]]
        # A list of additional email addresses for the user; for example: ['bob@contoso.com', 'Robert@fabrikam.com'].NOTE: While this property can contain accent characters, they can cause access issues to first-party applications for the user.Supports $filter (eq, NOT, ge, le, in, startsWith).
        ${OtherMail},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Specifies password policies for the user.
        # This value is an enumeration with one possible value being DisableStrongPassword, which allows weaker passwords than the default policy to be specified.
        # DisablePasswordExpiration can also be specified.
        # The two may be specified together; for example: DisablePasswordExpiration, DisableStrongPassword.Supports $filter (ne, NOT).
        ${PasswordPolicy},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphPasswordProfile]
        # passwordProfile
        # To construct, see NOTES section for PASSWORDPROFILE properties and create a hash table.
        ${PasswordProfile},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The postal code for the user's postal address.
        # The postal code is specific to the user's country/region.
        # In the United States of America, this attribute contains the ZIP code.
        # Maximum length is 40 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${PostalCode},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The preferred language for the user.
        # Should follow ISO 639-1 Code; for example en-US.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${PreferredLanguage},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # true if the Outlook global address list should contain this user, otherwise false.
        # If not set, this will be treated as true.
        # For users invited through the invitation manager, this property will be set to false.
        # Supports $filter (eq, ne, NOT, in).
        ${ShowInAddressList},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The state or province in the user's address.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${State},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The street address of the user's place of business.
        # Maximum length is 1024 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${StreetAddress},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The user's surname (family name or last name).
        # Maximum length is 64 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${Surname},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # A two letter country code (ISO standard 3166).
        # Required for users that will be assigned licenses due to legal requirement to check for availability of services in countries.
        # Examples include: US, JP, and GB.
        # Not nullable.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${UsageLocation},
    
        [Parameter(ParameterSetName='UPNParameterSet', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        [Alias("UPN")]
        # The user principal name (UPN) of the user.
        # The UPN is an Internet-style login name for the user based on the Internet standard RFC 822.
        # By convention, this should map to the user's email name.
        # The general format is alias@domain, where domain must be present in the tenant's collection of verified domains.
        # This property is required when a user is created.
        # The verified domains for the tenant can be accessed from the verifiedDomains property of organization.NOTE: While this property can contain accent characters, they can cause access issues to first-party applications for the user.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith, endsWith) and $orderBy.
        ${UserPrincipalName},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # A string value that can be used to classify user types in your directory, such as Member and Guest.
        # Supports $filter (eq, ne, NOT, in,).
        ${UserType},
    
        [Parameter()]
        [Alias("AzContext", "AzureRmContext", "AzureCredential")]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Returns true when the command succeeds
        ${PassThru},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )
    
    process {
            switch ($PSCmdlet.ParameterSetName) {
            'ObjectIdParameterSet' {
                $id = $PSBoundParameters['ObjectId']
                $null = $PSBoundParameters.Remove('ObjectId')
                break
            }
            'InputObjectParameterSet' {
                $id = $PSBoundParameters['InputObject'].Id
                $null = $PSBoundParameters.Remove('InputObject')
                break
            }
            'UPNOrObjectIdParameterSet' {
                $id = $PSBoundParameters['UPNOrObjectId']
                $null = $PSBoundParameters.Remove('UPNOrObjectId')
                break
            }
            'UPNParameterSet' {
              $id = $PSBoundParameters['UserPrincipalName']
              $null = $PSBoundParameters.Remove('UserPrincipalName')
              break
          }
      }
      if ($PSBoundParameters.ContainsKey('Password')) {
        $passwordProfile = [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.MicrosoftGraphPasswordProfile]::New()
        $passwordProfile.ForceChangePasswordNextSignIn = $ForceChangePasswordNextLogin
        $passwordProfile.Password = . "$PSScriptRoot/../utils/Unprotect-SecureString.ps1" $PSBoundParameters['Password']
        $null = $PSBoundParameters.Remove('Password')
        $null = $PSBoundParameters.Remove('ForceChangePasswordNextLogin')
        $PSBoundParameters['AccountEnabled'] = $true
        $PSBoundParameters['PasswordProfile'] = $passwordProfile
      }
      $PSBoundParameters['Id'] = $id

      Az.MSGraph.internal\Update-AzADUser @PSBoundParameters
    }
}
    
# SIG # Begin signature block
# MIInugYJKoZIhvcNAQcCoIInqzCCJ6cCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCX1CCBzgsX/uff
# NUy/sc43IEtG2Vez6Eld2S6LnCqrpKCCDYEwggX/MIID56ADAgECAhMzAAACUosz
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
# RcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIZjzCCGYsCAQEwgZUwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAlKLM6r4lfM52wAAAAACUjAN
# BglghkgBZQMEAgEFAKCBrjAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgl8x1+vmt
# e0YilzqCGeGmzR+AiPpdkwotnEtXMZPT4zcwQgYKKwYBBAGCNwIBDDE0MDKgFIAS
# AE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbTAN
# BgkqhkiG9w0BAQEFAASCAQB76j9OHyGQaKwJVi+9rLJZrUvA1AM6KB0fh85B2441
# ha2tvPX/8H97t4snARErzkEiR9TUwbJ1C8bIgPEs5prW3Yo+HpwhoIDxWZ9tArxY
# cbMGGopmeoA9l50aO30wyE10f3r/L96Jo+Spoxd1+sU8ExsfgJliLYcHO/eYbaxM
# 4NSP7QaD8B0JFf/RBA9JSdc6STo0vGD7wvnSTJU01FVaLZjJQ9e9M/NUKFM1NLRO
# 96rjbrHMYOLAlz0Q9Db1/0RLjJlMwwMq7ddQrxTgDr0oBMXN5daTZlZ4rGJUdrrC
# iQVilO2ffw6JIQPxCj38t67nydOT8f1oTD4OdRMOEhafoYIXGTCCFxUGCisGAQQB
# gjcDAwExghcFMIIXAQYJKoZIhvcNAQcCoIIW8jCCFu4CAQMxDzANBglghkgBZQME
# AgEFADCCAVkGCyqGSIb3DQEJEAEEoIIBSASCAUQwggFAAgEBBgorBgEEAYRZCgMB
# MDEwDQYJYIZIAWUDBAIBBQAEIKo0MIr2GePjULLYvX+EFapHz0tmQl9LVbD5muQk
# 01IiAgZiF5VmzpoYEzIwMjIwMjI1MTM1MDUzLjcyNFowBIACAfSggdikgdUwgdIx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1p
# Y3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEmMCQGA1UECxMdVGhh
# bGVzIFRTUyBFU046RDA4Mi00QkZELUVFQkExJTAjBgNVBAMTHE1pY3Jvc29mdCBU
# aW1lLVN0YW1wIFNlcnZpY2WgghFoMIIHFDCCBPygAwIBAgITMwAAAY/zUajrWnLd
# zAABAAABjzANBgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0Eg
# MjAxMDAeFw0yMTEwMjgxOTI3NDZaFw0yMzAxMjYxOTI3NDZaMIHSMQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQg
# SXJlbGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJjAkBgNVBAsTHVRoYWxlcyBUU1Mg
# RVNOOkQwODItNEJGRC1FRUJBMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFt
# cCBTZXJ2aWNlMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAmVc+/rXP
# Fx6Fk4+CpLrubDrLTa3QuAHRVXuy+zsxXwkogkT0a+XWuBabwHyqj8RRiZQQvdvb
# Oq5NRExOeHiaCtkUsQ02ESAe9Cz+loBNtsfCq846u3otWHCJlqkvDrSr7mMBqwcR
# Y7cfhAGfLvlpMSojoAnk7Rej+jcJnYxIeN34F3h9JwANY360oGYCIS7pLOosWV+b
# xug9uiTZYE/XclyYNF6XdzZ/zD/4U5pxT4MZQmzBGvDs+8cDdA/stZfj/ry+i0XU
# YNFPhuqc+UKkwm/XNHB+CDsGQl+ZS0GcbUUun4VPThHJm6mRAwL5y8zptWEIocbT
# eRSTmZnUa2iYH2EOBV7eCjx0Sdb6kLc1xdFRckDeQGR4J1yFyybuZsUP8x0dOsEE
# oLQuOhuKlDLQEg7D6ZxmZJnS8B03ewk/SpVLqsb66U2qyF4BwDt1uZkjEZ7finIo
# UgSz4B7fWLYIeO2OCYxIE0XvwsVop9PvTXTZtGPzzmHU753GarKyuM6oa/qaTzYv
# rAfUb7KYhvVQKxGUPkL9+eKiM7G0qenJCFrXzZPwRWoccAR33PhNEuuzzKZFJ4De
# aTCLg/8uK0Q4QjFRef5n4H+2KQIEibZ7zIeBX3jgsrICbzzSm0QX3SRVmZH//Aqp
# 8YxkwcoI1WCBizv84z9eqwRBdQ4HYcNbQMMCAwEAAaOCATYwggEyMB0GA1UdDgQW
# BBTzBuZ0a65JzuKhzoWb25f7NyNxvDAfBgNVHSMEGDAWgBSfpxVdAF5iXYP05dJl
# pxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAx
# MCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRpbWUtU3Rh
# bXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBMGA1UdJQQMMAoG
# CCsGAQUFBwMIMA0GCSqGSIb3DQEBCwUAA4ICAQDNf9Oo9zyhC5n1jC8iU7NJY39F
# izjhxZwJbJY/Ytwn63plMlTSaBperan566fuRojGJSv3EwZs+RruOU2T/ZRDx4VH
# esLHtclE8GmMM1qTMaZPL8I2FrRmf5Oop4GqcxNdNECBClVZmn0KzFdPMqRa5/0R
# 6CmgqJh0muvImikgHubvohsavPEyyHQa94HD4/LNKd/YIaCKKPz9SA5fAa4phQ4E
# vz2auY9SUluId5MK9H5cjWVwBxCvYAD+1CW9z7GshJlNjqBvWtKO6J0Aemfg6z28
# g7qc7G/tCtrlH4/y27y+stuwWXNvwdsSd1lvB4M63AuMl9Yp6au/XFknGzJPF6n/
# uWR6JhQvzh40ILgeThLmYhf8z+aDb4r2OBLG1P2B6aCTW2YQkt7TpUnzI0cKGr21
# 3CbKtGk/OOIHSsDOxasmeGJ+FiUJCiV15wh3aZT/VT/PkL9E4hDBAwGt49G88gSC
# O0x9jfdDZWdWGbELXlSmA3EP4eTYq7RrolY04G8fGtF0pzuZu43A29zaI9lIr5ul
# KRz8EoQHU6cu0PxUw0B9H8cAkvQxaMumRZ/4fCbqNb4TcPkPcWOI24QYlvpbtT9p
# 31flYElmc5wjGplAky/nkJcT0HZENXenxWtPvt4gcoqppeJPA3S/1D57KL3667ep
# Ir0yV290E2otZbAW8DCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUw
# DQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmljYXRlIEF1dGhv
# cml0eSAyMDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4MzIyNVowfDELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAw
# ggIKAoICAQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH0qlsTnXIyjVX9gF/bErg
# 4r25PhdgM/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLAEBjoYH1qUoNEt6aO
# RmsHFPPFdvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlhAnrEqv1yaa8dq6z2Nr41
# JmTamDu6GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP1uyFVk3v3byNpOORj7I5
# LFGc6XBpDco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVVmG1oO5pGve2krnopN6zL
# 64NF50ZuyjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakXW2dg3viSkR4dPf0gz3N9
# QZpGdc3EXzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+Nuw2TPYrbqgSUei/BQOj
# 0XOmTTd0lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9Q07BMzlMjgK8QmguEOqE
# UUbi0b1qGFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJNmSLW6CmgyFdXzB0
# kZSU2LlQ+QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6r1AFemzFER1y7435
# UsSFF5PAPBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57t7c+auIurQIDAQABo4IB
# 3TCCAdkwEgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3FQIEFgQUKqdS/mTE
# mr6CkTxGNSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMFwG
# A1UdIARVMFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93
# d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTATBgNV
# HSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNV
# HQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo
# 0T2UkFvXzpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29m
# dC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5j
# cmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jv
# c29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDAN
# BgkqhkiG9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL/Klv6lwUtj5OR2R4
# sQaTlz0xM7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu6WZnOlNN3Zi6th54
# 2DYunKmCVgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZGN5tggz1bSNU5HhTdSRX
# ud2f8449xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfgQJY4rPf5KYnDvBew
# VIVCs/wMnosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8sCXgU6ZGyqVvfSaN0
# DLzskYDSPeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCrdTDFNLB62FD+Cljd
# QDzHVG2dY3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJVGTZc9d/HltEAY5aGZFr
# DZ+kKNxnGSgkujhLmm77IVRrakURR6nxt67I6IleT53S0Ex2tVdUCbFpAUR+fKFh
# bHP+CrvsQWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8CwYKiexcdFYmNcP7n
# tdAoGokLjzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9JZTmdHRbatGePu1+
# oDEzfbzL6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDBcQZqELQdVTNYs6Fw
# ZvKhggLXMIICQAIBATCCAQChgdikgdUwgdIxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJh
# dGlvbnMgTGltaXRlZDEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046RDA4Mi00QkZE
# LUVFQkExJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2WiIwoB
# ATAHBgUrDgMCGgMVAD5NL4IEdudIBwdGoCaV0WBbQZpqoIGDMIGApH4wfDELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwDQYJKoZIhvcNAQEFBQACBQDlwrySMCIY
# DzIwMjIwMjI1MTAyNTIyWhgPMjAyMjAyMjYxMDI1MjJaMHcwPQYKKwYBBAGEWQoE
# ATEvMC0wCgIFAOXCvJICAQAwCgIBAAICD0cCAf8wBwIBAAICEWAwCgIFAOXEDhIC
# AQAwNgYKKwYBBAGEWQoEAjEoMCYwDAYKKwYBBAGEWQoDAqAKMAgCAQACAwehIKEK
# MAgCAQACAwGGoDANBgkqhkiG9w0BAQUFAAOBgQCIY4EJ3Y2gcIWNUd4qPFFSedoQ
# dN/XZx85yrY/kaRdvXbR4eNmT7hmOGJHPvqtWVthewh/aqClZv2v5t19aQ93XQkn
# XZoi0ZY9Oi/zhmvhcFUJ0ozjcoIyRTbQ97t2PoBIfUc9j9O2vjnii1a8r0EaNk/y
# eMtW9iL7L0K5iL/39TGCBA0wggQJAgEBMIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwAhMzAAABj/NRqOtact3MAAEAAAGPMA0GCWCGSAFlAwQCAQUAoIIB
# SjAaBgkqhkiG9w0BCQMxDQYLKoZIhvcNAQkQAQQwLwYJKoZIhvcNAQkEMSIEIKb/
# rRzod8oILztVVob/1wqptorX3ycOGyBRD+K5rZ7TMIH6BgsqhkiG9w0BCRACLzGB
# 6jCB5zCB5DCBvQQgl3IFT+LGxguVjiKm22ItmO6dFDWW8nShu6O6g8yFxx8wgZgw
# gYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAY/zUajrWnLd
# zAABAAABjzAiBCD8djBAOtkm8jHFCdN/3lEfwH9WkQUpCfT/KlGCAUXNkzANBgkq
# hkiG9w0BAQsFAASCAgAwR18MFLVYDcQ8EmPpga51O8kcPE7pELot7DfB+HE9ypfe
# Wbb9lOyQhE3EcwmiH04Xg+3EB2en1Un4N6R7Ar9ydYe1klHTED5LsNexIM2+zOwB
# Je+jxK018fbgyZUwAV1f5EscroNvMjrGF7Sngk9fyfOgnTwvI+adv7hljInIFzmf
# tpKXPLIPAe5doC5JjEZpsF0P3+1Hjxe1LZrzJZ3CXHcT/72699cEgKdPHwSN8DXG
# nDY7nCWn7OmEp+5CxcVA6t2FSRu8s+cFzJwE4v0n7Vm0QaN4gc3baN4Q53gthqzI
# 9oqmrPKRQr61SG10qGvWRaF0+lL18vhVdrj4AdesTIV0eumUmdmM5XV7S5ijB43E
# 2EbWK69WJv6nXW6kLyQkqfRmOM0U5Q9bO1Kyl3dJvIhvxiosCKfssADbmSVZ7PfV
# 9JK5cGMdbycP/HGhfdk1BuxUT/FlU8tkNsspc+P/l+ayjWftLdNrlccoT3KxhqMF
# Z9AY1KbcMsBMz2OImrzeKB/je/BSFOvzC9v94auD4McGlPHnOVbwVSIJJ4VPMFCV
# FijwGi3YYCPbIp5aqml+0kUfg7fv/FY20xXj4742ln8ltQHnSc+EJHUpSSdYbz2u
# o0c2AzjAJ26u21pfdadKS7Lesmxf9xEwrrDLtk6/xoo9LuXrtGR91RIaYjB0nQ==
# SIG # End signature block
