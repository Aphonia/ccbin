#!/bin/bash
app_name="webserver-htdoc-1.0"
app_path=build/webserver/htdoc/target/$app_name

tomcat_home=/usr/local/tomcat-7

tomcat_webapps=$tomcat_home/webapps/ROOT
tomcat_logger=$tomcat_home/logs
tomcat_work=$tomcat_home/work
startup=$tomcat_home/bin/startup.sh
app_logger=/root/logs

java_id=$(ps -ef |grep java |grep -w 'java'|grep -v 'grep'|awk '{print $2}')

if [[ "$java_id" = "" ]] 
then
	echo "java process not exists"
else
	echo "shutdown processing..."
	kill -9 $java_id
	sleep 3
	echo "pid[$java_id]shutdown complete"
	sleep 1
fi
rm -rf $tomcat_webapps/*
echo "clear tomcat webapps successful!"
sleep 1
rm -rf $tomcat_logger/*
echo "clear tomcat logger successful!"
sleep 1
rm -rf $tomcat_word/*
echo "clear tomcat cache successful!"
sleep 1
rm -rf $applogger/*
echo "clear app logger successful!"
sleep 1
cp $app_path/* $tomcat_webapps
$startup
echo "start tomcat ..."
sleep 5
tail -1000f $tomcat_logger/catalina.out
