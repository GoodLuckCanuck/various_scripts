#!/bin/bash

MODE="$1"
PASSWORD="$2"
CHARSET_ORIG='^<> _;:!.()[]{}@$*&#%0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ'
CHARSET_ENCR=$(echo "${CHARSET_ORIG}" | fold -s1 | sort -R --random-source=<(echo "${PASSWORD}" | md5sum) | tr -d '\n')

if [ "${MODE}" = 'e' ]; then
  tr "[${CHARSET_ORIG}]" "[${CHARSET_ENCR}]"
elif [ "${MODE}" = 'd' ]; then
  tr "[${CHARSET_ENCR}]" "[${CHARSET_ORIG}]"
else
  echo
  echo "This is a very basic substitution cipher for printable characters that uses a password to determine the"
  echo "order of characters in the cipher.  The magic happens by using sort(1) to deterministically 'randomize'"
  echo "the character order used in the cipher based on the md5sum of the password. This is not secure, but is"
  echo "going to prevent casual decryption, since it is more secure than something like ROT13."
  echo
  echo "usage (encrypt): echo 'String to encrypt!' | ./substitution_cipher.sh e 'PASSWORD'"
  echo "usage (decrypt): echo 'oK*1}9YK4Yk}[*M7Kh' | ./substitution_cipher.sh d 'PASSWORD'"
fi
