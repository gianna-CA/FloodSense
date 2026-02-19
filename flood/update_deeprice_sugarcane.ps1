$srcDir = "C:\Users\aniya\.gemini\antigravity\brain\24bc7fe3-a98b-4758-b076-a5b4bee739bc"
$imgDest1 = "c:\Users\aniya\Downloads\flood\flood\images\deep-rice.jpg"
$imgDest2 = "c:\Users\aniya\Downloads\flood\flood\images\sugarcane.jpg"

# Get the two latest files
$imgs = Get-ChildItem -Path $srcDir -Filter "media__*.jpg" | Sort-Object CreationTime -Descending | Select-Object -First 2

if($imgs.Count -ge 2){
    $sorted = $imgs | Sort-Object CreationTime # Oldest first, Newest last
    
    # User said "first image to deep water rice and second image to sugarcane"
    # Assuming chronological upload order (1st uploaded -> 2nd uploaded)
    # The last 2 files are: [Oldest of the 2, Newest of the 2]
    # So index 0 = First image, index 1 = Second image.
    
    $deepRiceImg = $sorted[0]
    $sugarcaneImg = $sorted[1]
    
    Copy-Item $deepRiceImg.FullName -Destination $imgDest1 -Force
    Copy-Item $sugarcaneImg.FullName -Destination $imgDest2 -Force
    
    Write-Host "Updated deep-rice.jpg with $($deepRiceImg.Name)"
    Write-Host "Updated sugarcane.jpg with $($sugarcaneImg.Name)"
} else {
    Write-Error "Not enough new images found."
}
