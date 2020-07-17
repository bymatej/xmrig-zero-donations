# xmrig-zero-donations
Docker image based on Ubuntu containing a custom build of XMRig with donations set to 0.


# Disclaimer
This image was made for fun and as an experiment. It works, but if you want to use it
use it at your own risk. Also, do not buy the mining rigs without prior research. :)

This project is based on XMRig.
Check it out here: https://github.com/xmrig/xmrig

I do not own the code from the XMRig.
The only thing I did here is I created a docker image based on Ubuntu,
which builds the XMRig from Git with donations set to zero.

You still need to set donations to zero if you use the `config.json` file.

**IMPORTANT**

If you want to use this image you **must** make at least a one-time donation to
the original developer of XMRig. It was requested here:

https://github.com/xmrig/xmrig/blob/master/src/donate.h#L43

Thank you!


# Prerequisites
Ensure your Docker engine has at least 3.5 GB of RAM available.
If not, please change the `"mode": "fast"` to `"mode": "auto"` or `"mode": "light"`.
Keep in mind that this will reduce the hashrates.


# Running XMRig using this image
Build using this command: `docker run -d --name "XMRig" --mount type=bind,source=<absolute_path_to_your_local_conig.json_file>,target=/miner/config.json bymatej/xmrig-zero-donations:latest`

## Creating the config file
You can create the config file using the wizard here: https://xmrig.com/wizard

Wizard does not have all the options available.
To change more options, check out this raw version of the config.json file:
https://raw.githubusercontent.com/xmrig/xmrig/master/src/config.json

Wizard will also set the donations to 1% minimum.
After you change download the json.config file, change it from 1 to 0 manually.
Like this: `"donate-level": 0`

## Environment variables
Other useful options for the miner are:
- `-t, --threads=N               number of CPU threads`
- `     --cpu-priority            set process priority (0 idle, 2 normal to 5 highest)`

Full list is here: https://github.com/xmrig/xmrig#command-line-options

Environment variables do not cover the full list.
Most of it is covered by the config.json file.

Here are the default values:
- `-t 2`
- `--cpu-priority 4`

To override any of them, just provide an `-e` parameter to the `docker run` command.

## Passing the config file
You need to pass the **absolute path** to the config file in the source argument for `--mount`.
It is the path on your local machine (outside of Docker).
This way you can easily change of the config.json file and just restart your container.
I did not want to use volumes.

The target must always be `/miner/config.json`.

Full example: `docker run -d --name "XMRig" --mount type=bind,source=/home/user/projects/xmrig-zero-donations/config/config.json,target=/miner/config.json bymatej/xmrig-zero-donations:latest`

The example above would mount the config.json file from this repo (assuming you ran the command in the root of the git repo folder).


# Resources
You can find some good resources here.

## Good XMR pools:
I use SupportXMR. This is the URL: `pool.supportxmr.com:443`
This is a good article on the topic: https://www.exodus.io/blog/best-monero-pools/

## Good XMR wallets
I use MyMonero. But there are other great wallets too.
This is a good article on the topic: https://changelly.com/blog/best-monero-xmr-wallets/


# Donations
If you want to donate to me, use the following:
- XMR: `42m3uMhLE3oAFSUKw8YyETR7VS31L95fS6Qe4ctwAEDiFmocEJ4T7kZfjNRK2iURFNS4a9MMFqjmuSHabprWAAroNSmxiMZ`
- BTC: `3796xJsPd9Qcg5YAU19Y9WqMTD7y5mBHx9`

Thank you, and do not forget to donate to the original developer too!
