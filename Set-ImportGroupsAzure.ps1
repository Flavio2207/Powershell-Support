# Importar o módulo AzureAD
#Import-Module AzureAD

# Autenticar no Azure AD
#Connect-AzureAD

# Especificar o UPN ou o ID do usuário de origem e do usuário de destino
$sourceUserUPN = Read-host "Coloque o Email do usuario de Origem" 
$targetUserUPN =  Read-host "Coloque o Email do usuario de Destino" 

# Obter o objeto do usuário de origem
$sourceUser = Get-AzureADUser -ObjectId $sourceUserUPN

# Obter todos os grupos do usuário de origem
$sourceUserGroups = Get-AzureADUserMembership -ObjectId $sourceUser.ObjectId

# Obter o objeto do usuário de destino
$targetUser = Get-AzureADUser -ObjectId $targetUserUPN

# Adicionar o usuário de destino aos mesmos grupos
foreach ($group in $sourceUserGroups) {
    Add-AzureADGroupMember -ObjectId $group.ObjectId -RefObjectId $targetUser.ObjectId
    Write-Output "Adicionado ao grupo: $($group.DisplayName)"
}

Write-Output "Usuário $targetUserUPN adicionado aos mesmos grupos que $sourceUserUPN."
