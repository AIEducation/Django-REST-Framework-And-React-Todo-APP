# -*- coding: utf-8 -*-
import multiprocessing

bind = "0.0.0.0:8000"
workers = multiprocessing.cpu_count() * 2 + 1
reload = True
logfile = "/home/coder/gunicorn.log"
errorlog = "/home/coder/gun_error.log"
accesslog = "/home/coder/gun_access.log"
