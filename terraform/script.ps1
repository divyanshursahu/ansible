New-NetFirewallRule -DisplayName “AllowAnsible” -Direction Inbound -Protocol TCP –LocalPort 5985 -Action Allow