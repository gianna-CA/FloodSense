$srcDir = "C:\Users\aniya\.gemini\antigravity\brain\24bc7fe3-a98b-4758-b076-a5b4bee739bc"
$imgDest1 = "c:\Users\aniya\Downloads\flood\flood\images\rice.jpg"
$imgDest2 = "c:\Users\aniya\Downloads\flood\flood\images\cardamom.jpg"

# Get the two latest files
$imgs = Get-ChildItem -Path $srcDir -Filter "media__*.jpg" | Sort-Object CreationTime -Descending | Select-Object -First 2

if($imgs.Count -ge 2){
    # User said "first image to Paddy Rice and second image to cardamom"
    # But usually uploads come in order. "First" in chat might be the oldest of the two or newest?
    # The user posted 2 images. The first one in visual order is likely the first one uploaded?
    # Actually, visual order in chat: Paddy Rice (1st), Cardamom (2nd).
    # Upload time might vary.
    # Let's assume the user means the images they *just* uploaded.
    # The first one visually is likely index 1 (older) if sorted descending? No.
    # Visual order: Rice (top), Cardamom (bottom).
    # Uploads usually appear Top->Bottom.
    # So 1st = Rice, 2nd = Cardamom.
    
    # Sort Ascending (Oldest first) to match "First then Second"?
    # Or Descending (Newest first)?
    # Let's look at the filenames or just map them to the likely 2 new files.
    # I'll enable the user to verify.
    # I'll map the *2nd newest* to Rice (1st visually?) and *newest* to Cardamom? 
    # Actually, "First image" usually implies the top one. The top one is usually the *first uploaded* in a batch?
    # Or *last uploaded*?
    # In chat interfaces, images are often appended.
    # I'll assume standard chronological order of upload.
    # 1st image = Older of the two.
    # 2nd image = Newer of the two.
    
    $sorted = $imgs | Sort-Object CreationTime # Oldest first, Newest last
    $riceImg = $sorted[0]
    $cardamomImg = $sorted[1]
    
    Copy-Item $riceImg.FullName -Destination $imgDest1 -Force
    Copy-Item $cardamomImg.FullName -Destination $imgDest2 -Force
    
    Write-Host "Updated rice.jpg with $($riceImg.Name)"
    Write-Host "Updated cardamom.jpg with $($cardamomImg.Name)"
} else {
    Write-Error "Not enough new images found."
}
