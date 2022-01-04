# Mal-Obscura

## A malware obfuscation conceptual demonstration

### Gist

This is a very high level, conceptual look at hiding malware from signature-based AV software. This probably wouldn't actually work in real life, but it's a nice look at the rough concept.

This demonstration has a "signature-based AV client", a "malicious" script (it's not actually malicious), a good script, and obfuscation programs (an encoder and decoder).

### Operation of the demo

1) Run `bash av.sh goodscript.sh` and `bash av.sh badscript.sh`. The good script should pass the check, and the bad script should fail it.

2) Run `bash malob-encode.sh badscript.sh`. This produces a file called script.encoded. The file is just the bad script reversed top to bottom and left to right.

3) Run `bash malob-exec.sh script.encoded`. This will run the "malicious" script, which tells you that it ran and compromised your system (it doesn't actually do anything beside print that message).

### How it works

To simulate a signature-based AV, the "AV client" hashes the given script and compares it to the known hash of the bad script. It then tells you if it matched.

The first encoding/obfuscation script simply reverses the input script using `tac` and `rev` and writes it to a file. The second one reverses the encoded file you gave it and sends it to `bash`. Reversing the text in a script file changes the md5 hash of the file, which means the AV no longer recognizes it. Reversing the text of the script also makes it harder to actually read, if you're analyzing the script by hand (or eye?).
