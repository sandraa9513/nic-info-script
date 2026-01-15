# nic-info-script.ps1

Skriptas išveda kompiuterio tinklo parametrus (lietuviškai): adapterio pavadinimą, statusą, IPv4/IPv6 adresus, potinklio kaukę (mask), numatytąjį vartą (gateway), DNS serverius ir MAC adresą.

## Reikalinga
- Windows (10/11 ar naujesnė versija)
- PowerShell 5.1 arba PowerShell 7+
- Kai kuriais atvejais gali prireikti administratoriaus teisių norint gauti pilną adapterių informaciją.

## Paleidimas
1. Atidarykite PowerShell.
2. Pereikite į katalogą, kuriame yra skriptas, pvz.: `C:\Users\moksleivis\Desktop\vs`

3. Jei jūsų PowerShell vykdymo politika blokuoja skriptus, laikinai leiskite vykdymą (vienkartinis nustatymas sesijai):

`Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force`

4. Paleiskite skriptą:

`\.\nic-info-script.ps1`

Arba iš kitos PowerShell sesijos:

`powershell -ExecutionPolicy Bypass -File .\nic-info-script.ps1`

## Ką išveda
- Adapterio pavadinimas (InterfaceAlias)
- Adapterio statusas
- IPv4 adresai su prefix length ir potinklio kauke
- IPv6 adresai
- Numatytoji vartai (gateway)
- DNS serveriai
- MAC adresas

## Pavyzdys
Trumpas pavyzdinis išėjimas:

Adapteris: Ethernet
  Statusas     : Up
  IPv4        : 192.168.1.10 / 24  (Mask: 255.255.255.0)
  IPv6        : fe80::abcd:1234/64
  Num. vartai : 192.168.1.1
  DNS         : 192.168.1.1, 8.8.8.8
  MAC         : 00-11-22-33-44-55

## Pastabos
- Skriptas naudoja įmontuotus PowerShell modulius (`Get-NetIPConfiguration`, `Get-NetAdapter`). Jei gaunate klaidas, įsitikinkite, kad vykdote PowerShell su tinkamomis teisėmis ir kad tinklo moduliai pasiekiami jūsų sistemoje.
- Failą galite koreguoti pagal poreikį (pvz. filtruoti tam tikrus adapterius ar pritaikyti išvedimo formatą).

---
Autorius: vietinis skriptas (nic-info-script.ps1)
