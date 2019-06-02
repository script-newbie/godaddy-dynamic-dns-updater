# godaddy-dynamic-dns-updater

A very simple dns updater script specifically for GoDaddy domains which aims to help people who want to consistently point their domains to their locally hosted servers that don't have static IP Addresses.


## Prerequisites
- jq is a lightweight and flexible command-line JSON processor. https://stedolan.github.io/jq/
- GoDaddy API Key for production https://developer.godaddy.com/keys

## How to use
1. Clone this repo. `git clone https://github.com/script-newbie/godaddy-dynamic-dns-updater.git`.
2. cd inside the cloned repo.
3. make both shell scripts executable using this command `chmod -R +x *.sh`.   
4. Modify the `AUTH` and `DOMAIN` variables inside 'dns-updater.sh'.
5. Add it as a cron job that would run every minute. `./install-cron-job.sh`.
6. Enjoy!


Notes: There's a logfile named 'log.txt' for every A RECORD update event that happens located in the same folder as the `dns-updater` script if you used the `./install-cron-job.sh` on step 5.


## Tested on 
1. Ubuntu 18.04 LTS
2. Ubuntu 16.04 LTS
3. Debian Stretch Lite
