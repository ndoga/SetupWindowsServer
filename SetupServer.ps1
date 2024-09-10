# Disabilita i firewall per tutti i profili
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# Disabilita la protezione in tempo reale di Windows Defender
Set-MpPreference -DisableRealtimeMonitoring $true

# Disabilita la protezione basata su cloud
Set-MpPreference -MAPSReporting Disabled
Set-MpPreference -SubmitSamplesConsent NeverSend

# Disabilita l'invio automatico di campioni
Set-MpPreference -MAPSReporting Disabled
Set-MpPreference -SubmitSamplesConsent NeverSend

# Disabilita IE Enhanced Security Configuration per amministratori e utenti
$AdminKey = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap"
$UserKey = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\EscDomains"

# Disabilita IE ESC per amministratori
Set-ItemProperty -Path $AdminKey -Name IEHarden -Value 0

# Disabilita IE ESC per utenti
Set-ItemProperty -Path $UserKey -Name IEHarden -Value 0

# Imposta il fuso orario a UTC+1 (Roma)
Set-TimeZone -Id "UTC+1 W. Europe Standard Time (Roma)"

# Funzione per disabilitare IPv6 su tutte le schede di rete
function Disable-IPv6 {
    $networkAdapters = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' }
    $adapterCount = $networkAdapters.Count

    Write-Output "Numero di schede di rete rilevate: $adapterCount"
    foreach ($adapter in $networkAdapters) {
        $adapterName = $adapter.Name
        Disable-NetAdapterBinding -Name $adapterName -ComponentID ms_tcpip6
        Write-Output "Scheda Nome: $adapterName - IPv6 disabilitato"
    }
}

# Disabilita IPv6 su tutte le schede di rete
Disable-IPv6

# Abilita RDP
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0

# Consente le connessioni RDP attraverso il firewall
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

Write-Output "Firewall, Protezioni di Windows Defender, IE Enhanced Security Configuration, Fuso Orario e IPv6 sono stati configurati."
