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

**Playbook** - Plays are ordered set of tasks to execute againt host selections from your inventory. A playbook is a file containing one or more plays.

**Tasks** - Task run a **module** with arguments to accomplish the required state or action.

Tasks --> Plays --> Playbook

**Ansible Tower** - is an enterprise framework by Redhat, to manage, control and secure your ansible environment.
