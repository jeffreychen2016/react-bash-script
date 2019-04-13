# react-bash-script

### Purpose:
This script is created for auto-generating js and css files along with the boilerplate for new react component that is created. When execute the script, a directory will be created using the component name that the user passes in. Inside of the directory, two files -- js and css -- will be created using the same component name.

### Usage:
```
# bash rcc.sh componentName boilerplateFlag
bash rcc.sh Test -c
```
##### The script is expecting two parameters: component name and boilerplate flag for js file. <br>
**Component name:** the script will automatically capitalize the first letter of the component name. This component name will be used as the component directory name as well as the js and css file name. <br>

**Boilerplate flag:** there are 2 different flags available ```-f and -c```. if ```-f``` is used, the boilerplate for js file will be functional based. if ```-c``` is used, the boilerplate for js file will be class based.

### Run The Script Globally:
if you want to run the script globally, then do the following:
1. Grant the file executable permission
```chmod +x rcc.sh```
2. rename the file from rcc.sh -> rcc
3. Copy the file to either ```/usr/bin``` or ```/usr/local/bin```
```sudo cp rcc /usr/bin/rcc```
or
```sudo cp rcc /usr/local/bin/rcc```
Note that, script in  /usr/local/bin is available for all users while /usr/bin is only available for yourself.

After running above code, you should be able to execute the script as ```rcc Test -f```

### Troubleshoot:
when running the script, if receive error: ```$'\r': command not found```, try to run the script with: ```dos2unix rcc.sh``` first. This will covert the file to Unix format. Then run the script again as normal. 
