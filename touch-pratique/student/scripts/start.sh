#!/bin/bash

# create run.py and setup.py
touch student/run.py student/setup.py

# put something in run.py
echo "#!/bin/python3"    > student/run.py
echo "#That is run.py"  > student/run.py
echo "echo \"Hello from run.py \""  > student/run.py

# put something in setup.py
echo "#!/bin/python3"    > student/setup.py
echo "#That is setup.py"  > student/setup.py
echo "echo \"Hello from setup.py \""  > student/setup.py

touch  -t 2312311212 student/run.py student/setup.py

