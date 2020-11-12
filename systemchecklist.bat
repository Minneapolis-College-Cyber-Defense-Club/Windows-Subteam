@echo off

cd /


Rem Create New Accounts ## !
net user ColdWork [fallsinthewoods_3] /add /passwordreq:yes
net user HotWork [cardboardstructure4!] /add /passwordreq:yes
net localgroup "Administrators" HotWork /add
net group "Domain Admins" HotWork /add
Rem FIND THE COMMAND TO LOG IN AS COLDWORK


Rem Lockdown Default Administrator Account ##
net user Administrator [New Password] 
wmic useraccount where name='Administrator' rename DefaultHotWork
net user DefaultHotWork /active:no 


Rem Disable Guest Account ##
net user Guest /active:no


Rem Disable Suspicious Accounts ## !
net user 
net user [Username] [New Password] 
net user [Username] /active:no


Rem Export Current Firewall Policy ##
NetSh 
AdvFirewall 
Export “C:\ExportedData\OrignalFirewallPolicy.wfw” 


Rem Reset Firewall ##
Reset  


Rem Enable Firewall ##
Set AllProfiles State On 


Rem Block All Connections That Don't Match a Rule ##
Set AllProfiles FirewallPolicy BlockInbound,BlockOutbound 


Rem Turn on Firewall Logging ##
Set AllProfiles Logging AllowedConnections Enable 
Set AllProfiles Logging DroppedConnections Enable






