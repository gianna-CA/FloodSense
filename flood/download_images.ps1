$dir = "c:\Users\aniya\Downloads\flood\flood\images"
$ua = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
$imgs = @{
 "deep-rice.jpg"="https://commons.wikimedia.org/wiki/Special:FilePath/Rice_fields_in_Bangladesh.jpg";
 "swarna-sub1.jpg"="https://commons.wikimedia.org/wiki/Special:FilePath/Paddy_field_in_Joypurhat.jpg";
 "rice.jpg"="https://commons.wikimedia.org/wiki/Special:FilePath/Rice_Field_-_Andhra_Pradesh.jpg";
 "mustard.jpg"="https://commons.wikimedia.org/wiki/Special:FilePath/Mustard_flowers_in_Punjab.jpg";
 "barley.jpg"="https://commons.wikimedia.org/wiki/Special:FilePath/Barley_field.jpg";
 "sugarcane.jpg"="https://commons.wikimedia.org/wiki/Special:FilePath/Sugarcane_fields_in_Mysore_district.jpg";
 "cardamom.jpg"="https://commons.wikimedia.org/wiki/Special:FilePath/Elettaria_cardamomum_fruits.jpg";
 "water-chestnut.jpg"="https://commons.wikimedia.org/wiki/Special:FilePath/Trapa_natans.jpg";
}
foreach($k in $imgs.Keys){
 $path = Join-Path $dir $k
 if(-not (Test-Path $path) -or (Get-Item $path).Length -eq 0){
  try {
    Invoke-WebRequest -Uri $imgs[$k] -OutFile $path -UserAgent $ua -MaximumRedirection 10
    Write-Host "Downloaded $k"
  } catch { Write-Host "Failed $k $($_.Exception.Message)" }
  Start-Sleep -Milliseconds 1000
 }
}
