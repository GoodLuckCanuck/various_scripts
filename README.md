# various_scripts
This is a general dumping ground for scripts and various simple tools.

## substitution_cipher_with_password.sh
This is a very basic substitution cipher for printable characters that uses a password to determine the order of characters in the cipher.  The magic happens by using sort(1) to deterministically 'randomize' the character order used in the cipher based on the md5sum of the password. This is not secure, but is going to prevent casual decryption, since it is more secure than something like ROT13.
