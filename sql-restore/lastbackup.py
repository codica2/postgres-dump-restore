#!/usr/bin/env python
"""Find the last created file in a given directory."""
import os
import sys
import stat

folder = sys.argv[1] if len(sys.argv) > 1 else os.curdir
files = (os.path.join(folder, name) for name in os.listdir(folder))
entries = ((path, os.lstat(path)) for path in files)  # don't follow symlinks
path, _ = max((e for e in entries if stat.S_ISREG(e[1].st_mode)),  # find regular files
              key=lambda e: getattr(e[1], 'st_birthtime', None) or e[1].st_ctime)
print(path)