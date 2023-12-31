<picture>
    <source width="200" media="(prefers-color-scheme: dark)" srcset="https://www.vectorlogo.zone/logos/ansible/ansible-ar21.png">
    <img width="200" src="https://www.vectorlogo.zone/logos/ansible/ansible-ar21.png">
</picture>

### What is Ansible

Ansible is an open source IT automation tool that automates your IT environment for provisioning, configuration management, application deployment, orchestration, and many other manual IT processes.

Ansible is,

- **Simple** - commands and playbook are human readable and easy to exchange between teams; you don;t need any special skills to read it.
- **Powerful** - you can manage application/patch/server deployment, configuration, workflow automation, etc.
- **Agentless** - Ansible does not need any agent to be running on the managed hosts, instead it connects to the hosts using OpenSSH or WinRM.


### How Ansible Works

![image](https://github.com/divyanshursahu/ansible/assets/96013623/f50ada23-0723-44a3-93e9-4463dbc48702)

### Ansible Concept and Architecture

**Control node** - Ansible is installed and run from the control node and will contain copied of your project files including playbooks. It can be workstation or a dedicated server in the environment.

*Note:* Ansible control node can be a Linux Machine only

**Managed hosts** - these are listed servers or nodes in the inventory - defined as static or via dynamic inventory scripts - on which Ansible commands or playbook tasks need to be executed.

**Ansible Inventory**
Inventory file defines the hosts and groups of hosts upon which commands, modules, and tasks in a playbook operate. The file can be in one of many formats depending on your Ansible environment and plugins. The default inventory located at /etc/ansible/hosts

**Playbook** - Plays are ordered set of tasks to execute againt host selections from your inventory. A playbook is a file containing one or more plays. Playbooks are the files where the Ansible code is written. Playbooks are written in YAML format. YAML means "Yet Another Markup Language,".

**Tasks** - Task run a **module** with arguments to accomplish the required state or action.

Tasks --> Plays --> Playbook

**Ansible Tower** - is an enterprise framework by Redhat, to manage, control and secure your ansible environment.

**Ansible Config file**
The file that governs the behavior of all interactions performed by the control node. In Ansible’s case that default configuration file is (ansible.cfg) located in /etc/ansible/ansible.cfg. 

Ansible program is fully depends on the the ansible configuration file which can be stored in multiple locations depends on your project preference. You can store your **ansible.cfg** at below locations and see the preference order. (top item has the most priority)

$ANSIBLE_CONFIG – Environment variable
./ansible.cfg – cfg file in current directory
~/.ansible.cfg – home directory
/etc/ansible/ansible.cfg – default cfg

As you can see above, ansible will search for the $ANSIBLE_CONFIG variable and load that config if available. If not set, program will try to load config from current working directory, then from our home directory and if all those not available, ansible load config file from default location – /etc/ansible/ansible.cfg.

### Inventory file example:
```
db_and_web_server ansible_connection=ssh ansible_ssh_pass=Passw0rd ansible_host=192.168.1.14
```
