#!/bin/bash

# The script creates an account on local system
# You will be prompted for account creation and password.


# Ask for user name.
read -p 'Enter the user name to create: ' USER_NAME

# Ask for real name.
read -p 'Enter the real name to create: ' REAL_NAME

# Ask for password.
read -p 'Enter the password to create: ' PASSWORD

# Create the user.
useradd -c "${REAL_NAME}" -m ${USER_NAME}


# Set the password for the user.
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Force password change on first login.
passwd -e ${USER_NAME}

