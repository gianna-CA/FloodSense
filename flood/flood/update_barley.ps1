$srcDir = "C:\Users\aniya\.gemini\antigravity\brain\24bc7fe3-a98b-4758-b076-a5b4bee739bc"
$imgDest = "c:\Users\aniya\Downloads\flood\flood\images\barley.jpg"

# Get the latest image (the specific one for Barley)
$img = Get-ChildItem -Path $srcDir -Filter "media__*.jpg" | Sort-Object CreationTime -Descending | Select-Object -First 1

if($img){
    Copy-Item $img.FullName -Destination $imgDest -Force
    Write-Host "Updated barley.jpg with $($img.Name)"
} else {
    Write-Error "No new image found."
}
