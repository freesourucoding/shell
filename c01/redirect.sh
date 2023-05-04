#!/bin/bash

mail -s warning root@localhost << EOF

This is content.
This is a test mail for redirect.

EOF


+++++++++++++++++++++++++++++++++++++
#!/bin/bash

cat > /tmp/test.txt << HERE

该文件是测试文件
测试完后，记得将该文件删除
Welcome to Earth
HERE
