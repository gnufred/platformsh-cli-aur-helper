#!/bin/sh

newver=$1

cd ./platformsh-cli
git add PKGBUILD .SRCINFO
git commit -S --message "Release version: $newver"
git push
cd -

cd ./platformsh-cli-git
git add PKGBUILD .SRCINFO
git commit -S --message "Release version: $newver"
git push
cd -
