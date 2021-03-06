# Install-Module PowerShellGet -Force -AllowClobber
# Uninstall-Module MicrosoftTeams -Force
# Install-Module MicrosoftTeams -AllowPrerelease -RequiredVersion "1.1.5-preview"
$hasCsvChannel = $false
$hasCsvTeam = $false
function getCsvTeamAndChannel
{
	$header = $student_csv | gm
	if ($header | ? {$_.name -eq "Channel"})
	{
		$hasCsvChannel = $true
	}
	if ($header | ? {$_.name -eq "Team"})
	{
		$hasCsvTeam = $true
	}
}
Connect-MicrosoftTeams
$fileName = $args[0]
$teamForAll = $args[1]
$student_csv = Import-Csv -Path $fileName	
getCsvTeamAndChannel
$team = Get-Team -DisplayName ("UofG Internship")
Write-Output $team.GroupId
$team = Get-Team -DisplayName ($teamForAll)
if (!$team) 
{
	Write-Output "Create new team"
}
