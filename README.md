# AUR PshCLI tools

Hacky bash scripts to update the AUR with less manual editing

## How to use

Get maintainer rights for

* https://aur.archlinux.org/packages/platformsh-cli/
* https://aur.archlinux.org/packages/platformsh-cli-git/

Add your SSH key to your AUR account

Get ownership (or coownership) of platformsh-cli and platformsh-cli-git

```
mkdir aur && cd aur

git clone ssh://aur@aur.archlinux.org/platformsh-cli.git
git clone ssh://aur@aur.archlinux.org/platformsh-cli-git.git
git clone ssh://git@github.com:gnufred/platformsh-cli-aur-helper.git

aurrel=1 # This is release number for this CLI version pushed on the AUR
newver='3.40.1' # CHANGE THIS VALUE TO THE CORRECT ONE
newsum='00d61de403085c4585937fe4264cb4b7a66c066447ea71d15f74805a62953984' # CHANGE THIS VALUE TO THE CORRECT ONE

packagist/validate-checksum.sh $newver $newsum
packagist/build-configs.sh $aurrel $newver $newsum
packagist/publish-new-release.sh $newver
```

Then, on a new system (snapshoted VMs are awesome for that)

```
yay -S platformsh-cli
```

Then if verify install with `platform --version`

Then, do the same for `platformsh-cli-git`

```
yay -R platformsh-cli
yay -S platformsh-cli-git
platformsh --version
```

If you mess up, you'll have to manually edit config files in the AUR release repo and git push a new version. Make sure to increment the AUR package release version or your changes won't publish.
