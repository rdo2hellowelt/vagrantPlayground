#!/usr/bin/env bash
echo  " "
echo  " "
echo  " "
echo  "--- -------------------------------------------"
echo  "--- rdo´s Vagrant Console                   ---"
echo  "--- LastUpDate:06072014@rdo                 ---"
echo  "--- -------------------------------------------"
echo  "--- Install Latest typo3 & Wordpress        ---"
echo  "--- -------------------------------------------"
echo  "--- http://169.169.69.69/phpmyadmin/     ---"
echo  "--- U /. P. : root /. root                  ---"
echo  "--- -------------------------------------------"
echo  "--- -------------------------------------------"

PS3='* Please enter your choice:'

options=("Vagrant Status" "Vagrant UP" "Vagrant Reload" "Vagrant Halt"  "Vagrant SSH"  "Vagrant Help"  "xxx"  "xxx"  "xxx" "Vagrant Destroy" "xxx" "xxx" "Quit" )

select opt in "${options[@]}"
do
    case $opt in

        "Vagrant Status")
echo "you chose Vagrant Status"
echo  "--- ---------------------------"
echo  "--- Please wait             ---"
echo  "--- ---------------------------"
vagrant status
;;

"Vagrant UP")
echo "you chose Vagrant UP"
echo  "--- ---------------------------"
echo  "--- Please wait             ---"
echo  "--- ---------------------------"
vagrant up
;;
"Vagrant Reload")
echo "you chose Vagrant Reload"
echo  "--- ---------------------------"
echo  "--- Please wait             ---"
echo  "--- ---------------------------"
vagrant reload
;;
"Vagrant Halt")
echo "you chose Vagrant Halt"
echo  "--- ---------------------------"
echo  "--- Please wait             ---"
echo  "--- ---------------------------"
vagrant halt
;;
"Vagrant SSH")
echo "you chose Vagrant SSH"
echo  "--- ---------------------------"
echo  "--- Please wait             ---"
echo  "--- ---------------------------"
vagrant ssh
;;
"Vagrant Help")
echo "you chose Vagrant Help"
echo  "--- ---------------------------"
echo  "--- Please wait             ---"
echo  "--- ---------------------------"
vagrant list-commands
;;
"Vagrant Destroy")
echo "you chose Vagrant Destroy"
echo  "--- ---------------------------"
echo  "--- Please wait             ---"
echo  "--- No No No No             ---"
echo  "--- ---------------------------"
echo  "----> type: vagrant destroy, in your own shell !"
;;

"Quit")
echo  "--- ---------------------------"
echo  "--- Bye                     ---"
echo  "--- ---------------------------"
break
;;
*) echo invalid option;;
esac
done


