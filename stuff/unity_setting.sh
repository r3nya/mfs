#!/bin/bash

gsettings set com.canonical.Unity form-factor "Desktop"
#gsettings set com.canonical.Unity form-factor "Automatic"

gsettings set com.canonical.Unity.Panel systray-whitelist "['all']"
