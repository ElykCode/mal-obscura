#!/bin/bash

# this script serves the purpose of a signature (hash) based anti-malware program

BANNED_PROGRAMS_HASHES=(
	'b98eb5938fe21ecdcce8e5bc45905600'
)

# very basic implementation, no error checking (may add later)
PROGRAM_TO_CHECK=$1
PROGRAM_HASH=$(md5sum $PROGRAM_TO_CHECK | cut -d" " -f 1)

for hash in ${BANNED_PROGRAMS_HASHES[@]}; do
	[[ $PROGRAM_HASH == $hash ]] && echo "That program is banned!" && exit 1
done

echo "Well, the program wasn't in the banned list, so I guess it's okay!"
