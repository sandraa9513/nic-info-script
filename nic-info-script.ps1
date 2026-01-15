# Skriptas: išveda kompiuterio tinklo parametrus (lietuviškai)

# Funkcija: PrefixLength -> potinklio kaukė
function PrefixToMask {
    param([int]$prefix)
    $masks = @(
        "0.0.0.0","128.0.0.0","192.0.0.0","224.0.0.0","240.0.0.0","248.0.0.0","252.0.0.0","254.0.0.0",
        "255.0.0.0","255.128.0.0","255.192.0.0","255.224.0.0","255.240.0.0","255.248.0.0","255.252.0.0","255.254.0.0",
        "255.255.0.0","255.255.128.0","255.255.192.0","255.255.224.0","255.255.240.0","255.255.248.0","255.255.252.0","255.255.254.0",
        "255.255.255.0","255.255.255.128","255.255.255.192","255.255.255.224","255.255.255.240","255.255.255.248","255.255.255.252","255.255.255.254",
        "255.255.255.255"
    )
    if ($prefix -ge 0 -and $prefix -le 32) { return $masks[$prefix] } else { return "" }
}

Write-Host "Kompiuterio vardas: $([System.Environment]::MachineName)"
Write-Host "---------------------------------------------"

$configs = Get-NetIPConfiguration

foreach ($cfg in $configs) {
    Write-Host "Adapteris: $($cfg.InterfaceAlias)"
    Write-Host "  Statusas     : $($cfg.NetAdapter.Status)"
    # IPv4 adresai (gali būti keli)
    if ($cfg.IPv4Address) {
        foreach ($ip in $cfg.IPv4Address) {
            $mask = PrefixToMask -prefix $ip.PrefixLength
            Write-Host "  IPv4        : $($ip.IPAddress) / $($ip.PrefixLength)  (Mask: $mask)"
        }
    } else {
        Write-Host "  IPv4        : (doesn't exist)"
    }
    # IPv6 adresai
    if ($cfg.IPv6Address) {
        $v6 = $cfg.IPv6Address | ForEach-Object { "$($_.IPAddress)/$($_.PrefixLength)" } 
        Write-Host "  IPv6        : $($v6 -join ', ')"
    } else {
        Write-Host "  IPv6        : (doesn't exist)"
    }
    # Numatytoji vartai (gateway)
    if ($cfg.IPv4DefaultGateway) {
        $gw = $cfg.IPv4DefaultGateway.NextHop
        Write-Host "  Num. vartai : $gw"
    } else {
        Write-Host "  Num. vartai : (doesn't exist)"
    }
    # DNS serveriai
    if ($cfg.DnsServer -and $cfg.DnsServer.ServerAddresses) {
        Write-Host "  DNS         : $($cfg.DnsServer.ServerAddresses -join ', ')"
    } else {
        Write-Host "  DNS         : (doesn't exist)"
    }
    # MAC adresas
    try {
        $mac = (Get-NetAdapter -InterfaceAlias $cfg.InterfaceAlias -ErrorAction Stop).MacAddress
        Write-Host "  MAC         : $mac"
    } catch {
        Write-Host "  MAC         : (doesn't exist)"
    }

    Write-Host ""
}
# filepath: C:\Scripts\Get-NetworkParameters.ps1
# Skriptas: išveda kompiuterio tinklo parametrus (lietuviškai)

# Funkcija: PrefixLength -> potinklio kaukė
function PrefixToMask {
    param([int]$prefix)
    $masks = @(
        "0.0.0.0","128.0.0.0","192.0.0.0","224.0.0.0","240.0.0.0","248.0.0.0","252.0.0.0","254.0.0.0",
        "255.0.0.0","255.128.0.0","255.192.0.0","255.224.0.0","255.240.0.0","255.248.0.0","255.252.0.0","255.254.0.0",
        "255.255.0.0","255.255.128.0","255.255.192.0","255.255.224.0","255.255.240.0","255.255.248.0","255.255.252.0","255.255.254.0",
        "255.255.255.0","255.255.255.128","255.255.255.192","255.255.255.224","255.255.255.240","255.255.255.248","255.255.255.252","255.255.255.254",
        "255.255.255.255"
    )
    if ($prefix -ge 0 -and $prefix -le 32) { return $masks[$prefix] } else { return "" }
}

Write-Host "Kompiuterio vardas: $([System.Environment]::MachineName)"
Write-Host "---------------------------------------------"

$configs = Get-NetIPConfiguration

foreach ($cfg in $configs) {
    Write-Host "Adapteris: $($cfg.InterfaceAlias)"
    Write-Host "  Statusas     : $($cfg.NetAdapter.Status)"
    # IPv4 adresai (gali būti keli)
    if ($cfg.IPv4Address) {
        foreach ($ip in $cfg.IPv4Address) {
            $mask = PrefixToMask -prefix $ip.PrefixLength
            Write-Host "  IPv4        : $($ip.IPAddress) / $($ip.PrefixLength)  (Mask: $mask)"
        }
    } else {
        Write-Host "  IPv4        : (doesn't exist)"
    }
    # IPv6 adresai
    if ($cfg.IPv6Address) {
        $v6 = $cfg.IPv6Address | ForEach-Object { "$($_.IPAddress)/$($_.PrefixLength)" } 
        Write-Host "  IPv6        : $($v6 -join ', ')"
    } else {
        Write-Host "  IPv6        : (doesn't exist)"
    }
    # Numatytoji vartai (gateway)
    if ($cfg.IPv4DefaultGateway) {
        $gw = $cfg.IPv4DefaultGateway.NextHop
        Write-Host "  Num. vartai : $gw"
    } else {
        Write-Host "  Num. vartai : (doesn't exist)"
    }
    # DNS serveriai
    if ($cfg.DnsServer -and $cfg.DnsServer.ServerAddresses) {
        Write-Host "  DNS         : $($cfg.DnsServer.ServerAddresses -join ', ')"
    } else {
        Write-Host "  DNS         : (doesn't exist)"
    }
    # MAC adresas
    try {
        $mac = (Get-NetAdapter -InterfaceAlias $cfg.InterfaceAlias -ErrorAction Stop).MacAddress
        Write-Host "  MAC         : $mac"
    } catch {
        Write-Host "  MAC         : (doesn't exist)"
    }

    Write-Host ""
}