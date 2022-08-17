#!/bin/bash

# The script creates a user on the local system.
# You will be prompted to enter username(logon), person name, and the password.
# The useername, password and hostname will be displayed for the new created account.

# making sure the script is created with superuser privileges.

if [[ "${UID}" -ne 0 ]]
then 
  echo 'Please run with sudo or as root'
  exit 1
fi


# Get the username

read -p "Enter the user name: " USER_NAME

# Get the real name of the person for which account is created

read -p "Enter the real name for the new user: " COMMENT

#Get the password

read -p "Enter the password: " PASSWORD

# Create the new user

useradd -c "$COMMENT}" -m ${USER_NAME}

# Check to see if useradd command succeeded
if [[ "${?}" -ne 0 ]]
then 
  echo 'The account could not be created'
  exit 1
fi

# Set the password
echo ${PASSWORD} | passwd --stdin  ${USER_NAME}


if [[ "${?}" -ne 0 ]]
then 
  echo 'Password could not be set for the new user'
  exit 1
fi

# Force password change on first login

passwd -e ${USER_NAME}

# Display the username, password, and the host were user was created.

echo 
echo 'Username; '
echo "${USER_NAME}"
echo
echo 'Password: '
echo "${PASSWORD}"
echo
echo 'Host: '
echo "${HOSTNAME}"
exit 0
