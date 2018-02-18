+++
author = "Alexander Shchapov"
date = 2015-07-26T06:31:22Z
description = ""
draft = false
slug = "python-gdb"
tags = ["tech", "python"]
title = "gdb python cheatsheet"
+++

### Install

Assuming you want to benefit from pyhton-readable traces we need a `py-bt` extension and debug symbols:

    sudo apt-get install gdb python2.7-dbg

### Attach

Attaching to a running process (you must be either owner of this process or root):

    gdb python
    gdb> attach <pid>

Note: process is stopped the moment you attach.

### Inspect

* list code for current frame with `py-list`. Current line is shown as `>`:

```
gdb> py-list
1427            Takes length to receive and repeatedly calls recv until able to
1428            return a buffer of that length, raising ConnectionFailure on error.
1429            """
1430            message = EMPTY
1431            while length:
>1432                chunk = sock_info.sock.recv(length)
1433                if chunk == EMPTY:
1434                    raise ConnectionFailure("connection closed")
1435                length -= len(chunk)
1436                message += chunk
1437            return message
```

* list all threads with `info threads`
* list code for all frames `thread apply all py-list`
* switch between threads with `thread <number>`
* navigate frames with `py-up` and `py-down`
* inspect context with `py-locals`, `py-globals` and `py-print`
* resume process with `c`

### Read

* [wiki entry for Debugging with Python](https://wiki.python.org/moin/DebuggingWithGdb)
* [python gdb support guide](https://docs.python.org/devguide/gdb.html)
