#!/bin/sh

newver=$1
newsum="$2  platform.phar"

# cleanup, in case of failure or manual download
rm platform.phar > /dev/null

wget "https://github.com/platformsh/platformsh-cli/releases/download/v$newver/platform.phar"
dl_sum=$(sha256sum platform.phar)

echo "dl_sum: $dl_sum"
echo "newsum: $newsum"

if [ "$newsum" == "$dl_sum" ]
then
    echo "Success: checksum match"
else
    echo "Failure: checksum doesn't match"
fi
