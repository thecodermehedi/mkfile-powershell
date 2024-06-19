# mkfile PowerShell Function

`mkfile` is a PowerShell function that allows you to create one or more files in the specified paths. If a directory does not exist, it will be created automatically. The function also supports options for displaying version information and additional details about the function itself.

## Installation

To install the `mkfile` function on your Windows operating system, you can use  the following scripts:

### For PowerShell

```powershell
Start-Process powershell -Verb RunAs -Args '-nop -ep Bypass -c iex(New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/thecodermehedi/mkfile-powershell/main/mkfile.ps1");ac$p"`n.$PSScriptRoot\mkfile.ps1"'
```

#### After executing the command refresh your powershell profile

```powershell
. $profile
```

### For Command Prompt (CMD)

```cmd
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Start-Process PowerShell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command ""iex ((New-Object System.Net.WebClient).DownloadString(''https://raw.githubusercontent.com/thecodermehedi/mkfile-powershell/main/mkfile.ps1'')); Add-Content -Path $PROFILE -Value "`n. $env:USERPROFILE\Documents\WindowsPowerShell\mkfile.ps1""'"
```

## Usage

To use the `mkfile` function, follow these steps:

1. Open PowerShell.
2. Now you can use the `mkfile` function with various parameters:

```powershell
# Create a file in the current directory
mkfile index.html

# Create a file in a specific directory
mkfile src/main.ts

# Display version information
mkfile -v

# Display help
mkfile -?

# Display additional information about the function
mkfile -i
```

## Contributing

If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request in the GitHub repository.

## License

This project is licensed under the [MIT License](LICENSE).
