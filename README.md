# bismuth test environment

![Bismuth logo](/img/bismuth.png)

## Tools used
This setup is designed around Vagrant. Vagrant is an open source tool from the DevOps world that is often used to provision development environments automatically. 

![The final result](/img/vm_window.png)

You need the following set of tools to start:  

* VirtualBox (newest version from the [VirtualBox-Homepage])
* Vagrant (newest version from the [Vagrant-Homepage])
* **Only on Windows**: Git for Windows (newest version from the [Git-Homepage])

## Start of the Environment
The `Vagrantfile` in this repository contains the complete configuration of the environment. This means the definition of the Linux distribution, the networking parameter, packages to install and many things more. Check the Vagrant documentation for pointers whats possible.

> Since the configuration of Vagrant and the environment to create is all part of the source (git) repository, the environment can easily be destroyed and re-created within a couple of minutes.

### Clone the repo
Exactly like with any other development workflow,  the initialisation of this environment is created by checking out this source code repository.
```sh
$ git clone https://github.com/marsmensch/bismuth-testenv
```

### One command to rule them all
In a console (for Windows use `Git-Bash`) open the cloned directory `bismuth-testenv` and execute the **one and only required command to create the environment**:

```sh
$ vagrant up
```

No kidding, that's it!

What happens now is a bit of DevOps magic. After a couple of minutes, the following things happened:

* Vagrant created and configured a virtual machine via VirtualBox
* The shell script `vagrant_provision.sh` installs our desired set of packages
* Vagrant automatically configures a couple of useful shortcuts like a shared folder in `/vagrant` with the host system and convenient passwordless logins via SSH Keys to the VM. 

>         The box has 2048 MB of RAM and 2 CPU cores assigned. Change that in the `Vagrantfile` if you want more or less RAM/CPU.

The VM windows is also shown for your convenience (Vagrant normally hides it), so you can login graphically and test e.g. graphical wallets.

## Connect to your VM
Connecting to your VM is as easy as run a command in a terminal. You need exactly one command to connect:

```sh
$ vagrant ssh
```

> For SSH connections Vagrant looks for a SSH client (`ssh.exe`) in your $PATH. This is already the case for OSX and Linux. On Windows you want to install Git for Windows for this.

## Working with your new VM
As noted above, the included shell script `vagrant_provision.sh` installs your desired set of packages. The example i currently provide with the source installs the $RNS wallet. It can be started via after installation with the command: 

```sh
$ /usr/local/bin/bismuth
``` 

Have fun and stay tuned for the next entry!

[Git-Homepage]: <https://github.com/git-for-windows/git/releases/latest>
[VirtualBox-Homepage]: <https://www.virtualbox.org/wiki/Downloads>
[Vagrant-Homepage]: <https://www.vagrantup.com/downloads.html>