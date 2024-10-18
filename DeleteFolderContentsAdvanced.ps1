
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Run this script as admin"
    exit 1
}

$folders = @("C:\Windows\System32\GroupPolicy")

    foreach ($folder in $folders) {
        if (Test-Path -Path $folder) {

            if ((Get-ChildItem -Path $folder).Count -eq 0){
                Write-Host "The current folder path is empty for $folder"
            }
            else {
                try{
                    Remove-Item -Path "$folder\*" -Force -Recurse
                    Write-Host "File Contents Deleted at $folder"
                }
                catch {
                    Write-Host "Failed to delete contents at $folder. Error: $_"
                }
            }
        }

        else {

              Write-Host "The folder path $folder does not currently exist."
        }
    }
