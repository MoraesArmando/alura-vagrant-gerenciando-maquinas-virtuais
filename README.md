# alura-vagrant-gerenciando-maquinas-virtuais

## Vagrant Cloud
Vagrant Cloud serves a public, searchable index of Vagrant boxes: https://app.vagrantup.com/boxes/search
## Commands

### Init
- Create a base Vagrantfile:
    ````
    vagrant init hashicorp/bionic64
    ````
- Create a minimal Vagrantfile (no comments or helpers):
    ````
    vagrant init -m hashicorp/bionic64
    ````
- Create a new Vagrantfile, overwriting the one at the current path:
    ````
    vagrant init -f hashicorp/bionic64
    ````
- Create a Vagrantfile with the specific box, from the specific box URL:
    ````
    vagrant init my-company-box https://example.com/my-company.box
    ````
- Create a Vagrantfile, locking the box to a version constraint:
    ````
    vagrant init --box-version '> 0.1.5' hashicorp/bionic64
    ````
### Status
- This will tell you the state of the machines Vagrant is managing:
    ````
    vagrant status [name|id]
    ````

### SSH Config
- This will output valid configuration for an SSH config file to SSH into the running Vagrant machine from ssh directly (instead of using vagrant ssh).
````
vagrant ssh-config [name|id]
````
- Name of the host for the outputted configuration:
````
vagrant ssh-config --host [name|id]
````

> OBS - Para utilizar o "ssh -i key nome@host" precisamos adicionar a chave pública no arquivo "~/.ssh/authorized_keys"   

### Halt
- This command shuts down the running machine Vagrant is managing:
    ````
    vagrant halt [name|id]
    ````
>Vagrant will first attempt to gracefully shut down the machine by running the guest OS shutdown mechanism. If this fails, or if the --force flag is specified, Vagrant will effectively just shut off power to the machine.


### Reload
-This command is usually required for changes made in the Vagrantfile to take effect.
    ````
    vagrant reload [name|id]
    ````

### Destroy
- This command stops the running machine Vagrant is managing and destroys all resources that were created during the machine creation process.
    ```` 
    vagrant destroy [name|id]
    ````
    - -f or --force - Do not ask for confirmation before destroying
    - -g or --graceful - Shuts down the machine gracefully

### Provision
-This command is a great way to quickly test any provisioners, and is especially useful for incremental development of shell scripts, Chef cookbooks, or Puppet modules.
    ````
    vagrant provision [vm-name]
    ````
    - --provision-with x,y,z -> This will only run the given provisioners.
    ex: vagrant provision --provision-with shell