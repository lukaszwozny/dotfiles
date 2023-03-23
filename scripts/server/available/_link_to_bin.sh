# /usr/local/bin

if [ "$1" = "" ]
then
	echo "Usage: $0 <script_name>"
	exit
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
FROM="$SCRIPT_DIR/$1"
TO=$SCRIPT_DIR/../bin

# export PATH=$SCRIPT_DIR:$PATH
echo "Moved $0 to bin"
#echo "ln -s $FROM $TO"
ln -s $FROM $TO
