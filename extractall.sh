#!/bin/bash

SOURCE_POOL="/var/cache/genetic/SourcePool"

for SOURCE in $(ls $SOURCE_POOL/*.src.gen); do 
	SOURCE_NAME="$(echo $SOURCE | awk -F/ '{print $NF}' | sed 's/\.src\.gen//g')";
	VERSION="$(echo $SOURCE_NAME | awk -F"-" '{print $NF}')";
	NAME=$(echo $SOURCE_NAME | sed 's/'-$VERSION'//g');
	echo -n "Extracting $SOURCE files ... " &&
	tar -xf $SOURCE &&
	cd $NAME-$VERSION &&
	rm -rf $NAME-$VERSION &&
	find . -type f -name "*.log" -exec rm -f {} + &&
	find . -type d -name "\$" -exec rm -rf {} + &&
	cd .. &&
	if [ -d "$NAME" ]; then
		rm -rf $NAME;
	fi &&
	mv $NAME-$VERSION $NAME &&
	echo "OK!"
done

chown -R root:root *

exit $?
