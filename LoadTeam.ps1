# Install-Module PowerShellGet -Force -AllowClobber
# Install-Module MicrosoftTeams -AllowPrerelease -RequiredVersion "1.1.3-preview"
Connect-MicrosoftTeams
$fileName = $args[0]
$teamForAll = $args[1]
$student_csv = Import-Csv -Path $fileName

$team = Get-Team -DisplayName ($teamForAll)
if (!$team) 
{
	New-Team -DisplayName ($teamForAll)
	$team = Get-Team -DisplayName ($teamForAll)
	
}
echo($team.GroupId)
foreach($row in $student_csv){
      Add-TeamUser -GroupId $team.GroupId -User $row.EmailAddress -Role Member     
}
Disconnect-MicrosoftTeams