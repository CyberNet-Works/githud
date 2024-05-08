function Get-GitBranch {
    $branch = git rev-parse --abbrev-ref HEAD 2> $null
    if ($branch) { return " ($branch)" }
}

function prompt {
    $user = if ($env:USERNAME -eq 'SYSTEM') { 'SYSTEM' } else { $env:USERNAME }
    $computer = $env:COMPUTERNAME
    $location = if ($ExecutionContext.SessionState.Path.CurrentLocation.Path.Length -eq 3) { "$($ExecutionContext.SessionState.Path.CurrentLocation.Drive.Name)\" } else { $ExecutionContext.SessionState.Path.CurrentLocation.Path }
    $branch = Get-GitBranch
    $promptString = $user + '@' + $computer + ':' + $location
    if ($branch) { $promptString += $branch }
    Write-Host -NoNewline $promptString
    return "> "
}
