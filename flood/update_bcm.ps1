$srcDir = "C:\Users\aniya\.gemini\antigravity\brain\24bc7fe3-a98b-4758-b076-a5b4bee739bc"
$imgDest1 = "c:\Users\aniya\Downloads\flood\flood\images\barley.jpg"
$imgDest2 = "c:\Users\aniya\Downloads\flood\flood\images\coffee.jpg"
$imgDest3 = "c:\Users\aniya\Downloads\flood\flood\images\mustard.jpg"

# Get the three latest files (Barley, Coffee, Mustard)
# User request: "1st image to barley, second image to coffee, 3rd image to msutard"
# Assumption: This refers to the most recent 3 uploads.
# Visual order in chat corresponds to Upload Time (usually).
# 1st (Barley) = Oldest of the 3? Or Newest?
# Typically:
# Upload 1
# Upload 2
# Upload 3
# The file system `CreationTime` will show this order.
# Latest 3 files -> Sort by creation time.
# [Oldest, Middle, Newest] of the batch.
# If i select -First 3 with Descending, I get: [Newest, Middle, Oldest].
# User said "1st image...". Usually "First" means the top one in the chat.
# If they uploaded in a batch, the top one is often the first one processed/uploaded.
# Let's assume standard chronological order:
# 1st image = Earliest of the batch
# 2nd image = Middle
# 3rd image = Latest
# So we need to get the LAST 3 files, sorted by creation time?
# Or just get the 3 newest files and sort them Ascending (Old->New).

$imgs = Get-ChildItem -Path $srcDir -Filter "media__*.jpg" | Sort-Object CreationTime -Descending | Select-Object -First 3

if($imgs.Count -ge 3){
    # $imgs is [Newest, Middle, Oldest]
    # We want [Oldest, Middle, Newest] to match 1st, 2nd, 3rd?
    # Actually, let's reverse it to get chronological order of the batch.
    $batch = $imgs | Sort-Object CreationTime # [Oldest, Middle, Newest]
    
    $barleyImg = $batch[0]
    $coffeeImg = $batch[1]
    $mustardImg = $batch[2]
    
    Copy-Item $barleyImg.FullName -Destination $imgDest1 -Force
    Copy-Item $coffeeImg.FullName -Destination $imgDest2 -Force
    Copy-Item $mustardImg.FullName -Destination $imgDest3 -Force
    
    Write-Host "Updated barley.jpg with $($barleyImg.Name)"
    Write-Host "Updated coffee.jpg with $($coffeeImg.Name)"
    Write-Host "Updated mustard.jpg with $($mustardImg.Name)"
} else {
    Write-Error "Not enough new images found."
}
