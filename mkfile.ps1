# Makefile
  82   │ function mkfile {
  83   │  <#
  84   │ .SYNOPSIS
  85   │ Creates one or more files in the specified paths.
  86   │
  87   │ .DESCRIPTION
  88   │ The mkfile function creates one or more files in the specified paths. If a directory does not exist, it will b
       │ e created automatically. The function supports options for displaying version information and additional detai
       │ ls about the function itself.
  89   │
  90   │ .PARAMETER FilePaths
  91   │ Specifies the path(s) of the file(s) to be created. Wildcard characters are permitted. This parameter is manda
       │ tory if the -Version or -Info parameters are not specified.
  92   │
  93   │ .PARAMETER Version
  94   │ Displays the version information for the mkfile function.
  95   │
  96   │ .PARAMETER Info
  97   │ Displays additional information about the mkfile function, including its description, repository URL, and auth
       │ or.
  98   │
  99   │ .INPUTS
 100   │ System.String[]
 101   │ The mkfile function accepts one or more file paths as input.
 102   │
 103   │ .OUTPUTS
 104   │ None
 105   │ The mkfile function does not generate any output objects.
 106   │
 107   │ .EXAMPLE
 108   │ mkfile test.txt
 109   │ Creates a file named 'test.txt' in the current directory.
 110   │
 111   │ .EXAMPLE
 112   │ mkfile C:\Temp\file1.txt C:\Temp\file2.txt
 113   │ Creates two files, 'file1.txt' and 'file2.txt', in the 'C:\Temp' directory.
 114   │
 115   │ .EXAMPLE
 116   │ mkfile -Version
 117   │ Displays the version information for the mkfile function.
 118   │
 119   │ .EXAMPLE
 120   │ mkfile -Info
 121   │ Displays additional information about the mkfile function.
 122   │
 123   │ .NOTES
 124   │ Author: thecodermehedi
 125   │ Repository: https://github.com/thecodermehedi/mkfile-powershell
 126   │ Version: v1.0.0
 127   │
 128   │ .LINK
 129   │ https://github.com/thecodermehedi/mkfile-powershell
 130   │ #>
 131   │   [CmdletBinding()]
 132   │   param(
 133   │     [Parameter(Mandatory=$false, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
 134   │     [Alias('FullName')]
 135   │     [string[]]$FilePaths,
 136   │
 137   │     [Parameter(Mandatory=$false)]
 138   │     [Alias('v')]
 139   │     [switch]$Version,
 140   │
 141   │     [Parameter(Mandatory=$false)]
 142   │     [Alias('i')]
 143   │     [switch]$Info
 144   │   )
 145   │
 146   │   if ($Version) {
 147   │     Write-Host "v1.0.0"
 148   │     return
 149   │   }
 150   │
 151   │   if ($Info) {
 152   │     Write-Host "mkfile: A PowerShell function to create files."
 153   │     Write-Host "Repository: https://github.com/thecodermehedi/mkfile-powershell"
 154   │     Write-Host "Author: thecodermehedi"
 155   │     Write-Host "Version: v1.0.0"
 156   │     return
 157   │   }
 158   │
 159   │   if (-not $FilePaths -or $FilePaths.Count -eq 0) {
 160   │     Write-Host "Usage: mkfile [-?] [-v] [-i] <file_path> [<file_path>...]"
 161   │     return
 162   │   }
 163   │
 164   │   process {
 165   │     foreach ($FilePath in $FilePaths) {
 166   │       try {
 167   │         $FileDir = Split-Path -Path $FilePath -Parent
 168   │         $FileName = Split-Path -Path $FilePath -Leaf
 169   │
 170   │         if (-not (Test-Path -Path $FileDir)) {
 171   │           $null = New-Item -Path $FileDir -ItemType Directory -Force
 172   │         }
 173   │
 174   │         $null = New-Item -Path $FilePath -ItemType File -Force
 175   │
 176   │         Write-Host "File '$FileName' created successfully."
 177   │       }
 178   │       catch {
 179   │         Write-Host "Error: $_" -ForegroundColor Red
 180   │       }
 181   │     }
 182   │   }
 183   │ }
