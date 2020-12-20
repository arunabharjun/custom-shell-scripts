#!/bin/zsh
function restart_zsh(){
	echo '[restart_zsh] : cd'
	cd
	echo '[restart_zsh] : source ~/.zshrc'
	source ~/.zshrc
}

#Aliases
alias k="kubectl" #kubernetes

#git
function gta(){
	echo '==> git add .'
	git add .
}

function gtst(){
	echo '==> git status'
	git status
}

function gtc(){
	msg="$1"
	if [ -z "$msg" ]; then
    	echo
        echo '[gtc] : bad option'
        echo '[gtc] : possible error - "commit message not provided"'
        echo
        echo 'USAGE : gtc "your commit msg"'
        echo
        PID=$!
        kill -INT $PID
    else
    	echo '==> git commit -m "'$msg'"'
    	git commit -m $msg
    fi
}

function gtp(){
	branch="$1"
	echo '==> git push origin '$branch''
	git push origin $branch
}

#start stop mongo service
function start_mongo(){
    echo '==> brew services start mongodb-community@4.2'
    brew services start mongodb-community@4.2
}

function restart_mongo(){
    echo '==> brew services restart mongodb-community@4.2'
    brew services restart mongodb-community@4.2
}

function stop_mongo(){
    echo '==> brew services stop mongodb-community@4.2'
    brew services stop mongodb-community@4.2
}

#sublime text
function _subl(){
	file="$1"
    if [ -z "$file" ]; then
    	echo
        echo '[_subl] : bad option'
        echo '[_subl] : possible error - "file name not specified"'
        echo
        echo 'USAGE : _subl <filename.file-extension>'
        echo
        PID=$!
        kill -INT $PID
    elif [ ! -f "$file" ]; then
    	echo
        echo '[_subl] : "'$file'" doesnt exist in' $PWD
        echo
        echo '[_subl] : listing files in' $PWD
        ls
        echo
        echo '[_subl] : Creating "'$file'" in' $PWD
        touch $file
        echo
        echo '[_subl] : listing files in' $PWD
        ls
        echo
        echo '[_subl] : file path -' 
        echo $PWD'/'$file
        echo
        echo '[_subl] : Opening' $file 'in Sublime Text'
        open -a /Applications/Sublime\ Text.app $file
        echo
    elif [ -f "$file" ]; then
    	echo
    	echo '[_subl] : "'$file'" exists in' $PWD
    	echo
    	echo '[_subl] : listing files in' $PWD
        ls
        echo
        echo '[_subl] : file path -' 
        echo $PWD'/'$file
        echo
        echo '[_subl] : Opening' $file 'in Sublime Text'
        open -a /Applications/Sublime\ Text.app $file
        echo
    else
    	echo
    	echo '[_subl] : Unknown Error !';
    fi
}

#TextEdit
function _edt(){
	file="$1"
    if [ -z "$file" ]; then
    	echo
        echo '[_edt] : bad option'
        echo '[_edt] : possible error - "file name not specified"'
        echo
        echo 'USAGE : _edt <filename.file-extension>'
        echo
        PID=$!
        kill -INT $PID
    elif [ ! -f "$file" ]; then
    	echo
        echo '[_edt] : "'$file'" doesnt exist in' $PWD
        echo
        echo '[_edt] : listing files in' $PWD
        ls
        echo
        echo '[_edt] : Creating "'$file'" in' $PWD
        touch $file
        echo
        echo '[_edt] : listing files in' $PWD
        ls
        echo
        echo '[_edt] : file path -' 
        echo $PWD'/'$file
        echo
        echo '[_edt] : Opening' $file 'in TextEdit'
        open -a TextEdit $file
        echo
    elif [ -f "$file" ]; then
    	echo
    	echo '[_edt] : "'$file'" exists in' $PWD
    	echo
    	echo '[_edt] : listing files in' $PWD
        ls
        echo
        echo '[_edt] : file path -' 
        echo $PWD'/'$file
        echo
        echo '[_edt] : Opening' $file 'in TextEdit'
        open -a TextEdit $file
        echo
    else
    	echo
    	echo '[_edt] : Unknown Error !';
    fi
}

#start restart stop mysql database
function start_mysql()
{
	sudo /usr/local/mysql/support-files/mysql.server start
	cd /usr/local/mysql/bin
	./mysql -u root -p ;
}

function restart_mysql()
{
	sudo /usr/local/mysql/support-files/mysql.server restart
	cd /usr/local/mysql/bin
	./mysql -u root -p ;
}

function stop_mysql()
{
	sudo /usr/local/mysql/support-files/mysql.server stop
}

#run the docker for neo4j if available
function start_neo4j_docker(){
    docker run \
    --env=NEO4J_AUTH=none \
    --publish=7474:7474 --publish=7687:7687 \
    --volume=$HOME/neo4j/data:/data \
    neo4j
}
