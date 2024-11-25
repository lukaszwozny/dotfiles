# /usr/local/bin

if [ "$1" = "" ]
then
	echo "Usage: $0 <script_name>"
	exit
fi

DST="$HOME/.local/bin"
TRG="$(pwd)"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SCRIPT_DIR=$SCRIPT_DIR/bin

# export PATH=$SCRIPT_DIR:$PATH
echo "PATH=$PATH:$SCRIPT_DIR" >> ~/.bashrc
echo "Added $SCRIPT_DIR to PATH"
echo $PATH
