﻿$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName            = 'clover'
  fileType               = 'EXE'
  url                    = 'http://ejie.me/uploads/setup_clover@3.2.7.exe'
  checksum               = 'F5868B375E5C8EAB86FC5DED703AF7B48970CF8A3AF26BE34F38D0DE790C6EDD'
  checksumType           = 'sha256'
  silentArgs             = '/S'
  validExitCodes         = @(0)
  softwareName           = 'clover *'
}
Install-ChocolateyPackage @packageArgs

$packageName = $packageArgs.packageName
$installLocation = Get-AppInstallLocation $packageArgs.softwareName
if ($installLocation)  {
    Write-Host "$packageName installed to '$installLocation'"
    Register-Application "$installLocation\$packageName.exe"
    Write-Host "$packageName registered as $packageName"
}
else { Write-Warning "Can't find $PackageName install location" }
