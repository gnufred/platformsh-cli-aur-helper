#!/bin/bash

pckg_rel_ver=$1
cli_ver=$2
cli_256sums=$3

cp packagist/templates/platformsh-cli/PKGBUILD platformsh-cli/PKGBUILD
cp packagist/templates/platformsh-cli/.SRCINFO platformsh-cli/.SRCINFO
cp packagist/templates/platformsh-cli-git/PKGBUILD platformsh-cli-git/PKGBUILD
cp packagist/templates/platformsh-cli-git/.SRCINFO platformsh-cli-git/.SRCINFO

templates='platformsh-cli/PKGBUILD platformsh-cli/.SRCINFO platformsh-cli-git/PKGBUILD platformsh-cli-git/.SRCINFO'

sed -i "s/{{PACKAGE_RELEASE_VERSION}}/$pckg_rel_ver/g" $templates
sed -i "s/{{CLI_VERSION}}/$cli_ver/g" $templates
sed -i "s/{{CLI_256SUMS}}/$cli_256sums/g" $templates

git --work-tree platformsh-cli/ --git-dir platformsh-cli/.git diff master | grep -E '^(\+|\-)'
git --work-tree platformsh-cli-git/ --git-dir platformsh-cli-git/.git diff master | grep -E '^(\+|\-)'
