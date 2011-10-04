DATE=$(date +%Y"-"%m"-"%d) # 2011-10-04
VDATE=$(date +%a", "%b" "%d" "%Y", "%r"; "%Z) # Tue, Oct 4 2011, 12:46:34; IST 
CONTENT='content'
FOLDER=$1
TITLE=$2
FILE=''

# create filename
read -p "prepend filename with current date? (y/n) "
if [ "$REPLY" == "y" ]; then
	FILE=${DATE}_$2
else
	FILE=$2
fi

# does file exist?
if [ -e "$CONTENT/$FOLDER/$FILE" ]; then
	echo "file exists"
	exit
fi

# create folder if doesn't exist
if [ ! -d "$CONTENT/$FOLDER" ]; then
	mkdir "$CONTENT/$FOLDER"	
fi

# populate initial variables
cat > "$CONTENT/$FOLDER/$FILE" << XXX
title = $TITLE
date = $VDATE
draft = true
--
XXX

echo "$CONTENT/$FOLDER/$FILE"
