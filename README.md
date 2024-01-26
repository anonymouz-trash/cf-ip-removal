# Cloudflare IP Access Rule Removal Script

Due to harden my Self-Hosted network I tried different tools like 'NPM - Nginx Proxy Manager', 'Traefik', 'Fail2Ban' and 'CrowdSec'.
Obviously I also use Cloudflare as secure DNS for my domain. During the test phases I, of course as intended, created IP access rules automatically with above mentioned tools.

I wanted to delete all IP access rules to start new and fresh. The downside of this is that 'Fail2Ban' and 'CrowdSec' are written to reset/delete only their own pushed rules.
I struggled to get any information around to solve this for me so created this script to use Cloudflare API.

# What it does

 The script asks for the list of IPs from Cloudflare via API and stores them in an array. It then queries each element in this array and deletes it.

# Usage

After pulling the project you have to provide the following information in the script:

- Cloudflare Global API key
