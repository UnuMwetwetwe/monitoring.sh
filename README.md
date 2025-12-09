*This project has been created as part of the 42 curriculum by aldecour*

# Description

This repository contains the signature key to a virtual machine as part of the Born2BeRoot project.
This project consists of creating a virtual machine, setting up an OS and implementing strict rules.

# Instructions

First, compare the signature key present in the repository.
To do so, open the default installation folder and go to the VM's folder :\
`~/VirtualBox VMs/foobar_vm/`

Then, retrieve the signature of the VM from the ".vdi" file, in sha1 format :\
`sha1sum foobar_serv.vdi`

This is an exemple output :\
24c66af6e9b5fa9ffaff3f68f891ae111217b69a

# Ressources

Here's a non-exhaustive list of ressources that have been used whilst researching for this project :

[Virtual Box Administrator's Guide](https://docs.oracle.com/en/virtualization/virtualbox/6.1/admin/#Administrator's-Guide-for-Release-6.1)\
[Debian Wiki](https://wiki.debian.org/)\
[LVM page on Ubuntu Wiki](https://doc.ubuntu-fr.org/lvm) (my apologies for the ~french~)\
[UFW doumentation page](https://help.ubuntu.com/community/UFW)\
[Password policy module](https://manpages.debian.org/testing/libpam-pwquality/pam_pwquality.8.en.html)\
[God's gift to mankind](https://man7.org/linux/man-pages/man1/man.1.html)

# Project description

## OS choice

Debian was chosen as an OS for it's beginner friendly features and high documentation availability. This contrasts with the other option, Rocky Linux, wich is more pro oriented, and much less easy for a first time administrator.

## Partitioning

Partitioning was done using LVM, wich allows dynamic partition resizing, easy storage management and snapshot creation for backup purposes.

## Security

AppArmor was the security module used wich provides Mandatory Access Control seurity. It allows per user and path-based restrictions, as well as working flawlessly with standard Linux file permissions.
While SELinux offers a more strict security system, AppArmor is easier to configure, and works just fine for home computers as well as servers where ease of management is top priority.\
AppArmor needs less maintenance than SELinux since it contains less rules, wich also gives it better performances.

For password security, libpam-pwquality was used to allow stricter password rules.

## Firewall

UFW is a firewall manager wich provides 

