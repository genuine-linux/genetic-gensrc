for d in $(ls); do 
	VERSION="$(echo $d | awk -F"-" '{print $NF}')";
	NAME=$(echo $d | sed 's/'-$VERSION'//g');
	mv -v $d $NAME;
done
