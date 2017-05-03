Login-AzureRmAccount


$resourceGroupName = "TestConfigRG"
$location = "SouthIndia"
$path = ".\Configs\WindowsFeatureIIS.ps1"
$outputpath = ".\WindowsFeatureIIS.zip"
$storageAccountName = "testconfigst"
$ContainerName = "dscconfigcontainer"

#storage, resource group, container should preexist.

New-AzureRmResourceGroup -name $resourceGroupName -Location $location
New-AzureRmStorageAccount -ResourceGroupName  $resourceGroupName -Location $location -name $storageAccountName  -Kind Storage -SkuName Standard_LRS 

Set-AzureRmCurrentStorageAccount –ResourceGroupName $resourceGroupName –StorageAccountName $storageAccountName
New-AzureStorageContainer -Name $ContainerName


publish-AzureRmVMDscConfiguration -ConfigurationPath $path -ResourceGroupName $resourceGroupName -ContainerName $ContainerName `
                                    -StorageAccountName $storageAccountName -AdditionalPath "c:\temp\test.txt" 

#do not upload just zip in local machine.                                   
publish-AzureRmVMDscConfiguration -ConfigurationPath $path -OutputArchivePath  $outputpath

