#!/bin/bash

# Generates list of random passwords.

PASSWORD="${RANDOM}${RANDOM}${RANDOM}"

echo "${PASSWORD}"


# Using current date/time for password.

PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# A better password

PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "${PASSWORD}"

# Even better password

PASSWORD=$(date +%s%N${RANDOM}$RANDOM} | sha256sum | head -c54)
echo "${PASSWORD}"

# adding a special character
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+' | fold -w1 | shuf | head   -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"
