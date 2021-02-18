# Install-Module PowerShellGet -Force -AllowClobber
# Uninstall-Module MicrosoftTeams -Force
# Install-Module MicrosoftTeams -AllowPrerelease -RequiredVersion "1.1.5-preview"
Connect-MicrosoftTeams
$fileName = $args[0]
$teamForAll = $args[1]
$student_csv = Import-Csv -Path $fileName
$team = Get-Team -DisplayName $teamForAll
#echo($team.GroupId)
$channels = @{}

$GroupId = "a4a306c3-e31e-48f6-9eb9-f1ee4d95eb4b"
foreach($row in $student_csv){
	#if(-not($channels.ContainsKey($row.Channel))){
	#	$channels.Add($row.Channel, $true)
	#	New-TeamChannel -GroupId $GroupId -DisplayName $row.Channel -MembershipType "Private"
	#	Add-TeamChannelUser -GroupId $GroupId -DisplayName $row.Channel -User "derek.somerville@glasgow.ac.uk" -Role "Owner"
	#}
	#if ($row.owner = "Owner") {
	#	Add-TeamChannelUser -GroupId $GroupId -DisplayName $row.Channel -User $row.EmailAddress -Role $row.Owner
	#} else {
		Add-TeamChannelUser -GroupId $GroupId -DisplayName $row.Channel -User $row.EmailAddress 
	#}
}
Disconnect-MicrosoftTeams


