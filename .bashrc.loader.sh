
for TYPE in 'default' 'general' 'osx' 'linux' 'work' 'crap'
do
	FILE="$HOME/.home/.bashrc.$TYPE.sh"
	test -f $FILE && . $FILE
done