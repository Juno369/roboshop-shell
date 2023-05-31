color="\e[34m"
nocolor="\e[0m"

juno() {
  echo -e "${color} step 1 ${nocolor}"
    yum install nginx -y &>>/tmp/roboshop.log

    echo -e "${color} step 2 ${nocolor}"
    rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log

    echo -e "${color} step 3 ${nocolor}"
    curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component.zip &>>/tmp/roboshop.log

    echo -e "${color} step 4 ${nocolor}"
    cd /usr/share/nginx/html &>>/tmp/roboshop.log
    unzip /tmp/$component.zip &>>/tmp/roboshop.log

    #cp /etc/nginx/default.d/roboshop.conf &>>/tmp/roboshop.log

    echo -e "${color} step 5 ${nocolor}"
    systemctl enable nginx &>>/tmp/roboshop.log
    systemctl restart nginx &>>/tmp/roboshop.log
}