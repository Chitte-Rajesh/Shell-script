#bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [$1 -ne 0 ]
then
    echo -e "$2...$R FAILURE $N"
    exit 1
else 
    echo -e "$2...$R SUCCESS $N"
fi 
}

if [ $USERID -NE 0 ]
then
    echo "Please run the script with root access."
    exit 1 #manually exit if error comes.
else 
    echo -e "you are super user."
fi 

for i in $@
do
  echo "package to install:$i"
  dnf list installed $i &>>$LOGFILE
if [ $? -eq 0 ]
then 
echo -e "$i already installed...$Y SKIPPING $N"
    else
        dnf install $i -y &>>$LOGFILE
        VALIDATE $? "Installation of $i"
    fi
done