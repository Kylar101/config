# Prompt user for a message to append
$messageToAppend = Read-Host "Enter a message to append to the combined commit"

# Ensure we're in a Git repo
if (-not (Test-Path ".git")) {
    Write-Error "This is not a Git repository."
    exit 1
}

# Get the current branch name
$branchName = git rev-parse --abbrev-ref HEAD

# Get the existing commit message
$existingMessage = git log -1 --pretty=%B

# Soft reset the last commit (keeps changes staged)
git reset --soft HEAD~1

# Split existing message into title and body
$existingLines = $existingMessage.split("`r?`n") | Where-Object {$_}
$existingTitle = $existingLines[0].Trim()
$existingBody = if ($existingLines.Count -gt 1) { ($existingLines[1..($existingLines.Length - 1)] -join "`n").Trim() } else { "" }

Write-Host "$existingBody"

# Always use the branch name as the title
$finalTitle = $branchName.Trim()

# Preserve the entire existing body and append the new message
if ($existingTitle -eq $finalTitle) {
    $newBody = if ($existingBody) {
        "$existingBody`n- $messageToAppend"
    } else {
        "- $messageToAppend"
    }
} else {
    # In case the previous title wasn't the branch name, preserve it too
    $newBody = "$existingTitle`n$existingBody`n- $messageToAppend".Trim()
}

# Final commit message with consistent title and growing body
$finalCommitMessage = "$finalTitle`n`n$newBody"

git add .
# Recommit with updated message
git commit -m "$finalCommitMessage"

Write-Host "Commit updated. Appended message preserved successfully."
