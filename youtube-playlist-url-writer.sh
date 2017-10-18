$Playlist = ((Invoke-WebRequest "https://www.youtube.com/watch?v=bLcNbXTAuAg&list=RDbLcNbXTAuAg&index=1").Links | Where {$_.class -match "playlist-video"}).href

ForEach ($Video in $Playlist) {
    Write-Output ("https://www.youtube.com" + $Video)
}

