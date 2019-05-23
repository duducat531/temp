"start" | Out-File 'D:\log.txt' -Force
New-Item -ItemType directory -Path D:\temp
$OutputPath = 'D:\temp\MicrosoftAzureStorageAzCopy_netcore_x64.msi'
$FullUri = "https://loadtestvmss.blob.core.windows.net/azureportaldeploy/MicrosoftAzureStorageAzCopy_netcore_x64.msi?st=2019-05-23T09%3A26%3A48Z&se=2019-06-24T09%3A26%3A00Z&sp=rl&sv=2018-03-28&sr=b&sig=XbzDu%2FG3xb7qv84gzwlrZpcnhyBgdXd9SvvgjmhKArM%3D"
(New-Object System.Net.WebClient).DownloadFile($FullUri, $OutputPath) 
"end" | Out-File 'D:\log.txt' -Force