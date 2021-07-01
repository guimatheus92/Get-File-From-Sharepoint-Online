# -------------------------------------------------------------------------------------------'
# Title: Download a file from Sharepoint Online
# Author: Guilherme Matheus
# Date: Script created on 30.06.2021
# Script and data info: This script can download one or more files from your sharepoit site
# Documentation: https://docs.microsoft.com/en-us/powershell/module/sharepoint-pnp/connect-pnponline?view=sharepoint-ps
#--------------------------------------------------------------------------------------------'

# To execute the script without agreeing with the execution policy
Set-ExecutionPolicy Bypass -Scope Process

# Import the Sharepoint Online module
Import-Module PnP.PowerShell

# Sharepoint website URL that will connect
# The URL can be something like https://example.sharepoint.com/sites/BI
$SiteURL = "https://test.sharepoint.com/sites/Test"

# Email to connect to Sharepoint
$UserName = "Your user e-mail"

# Password from your email to connect to Sharepoint
$Password = "Your user password"

# Connects to the Sharepoint service
$Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($UserName,(ConvertTo-SecureString $Password -AsPlainText -Force))
$creds = (New-Object System.Management.Automation.PSCredential $UserName,(ConvertTo-SecureString $Password -AsPlainText -Force))

# Connect to the PNP module using the variables previously informed
Connect-PnPOnline -Url $SiteURL -Credentials $creds

# Defines the directory where the file will be downloaded
$DownloadPath = "C:\"

# Path to file from SP folder
$FileRelativeUrl = "/sites/Test/Shared Documents/Test.xlsx"

# Name of the file that is going to be downloaded and renamed
$FileName = "Test.xlsx"

# Download the file from the Sharepoint
Get-PnPFile -Url $FileRelativeUrl -Path $DownloadPath -FileName $FileName -AsFile -Force

# Disconnects from PnP module
Disconnect-PnPOnline