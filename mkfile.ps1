# Makefile
function mkfile {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$false, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [string[]]$FilePaths,

    [Parameter(Mandatory=$false)]
    [Alias('v')]
    [switch]$Version,

    [Parameter(Mandatory=$false)]
    [Alias('i')]
    [switch]$Info
  )

  if ($Version) {
    Write-Host "v1.0.0"
    return
  }

  if ($Info) {
    Write-Host "mkfile: A PowerShell function to create files."
    Write-Host "Repository: https://github.com/thecodermehedi/mkfile-powershell"
    Write-Host "Author: thecodermehedi"
    Write-Host "Version: v1.0.0"
    return
  }

  if (-not $FilePaths -or $FilePaths.Count -eq 0) {
    Write-Host "Usage: mkfile [-?] [-v] [-i] <file_path> [<file_path>...]"
    return
  }

  $BaseDirectory = (Get-Location).Path

  foreach ($FilePath in $FilePaths) {
    try {
      # Construct the full path without requiring the file to exist
      $FullResolvedPath = Join-Path -Path $BaseDirectory -ChildPath $FilePath

      # Ensure the resolved path is within the base directory
      if (-not $FullResolvedPath.StartsWith($BaseDirectory, [StringComparison]::OrdinalIgnoreCase)) {
        Write-Host "Error: Target path is outside the base directory." -ForegroundColor Red
        continue
      }

      # Directory check and file creation logic
      $FileDir = Split-Path -Path $FullResolvedPath -Parent
      if (-not (Test-Path -Path $FileDir)) {
        $null = New-Item -Path $FileDir -ItemType Directory -Force
        Write-Host "Directory '$FileDir' created."
      }

      if (-not (Test-Path -Path $FullResolvedPath)) {
        $null = New-Item -Path $FullResolvedPath -ItemType File -Force
        Write-Host "File '$FullResolvedPath' created successfully."
      } else {
        Write-Host "File '$FullResolvedPath' already exists."
      }
    } catch {
      Write-Host "Error creating '$FullResolvedPath': $_" -ForegroundColor Red
    }
  }
}
