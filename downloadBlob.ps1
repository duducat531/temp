#Get the storage account in the variable
Write-Host("downloading loadtest exe")
$ResourceGroupName = "buildout"
$StorageAccountName = "loadtestvmss"
$StorageAccounts = Get-AzureRmStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageAccountName
 
#Get the Management key for the storage account
$key1 = (Get-AzureRmStorageAccountKey -ResourceGroupName $StorageAccounts.ResourceGroupName -name $StorageAccounts.StorageAccountName)[0].value
 
#Get the Storage Context to access the Storage Container
$storageContext = New-AzureStorageContext -StorageAccountName $StorageAccounts.StorageAccountName -StorageAccountKey $key1
 
#Get the Storage Container in the Variable
# $storageContainer = Get-AzureStorageContainer -Context $storageContext
$storageContainerName = "loadtesting"
#Get the blobs variable.
$blobs = Get-AzureStorageBlob -Container $storageContainerName -Context $storageContext
 
#Loop and download all the blobs to local file
New-Item -ItemType directory -Path C:\loadtest
$Localstorage = "C:\loadtest"
foreach ($blob in $blobs.Name)
{
Get-AzureStorageBlobContent -Blob $blob  -Container $storageContainerName -Context $storageContext -Destination $Localstorage       
}
Write-Host "finish downloading the loadtest exe to local"


Write-Host("Running load test")
Set-Location "C:\loadtest"
$CMD = ".\LoadTestWorker.exe"
& $CMD
Write-Host("running load test")