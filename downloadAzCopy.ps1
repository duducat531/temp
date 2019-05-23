#Download via URI using SAS
New-Item -ItemType directory -Path D:\temp
$BlobUri = 'https://loadtestvmss.blob.core.windows.net/azureportaldeploy/MicrosoftAzureStorageAzCopy_netcore_x64.msi'
$Sas = '?st=2019-05-23T09%3A26%3A48Z&se=2019-06-24T09%3A26%3A00Z&sp=rl&sv=2018-03-28&sr=b&sig=XbzDu%2FG3xb7qv84gzwlrZpcnhyBgdXd9SvvgjmhKArM%3D'
$OutputPath = 'D:\temp\MicrosoftAzureStorageAzCopy_netcore_x64.msi'
$FullUri = "$BlobUri$Sas"
(New-Object System.Net.WebClient).DownloadFile($FullUri, $OutputPath) 