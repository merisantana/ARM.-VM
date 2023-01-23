{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "vmName": {
            "type": "string",
            "defaultValue": "myVM",
            "metadata": {
                "description": "Name of the virtual machine."
            }
        },
        "vmSize": {
            "type": "string",
            "defaultValue": "Standard_DS1_v2",
            "metadata": {
                "description": "Size of the virtual machine."
            }
        },
        "adminUsername": {
            "type": "string",
            "defaultValue": "azureuser",
            "metadata": {
                "description": "Username for the virtual machine."
            }
        },
        "adminPassword": {
            "type": "securestring",
            "metadata": {
                "description": "Password for the virtual machine."
            }
        },
        "imagePublisher": {
            "type": "string",
            "defaultValue": "Canonical",
            "metadata": {
                "description": "Publisher of the image."
            }
        },
        "imageOffer": {
            "type": "string",
            "defaultValue": "UbuntuServer",
            "metadata": {
                "description": "Offer of the image."
            }
        },
        "imageSKU": {
            "type": "string",
            "defaultValue": "20.04-LTS",
            "metadata": {
                "description": "SKU of the image."
            }
        },
        "location": {
            "type": "string",
            "defaultValue": "[resourceGroup().location]",
            "metadata": {
                "description": "Location of the virtual machine."
            }
        }
    },
    "resources": [
        {
            "type": "Microsoft.Compute/virtualMachines",
            "name": "[parameters('vmName')]",
            "location": "[parameters('location')]",
            "apiVersion": "2019-07-01",
            "properties": {
                "hardwareProfile": {
                    "vmSize": "[parameters('vmSize')]"
                },
                "osProfile": {
                    "computerName": "[parameters('vmName')]",
                    "adminUsername": "[parameters('adminUsername')]",
                    "adminPassword": "[parameters('adminPassword')]"
                },
                "storageProfile": {
                    "imageReference": {
                        "publisher": "[parameters('imagePublisher')]",
                        "offer": "[parameters('imageOffer')]",
                        "sku": "[parameters('imageSKU')]",
                        "version": "latest"
                    },
                    "osDisk": {
