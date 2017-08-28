#!/usr/bin/python

import os
import sys

#apache
APACHE_DATA = "httpd.txt"
os.chdir(os.path.dirname(__file__))
sys.path.insert(1, os.path.dirname(__file__))

#supplies:
# 1 - csvFileName
# 2 - adminEmail
from httpd import *

from webappSrc import *

csvInit(csvFilename)
smtpInit(adminEmail)
 
application = default_app()

