# ansible-box

1. Requirements
This package uses the latest versions of dependencies. PLEASE UPDATE!
    - Latest Vagrant version. Get it [from here](https://www.vagrantup.com/downloads.html).
    - Latest VirtualBox version. Get it [from here](https://www.virtualbox.org/wiki/Downloads).
    - The `vagrant-bindfs` plugin. Install it by using `vagrant plugin install vagrant-bindfs`
    - If you are on an Unix system, install Ansible locally [from here](http://docs.ansible.com/ansible/intro_installation.html#installation).
    - If you are using Windows, continue to the Installation chapter

2. Installation
    - `git clone git@github.com:calinpristavu/ansible-box.git projectName`
    - before vagrant up, check the configuration chapter
    - `vagrant up`
    - insert root password when prompted for it
    - grab a coffee

3. Configuration
    This ansible setup contains a list of packages that you can install.
    WARNING!! Before vagrant up, only enable the ones you need!

    Enabling and disabling packages is done in `ansible/site.yml`
