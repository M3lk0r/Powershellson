$cert = Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert | Select-Object -First 1
Set-AuthenticodeSignature -FilePath "\\contoso.net\GPOsFiles$\StartupScripts\scripts\InstalarCertificados.ps1" -Certificate $cert