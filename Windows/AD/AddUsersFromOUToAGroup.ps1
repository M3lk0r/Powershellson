﻿<#
.SYNOPSIS
    Adiciona todos os usuários de uma Unidade Organizacional (OU) específica a um grupo no Active Directory.

.DESCRIPTION
    Este script localiza todos os usuários em uma OU especificada e os adiciona a um grupo no Active Directory.
    O script suporta tratamento de erros, logging e feedback visual durante a execução.

.PARAMETER OU
    Caminho da Unidade Organizacional (OU) onde os usuários estão localizados.

.PARAMETER Group
    Nome do grupo ao qual os usuários serão adicionados.

.EXAMPLE
    .\AddUsersToGroup.ps1 -OU "OU=DAIMO,OU=FILIAIS,DC=complem,DC=br" -Group "Colaboradores DAIMO"

.NOTES
    Autor: Eduardo Augusto Gomes
    Data: 18/12/2024
    Versão: 2.0
        Versão aprimorada com validações, logging, suporte a pipeline, tratamento de erros robusto e boas práticas do PowerShell 7.4.

.LINK
    https://github.com/M3lk0r/Powershellson
#>

[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param (
    [Parameter(Mandatory = $true, HelpMessage = "Caminho da Unidade Organizacional (OU) onde os usuários estão localizados.")]
    [string]$OU,

    [Parameter(Mandatory = $true, HelpMessage = "Nome do grupo ao qual os usuários serão adicionados.")]
    [string]$Group
)

# Configurações iniciais
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$logFile = "C:\logs\AddUsersToGroup.log"

# Função para escrever logs
function Write-Log {
    param (
        [string]$Message,
        [string]$Level = "INFO"
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$Level] $Message"
    Add-Content -Path $logFile -Value $logEntry
}

# Função para importar o módulo ActiveDirectory
function Import-ADModule {
    try {
        Import-Module ActiveDirectory -ErrorAction Stop
        Write-Log "Módulo ActiveDirectory importado com sucesso."
    }
    catch {
        Write-Log "Falha ao importar o módulo ActiveDirectory: $_" -Level "ERROR"
        throw
    }
}

# Função para adicionar usuários de uma OU a um grupo
function Add-UsersToGroup {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
    param (
        [string]$OU,
        [string]$Group
    )

    try {
        # Obtém todos os usuários na OU especificada
        $users = Get-ADUser -SearchBase $OU -Filter * -ErrorAction Stop
        Write-Log "Usuários na OU '$OU' obtidos com sucesso. Total de usuários: $($users.Count)"
    }
    catch {
        Write-Log "Falha ao obter usuários da OU '$OU': $_" -Level "ERROR"
        throw
    }

    $totalUsers = $users.Count
    $currentUser = 0

    foreach ($user in $users) {
        $currentUser++
        $percentComplete = ($currentUser / $totalUsers) * 100
        Write-Progress -Activity "Adicionando usuários ao grupo '$Group'" -Status "$currentUser de $totalUsers" -PercentComplete $percentComplete

        try {
            if ($PSCmdlet.ShouldProcess($user.SamAccountName, "Adicionar ao grupo '$Group'")) {
                Add-ADGroupMember -Identity $Group -Members $user -ErrorAction Stop
                Write-Log "Usuário '$($user.SamAccountName)' adicionado ao grupo '$Group'."
            }
        }
        catch {
            Write-Log "Falha ao adicionar o usuário '$($user.SamAccountName)' ao grupo '$Group': $_" -Level "ERROR"
        }
    }
}

# Início do script
try {
    Write-Log "Iniciando script de adição de usuários ao grupo no AD."

    Import-ADModule
    Add-UsersToGroup -OU $OU -Group $Group

    Write-Log "Script concluído com sucesso."
}
catch {
    Write-Log "Erro fatal durante a execução do script: $_" -Level "ERROR"
    throw
}