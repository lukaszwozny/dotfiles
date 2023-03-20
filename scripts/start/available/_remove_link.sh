# /usr/local/bin

if [ "$1" = "" ]
then
	echo "Usage: $0 <script_name>"
	exit
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
FILE="$SCRIPT_DIR/../bin/$1"

# export PATH=$SCRIPT_DIR:$PATH
echo "Removed $FILE"
#echo "ln -s $FROM $TO"
rm $FILE
