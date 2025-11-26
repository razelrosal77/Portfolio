Razel Rosal — Portfolio
=======================

This repository contains a static portfolio site ready for deployment to Vercel.

Quick notes before deploying
- The site is static HTML/CSS with images in `Assets/`.
- I updated image references to use existing filenames and added `<picture>` sources for optional WebP files (place WebP files in `Assets/` if you want browsers to load them).
- The contact form currently opens the user's mail client (mailto:). If you want automatic email delivery, we can add a serverless function later.

Deploying to Vercel (web UI)
1. Create a Vercel account at https://vercel.com and log in.
2. Click "New Project" → Import Git Repository and connect your GitHub/GitLab/Bitbucket repo containing this project.
3. For framework, choose "Other" (or let Vercel auto-detect). Set the root to the repository root and the output directory to `/` (empty). No build command is required for pure static sites.
4. Click Deploy.

Deploying from your machine (Vercel CLI)
1. Install Node.js (if not installed). You can install the Vercel CLI globally or use npx when running the deploy command.

    npm i -g vercel

or use npx:

    npx vercel --prod

2. Login to Vercel from the CLI (interactive):

    vercel login

3. From the project root (for example `d:\Portfolio`) run:

    npx vercel --prod

The CLI will ask for project name and link to your account. Accept the suggested defaults if you like.

Deploy using an automated token (CI / script)
- Create a personal token in the Vercel dashboard (Settings → Tokens). Set it as the `VERCEL_TOKEN` environment variable.
- Then run:

    npx vercel --prod --token $env:VERCEL_TOKEN --confirm

Files added to help deploy
- `deploy-vercel.ps1` — a small PowerShell script that runs `npx vercel` and uses `VERCEL_TOKEN` automatically if set.

Notes & troubleshooting
- If images don't show on your deployed site, check filename case (hosts like Vercel are case-sensitive). I matched `index.html` to files in `Assets/` but double-check if you modify images.
- To enable automatic sending from the contact form you must either integrate Formspree (no server) or add a serverless function and an email provider (SendGrid). Ask me and I can implement either.

Security note
- I cannot deploy to your Vercel account without your credentials or token. For safety, run the `deploy-vercel.ps1` script locally instead of sharing credentials.
