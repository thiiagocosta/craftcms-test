
# CraftCMS - Test # 

## Install ##

First:
#### Changing your hosts file (MANDATORY) ####
You need to go to your **/etc/hosts** <br/>
(Using Administrator Account)

MAC/LINUX: /etc/hosts <br/>
Windows: Windows\System32\Drivers\etc\hosts

ADD the line below:
```
#CraftCMS Test
127.0.0.1 local.craftcmstest.com
```

### Execute: ###
```
cd install/
./install.sh
```

Wait for the database container to complete, and next execute:
```
./dump.sh
```

### Next: ###
Open in your Browser:<br/>
[local.craftcmstest.com](http://local.craftcmstest.com)

Administrator Access:<br/>
[local.craftcmstest.com/admin](http://local.craftcmstest.com/admin)

Login: craftcmstest <br/>
Password: craftcmstest


## Finished!! :rocket:

![myImage](https://media.giphy.com/media/XRB1uf2F9bGOA/giphy.gif)