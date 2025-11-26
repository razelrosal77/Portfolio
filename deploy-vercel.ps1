<#
deploy-vercel.ps1
Simple helper script to deploy this project to Vercel.

Usage:
  .\deploy-vercel.ps1           # interactive deploy (will prompt if necessary)
  .\deploy-vercel.ps1 -Prod    # deploy to production

If you set the VERCEL_TOKEN environment variable the script will pass it to the CLI and run non-interactively.
#>

param(
    [switch]$Prod
)

# Check for npx/Node
if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
    Write-Host "npx not found. Please install Node.js and npm first: https://nodejs.org/"
    exit 1
}

$token = $env:VERCEL_TOKEN
if ($token) {
    Write-Host "Using VERCEL_TOKEN from environment. Deploying..."
    if ($Prod) {
        npx vercel --prod --token $token --confirm
    } else {
        npx vercel --token $token --confirm
    }
} else {
    Write-Host "No VERCEL_TOKEN found. Running interactive deploy (you will be prompted)."
    if ($Prod) { npx vercel --prod } else { npx vercel }
}
