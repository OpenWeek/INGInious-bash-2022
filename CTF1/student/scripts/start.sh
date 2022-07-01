#!/bin/bash

cd /task/student && tar -xzvf  CTF.tar.gz && mv CTF2\ \(1\)/ ctf
echo $1 | sha256sum > hash

mv /task/student/scripts/suite4 /task/student/ctf/.ressources/Couloir_g/.suite4