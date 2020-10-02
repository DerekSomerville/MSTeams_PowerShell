# Install-Module PowerShellGet -Force -AllowClobber
# Uninstall-Module MicrosoftTeams -Force
# Install-Module MicrosoftTeams -AllowPrerelease -RequiredVersion "1.1.5-preview"
Connect-MicrosoftTeams
$student_csv = Import-Csv -Path "msci_fifth_students.csv"

$team = Get-Team -DisplayName ("UofG Internship")
echo($team.GroupId)
foreach($row in $student_csv){
	Add-TeamChannelUser -GroupId $team.GroupId -DisplayName "2020 Msci Fifth Year Project" -User $row.EmailAddress -Role Member     
}
Disconnect-MicrosoftTeams


