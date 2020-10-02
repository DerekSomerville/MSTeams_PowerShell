# Install-Module PowerShellGet -Force -AllowClobber
# Install-Module MicrosoftTeams -AllowPrerelease -RequiredVersion "1.1.3-preview"
Connect-MicrosoftTeams
$student_csv = Import-Csv -Path "2021_SummerPlacement.csv"

$team = Get-Team -DisplayName ("2021 Summer Placement")
echo($team.GroupId)
foreach($row in $student_csv){
      Add-TeamUser -GroupId $team.GroupId -User $row.EmailAddress -Role Member     
}
Disconnect-MicrosoftTeams