$dir = "c:\Users\aniya\Downloads\flood\flood\images"
if(-not (Test-Path $dir)){New-Item -ItemType Directory -Force -Path $dir | Out-Null}
$ua = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" 

# Map crop names to Unsplash keywords matching user's provided images
$keywords = @{
    "deep-rice.jpg" = "rice,flood,water,field"
    "swarna-sub1.jpg" = "rice,paddy,field,green"
    "rice.jpg" = "rice,grains,harvest,straw"       # User Image 2 match
    "wheat.jpg" = "wheat,grains,pile,gold"          # User Image 4 match
    "mustard.jpg" = "mustard,seeds,spice,bowl"      # User Image 5 match
    "barley.jpg" = "barley,grain,cereal"
    "sugarcane.jpg" = "sugarcane,plant,green"
    "coffee.jpg" = "coffee,beans,roasted"
    "tea.jpg" = "tea,plant,leaves,green"            # User Image 3 match
    "cardamom.jpg" = "cardamom,pods,spice,green"
    "water-chestnut.jpg" = "water,chestnut,fruit,black" # User Image 1 match
}

foreach($k in $keywords.Keys){
    $path = Join-Path $dir $k
    $url = "https://source.unsplash.com/600x400/?" + $keywords[$k]
    
    # Try downloading from Unsplash
    try {
        Write-Host "Downloading $k from Unsplash..."
        Invoke-WebRequest -Uri $url -OutFile $path -UserAgent $ua -TimeoutSec 10
        
        # Verify file size (sometimes redirects result in small HTML pages)
        if((Get-Item $path).Length -lt 5000) { throw "File too small" }
        Write-Host "Success: $k"
    }
    catch {
        Write-Host "Download failed for $k : $($_.Exception.Message)"
        
        # Fallback to Placehold.co with descriptive text
        $cropName = $k.Replace(".jpg","").Replace("-"," ").ToUpper()
        $fallbackUrl = "https://placehold.co/600x400/e8f5e9/2e7d32.jpg?text=$([uri]::EscapeDataString($cropName))"
        try {
            Invoke-WebRequest -Uri $fallbackUrl -OutFile $path -UserAgent $ua
            Write-Host "Created Placeholder for $k"
        } catch {
             Write-Host "Fallback failed for $k"
        }
    }
    Start-Sleep -Milliseconds 500
}
