# Install-Module PowerShellGet -Force -AllowClobber
# Uninstall-Module MicrosoftTeams -Force
# Install-Module MicrosoftTeams -AllowPrerelease -RequiredVersion "1.1.5-preview"
Connect-MicrosoftTeams
$student_csv = Import-Csv -Path "groups.csv"
#$team = Get-Team -DisplayName "SoCS Graduate Apprentices 2020-21"
#echo($team.GroupId)
$channels = @{}

$GroupId = "add537b2-c7a0-4d04-840e-e61735d75428"
foreach($row in $student_csv){
	if(-not($channels.ContainsKey($row.Channel))){
		$channels.Add($row.Channel, $true)
		New-TeamChannel -GroupId $GroupId -DisplayName $row.Channel -MembershipType "Private"
		Add-TeamChannelUser -GroupId $GroupId -DisplayName $row.Channel -User "derek.somerville@glasgow.ac.uk" -Role "Owner"
	}
	if ($row.owner = "Owner") {
		Add-TeamChannelUser -GroupId $GroupId -DisplayName $row.Channel -User $row.EmailAddress -Role $row.Owner
	} else {
		Add-TeamChannelUser -GroupId $GroupId -DisplayName $row.Channel -User $row.EmailAddress 
	}
}
Disconnect-MicrosoftTeams


