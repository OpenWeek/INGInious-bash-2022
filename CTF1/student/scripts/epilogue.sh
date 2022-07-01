#!/bin/bash

cd /task/student
last=$(cat hash)
echo $last | sha256sum > hash