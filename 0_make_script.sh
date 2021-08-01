#!/bin/bash

if [ $# != 1 ]
then
	echo "As argv enter name of a file!"
	exit 1
fi
name=$1
cat >> $name << EOF
#!/bin/bash


EOF
chmod +x $name
vim $name
