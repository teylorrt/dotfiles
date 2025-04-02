Write-Host "Install font. Suggestion: Meslo"
if($null -ne $terminalSettings.profiles.defaults.font) {
    $terminalSettings.profiles.defaults.font = '{}' | ConvertFrom-Json
}
$terminalSettings | ConvertTo-Json -Depth 4 | Out-File $settingPath
oh-my-posh font install

#setting font
$fontName = Read-Host "Adding font to terminal settings. Enter the font name. Use one of the names listed above"

$fontInput = '{ "face":"FONT_NAME" }';
$fontInput = $fontInput.Replace('FONT_NAME', $fontName)

$fontConfig = $fontInput | ConvertFrom-Json

if($null -ne $terminalSettings.profiles.defaults.font) {
    $terminalSettings.profiles.defaults.font = '{}' | ConvertFrom-Json
}

if($null -eq $terminalSettings.profiles.defaults.font) {
    $terminalSettings.profiles.defaults | add-member -Name "font" -value ($fontConfig) -MemberType NoteProperty
} else {
    if($null -eq $terminalSettings.profiles.defaults.font.face) {
        $terminalSettings.profiles.defaults.font | add-member -Name "face" -value ($fontName) -MemberType NoteProperty
    } else {
        $terminalSettings.profiles.defaults.font.face = $fontName
    }
}

$terminalSettings | ConvertTo-Json -Depth 4 | Out-File $settingPath