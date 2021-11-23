FOR /F "delims= " %%A IN ('curl -s https://api.github.com/repos/NebuTech/NBMiner/releases/latest ^| jq -r ".assets[].browser_download_url|select(endswith(\"Win.zip\"))"') 
DO curl -LO %%A | 
powershell Expand-Archive ./*.zip -DestinationPath . && del .\*.zip
