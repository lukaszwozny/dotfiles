echo $(command -v ls)

if [ "$(command -v ls)" = "" ]
then
	echo 'command not exist'
fi
