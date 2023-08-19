sudo ansible winserver -i ~/ansible_test/hosts.txt -m win_ping -v

sudo ansible winserver -i /home/div/github/ansible/ansible-for-windows/hosts -m win_ping -v


New-NetFirewallRule -DisplayName “AllowAnsible” -Direction Inbound -Protocol TCP –LocalPort 5985 -Action Allow