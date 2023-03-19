# /usr/local/bin

if [ "$1" = "" ]
then
	echo "Usage: $0 <script_name>"
	exit
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BIN_DIR=$SCRIPT_DIR/../bin
SCRIPT_DIR="$SCRIPT_DIR/$1"

# export PATH=$SCRIPT_DIR:$PATH
echo "Moved $0 to bin"
ln -s $SCRIPT_DIR $BIN_DIR
