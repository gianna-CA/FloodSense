$srcDir = "C:\Users\aniya\.gemini\antigravity\brain\24bc7fe3-a98b-4758-b076-a5b4bee739bc"
$dest = "c:\Users\aniya\Downloads\flood\flood\images\tea.jpg"
$img = Get-ChildItem -Path $srcDir -Filter "media__*.jpg" | Sort-Object CreationTime -Descending | Select-Object -First 1

if($img){
    Copy-Item $img.FullName -Destination $dest -Force
    Write-Host "Updated tea.jpg with $($img.Name)"
} else {
    Write-Error "No new image found."
}
