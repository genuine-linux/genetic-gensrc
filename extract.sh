for SOURCE in $(ls *.src.gen); do 
	SOURCE_NAME="$(echo $SOURCE | sed 's/\.src\.gen//g')";
	VERSION="$(echo $SOURCE_NAME | awk -F"-" '{print $NF}')";
	NAME=$(echo $SOURCE_NAME | sed 's/'-$VERSION'//g');
	echo -n "Extracting $SOURCE ... " &&
	tar -xf $SOURCE &&
	cd $NAME-$VERSION &&
	rm -rf $NAME-$VERSION &&
	find . -type f -name "*.log" -exec rm -f {} + &&
	cd .. &&
	echo "OK!"
done
