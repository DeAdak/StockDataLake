#! /bin/bash
date_var="$(date +"%Y-%m-%d")"

echo "Install required Packages?(Y/N)"
read choice1
if [ $choice1 == "Y" ]
then
  pip install -r ../requirements.txt
fi
echo
echo "Provide Zerodha Login details:"
jtrader zerodha startsession
#if grep -Fxq "Error" Eror_log_main.txt
#then
#  jtrader zerodha startsession
#fi
sleep 4s

echo "Performing File Handling operations now ...."
echo "To proceed further make sure to 'change the renaming files config files containing paths to respective folders'. And then"
read -p "Press any key to continue... " -n 1 -s


mkdir ../data/scriptnamedata_"$date_var"
#hdfs dfs -mkdir ./data_"$date_var"

python ./File_handling/renaming_files.py

