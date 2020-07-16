# xmrig-zero-donations
Docker image based on Ubuntu containing a custom build of XMRig with donations set to 0.


# Disclaimer
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


# Running XMRig using this image
Build using this command: `docker run -itd --name "XMRig" -e XMRIG_JSON_CONFIG_PATH=<path_to_config.json_file> bymatej/xmrig-zero-donations:latest`

## Creating the config file
You can create the config file using the wizard here: https://xmrig.com/wizard

## Passing the config file
You need to pass the path to the config file as an environment variable.
The name of the variable is `XMRIG_JSON_CONFIG_PATH`. Put your own path.

Example: `docker run -itd --name "XMRig" -e XMRIG_JSON_CONFIG_PATH=config/config.json bymatej/xmrig-zero-donations:latest`


# Donations
If you want to donate to me, use the following:
- XMR: `42m3uMhLE3oAFSUKw8YyETR7VS31L95fS6Qe4ctwAEDiFmocEJ4T7kZfjNRK2iURFNS4a9MMFqjmuSHabprWAAroNSmxiMZ`
- BTC: `3796xJsPd9Qcg5YAU19Y9WqMTD7y5mBHx9`

Thank you, and do not forget to donate to the original developer too!
