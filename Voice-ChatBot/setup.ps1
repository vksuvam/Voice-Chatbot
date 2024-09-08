# Get the Node.js version
$node_version = node -v

# Extract the major version number
$major_version = [int]$node_version.Split('.')[0].TrimStart("v")

# Check if Node.js version is greater than or equal to 19
if ($major_version -ge 19) {
    Write-Host "Node requirement is satisfied"
}
# Else check if Node.js exists
elseif (Get-Command node -ErrorAction SilentlyContinue) {
    # Clear npm cache and install the latest stable version of Node
    Write-Host "Node.js version is less than 19, upgrading..."
    Start-Process npm -ArgumentList "cache clean -f" -Wait
    Start-Process npm -ArgumentList "install -g n" -Wait
    Start-Process n -ArgumentList "stable" -Wait
    
    # Install the latest Node.js version
    Write-Host "Installing Node.js"
    Start-Process sudo -ArgumentList "apt install -y nodejs" -Wait
    Start-Process sudo -ArgumentList "apt install -y npm" -Wait
}

# Install Python dependencies
pip install -r requirement.txt

# Install Node.js dependencies for React app
cd chatBotVoice
npm install
cd ..
