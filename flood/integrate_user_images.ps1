$src = "C:\Users\aniya\.gemini\antigravity\brain\24bc7fe3-a98b-4758-b076-a5b4bee739bc"
$dest = "c:\Users\aniya\Downloads\flood\flood\images"

# Recent batch (Tea, Rice, Cardamom, Water Chestnut, Wheat)
Copy-Item "$src\media__1771462532220.jpg" "$dest\tea.jpg" -Force
Copy-Item "$src\media__1771462532223.jpg" "$dest\rice.jpg" -Force
Copy-Item "$src\media__1771462532225.jpg" "$dest\cardamom.jpg" -Force
Copy-Item "$src\media__1771462532270.jpg" "$dest\water-chestnut.jpg" -Force
Copy-Item "$src\media__1771462532323.jpg" "$dest\wheat.jpg" -Force

# Earlier batch (Deep Rice, Swarna, Mustard) - Best guess mapping
Copy-Item "$src\media__1771462163427.jpg" "$dest\deep-rice.jpg" -Force
Copy-Item "$src\media__1771462163428.jpg" "$dest\swarna-sub1.jpg" -Force
Copy-Item "$src\media__1771462163432.jpg" "$dest\mustard.jpg" -Force

Write-Host "User images integrated."
