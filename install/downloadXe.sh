#!/bin/bash
if [[ "$OTN_ACCEPT_LICENSE" = "Y" ]]; then 
    odl --component=db --version=11gXE --os=linux --arch=x64 --accept-license
else 
    echo "You must accept the OTN license agreement to download this software" >&2
    echo "Try setting OTN_ACCEPT_LICENSE to Y if you agree" >&2
    exit 1
fi

