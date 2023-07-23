zureuser@linux-vm:~/ansible_test$ mv hosts hosts.txt
azureuser@linux-vm:~/ansible_test$ sudo ansible winserver -i ~/ansible_test/hosts.txt -m win_ping -v
No config file found; using defaults
[WARNING]:  * Failed to parse /home/azureuser/ansible_test/hosts.txt with ini plugin: /home/azureuser/ansible_test/hosts.txt:3: Section [remote_server:vars] not valid for undefined group: remote_server
[WARNING]: Unable to parse /home/azureuser/ansible_test/hosts.txt as an inventory source
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'
20.85.232.32 | UNREACHABLE! => {
    "changed": false,
    "msg": "Failed to connect to the host via ssh: ssh: connect to host 20.85.232.32 port 22: Connection timed out",
    "unreachable": true
}
azureuser@linux-vm:~/ansible_test$ ls
hosts.txt
azureuser@linux-vm:~/ansible_test$ vi hosts.txt 
azureuser@linux-vm:~/ansible_test$ sudo ansible winserver -i ~/ansible_test/hosts.txt -m win_ping -v
No config file found; using defaults
20.85.232.32 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
azureuser@linux-vm:~/ansible_test$ sudo ansible winserver -i ~/ansible_test/hosts.txt -m win_ping -v
No config file found; using defaults
20.85.232.32 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
azureuser@linux-vm:~/ansible_test$ vi hosts.txt 
azureuser@linux-vm:~/ansible_test$ sudo ansible winserver -i ~/ansible_test/hosts.txt -m win_ping -v
No config file found; using defaults
20.85.232.32 | UNREACHABLE! => {
    "changed": false,
    "msg": "ntlm: HTTPSConnectionPool(host='20.85.232.32', port=5986): Max retries exceeded with url: /wsman (Caused by ConnectTimeoutError(<urllib3.connection.HTTPSConnection object at 0x7fb4997855a0>, 'Connection to 20.85.232.32 timed out. (connect timeout=30)'))",
    "unreachable": true
}
azureuser@linux-vm:~/ansible_test$ vi hosts.txt 
azureuser@linux-vm:~/ansible_test$ sudo ansible winserver -i ~/ansible_test/hosts.txt -m win_ping -v
No config file found; using defaults
20.85.232.32 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
azureuser@linux-vm:~/ansible_test$ 
azureuser@linux-vm:~/ansible_test$ 


[reference doc]  -- https://cscontents.com/how-to-connect-with-windows-machine-using-ansible
