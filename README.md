## What is Pact?
Package Tool, aka. pact, is a simple wrapper for the pacman package manager, similar to apt. The main use case for it is to provide newcomers with an easier time installing packages on Arch Linux.

## Install
```sh
sudo wget https://raw.githubusercontent.com/antunnitraj/pact/main/pact -O /usr/bin/pact
sudo chmod +x /usr/bin/pact
```

## Usage
```
pact
  update        - updates resources.
  upgrade       - updates all packages on the system.
  full-upgrade  - updates the whole system.
  show          - shows information of provided package/s.
  install       - installs package/s.
  search        - searches package/s.
  remove        - removes package/s.
  purge         - purges package/s.
  autoremove    - removes unused packages.
```

## Few Examples
```sh
# Update system debian style
sudo pact update && sudo pact upgrade

# Update system
sudo pact full-upgrade

# Install htop
sudo pact install htop

# Remove htop
sudo pact remove htop

# Purge htop (removes all dependencies and htop)
sudo pact purge htop
```

## Uninstall
```sh
sudo rm /usr/bin/pact
```
