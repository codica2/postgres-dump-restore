#!/usr/bin/env python

import os

host = '--host %s' % os.environ['db_host']
port = '--port %s' % os.environ['db_port']
dbname = '-d %s' % os.environ['db_name']
options = '%s %s %s' % (host, port, dbname)

print(options)