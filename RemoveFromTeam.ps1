# Install-Module PowerShellGet -Force -AllowClobber
# Install-Module MicrosoftTeams -AllowPrerelease -RequiredVersion "1.1.3-preview"
Connect-MicrosoftTeams
$student_csv = Import-Csv -Path "ss_remove.csv"

$team = Get-Team -DisplayName ("GA Programming Summer School")
echo($team.GroupId)
foreach($row in $student_csv){
      Remove-TeamUser -GroupId $team.GroupId -User $row.EmailAddress  
}
Disconnect-MicrosoftTeams	

