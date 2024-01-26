# Cloudflare IP Access Rule Removal Script

Due to harden my Self-Hosted network I tried different tools like 'NPM - Nginx Proxy Manager', 'Traefik', 'Fail2Ban' and 'CrowdSec'.
Obviously I also use Cloudflare as secure DNS for my domain. During the test phases I, of course as intended, created IP access rules automatically with above mentioned tools.

I wanted to delete all IP access rules to start new and fresh. The downside of this is that 'Fail2Ban' and 'CrowdSec' are written to reset/delete only their own pushed rules.
I struggled to get any information around to solve this for me so created this script to use Cloudflare API.

# What it does

 The script asks for the list of IPs from Cloudflare via API and stores them in an array. It then queries each element in this array and deletes it.

# Prerequisites

- Your Mail used with Cloudflare:
  Like 'foo@bar.net'. (Without quotes)

- Cloudflare Global API key:
  You'll find it in your profile (upper right corner) > My Profile > API Tokens (on the left) > API Keys > Global API key > View

- Zone ID
  When you're editing your domain the URL in your browsers address bar looks like: https://dash.cloudflare.com/<ZONE-ID>/<DOMAIN>
  - <ZONE-ID> = 32 chars string with numbers and lower-case letter from a-z
  - <DOMAIN>  = like, e.g. example.com

# Usage

After pulling the project you have to provide above mentioned informations in the script.


