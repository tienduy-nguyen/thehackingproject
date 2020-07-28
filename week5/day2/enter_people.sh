db="example2.db"
table="people"

echo "===Welcome==="
echo "Please Enter User Info"

while [ 1 ]
do
  echo -n "First Name: "
  read fname
  if [ "$fname" = "" ];then echo "Value Needed";exit 1;fi

  echo -n "Last Name: "
  read lname
  if [ "$lname" = "" ];then echo "Value Needed";exit 1;fi

  echo -n "Phone Number: "
  read phone
  if [ "$phone" = "" ];then echo "Value Needed";exit 1;fi

  sqlite3 "$db" "INSERT INTO $table VALUES ('$fname','$lname','$phone')"&& echo "$fname Entered" || echo "ERROR"

  echo -n "Would you like to enter another user? (Y/n): "
  read ans

  if [ "$ans" = "n" ]
  then
    echo "Goodbye..."
    exit 0
  else
    clear
  fi
done