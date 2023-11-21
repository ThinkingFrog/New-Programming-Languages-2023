#!/bin/bash

gcc -o main main.c -I/usr/include/lua5.1 -L/usr/lib64 -llua5.1 -lm
