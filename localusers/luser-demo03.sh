#!/bin/bash



# Display the UID of the user.
echo "Your UID is ${UID}"


# Display if the user is vagrant user or not.


# Only display if the UID does not match 1000.
UID_TO_TEST_FOR='1000'
if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]]
then 
  echo "Your UID does not matches ${UID_TO_TEST_FOR}"
  exit 1
fi
# Display the username.
USER_NAME="$(id -un)"


echo "Your user name is ${USER_NAME}"

# Test if the command is succeeded.
if [[ "${?}" -ne 0 ]]
then 
  echo 'Your command was not executed successfully'
  exit 1
fi

# You can use a string test conditional.
USER_NAME_TO_TEST='vagrant'
if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST}" ]]
then 
  echo "Your user name matches ${USER_NAME_TO_TEST}"
fi

exit 0


