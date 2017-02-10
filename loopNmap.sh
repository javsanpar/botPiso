#!/bin/bash
for i in `seq 1 2`;
do nmap -sP -n 192.168.1.0/24;         
done;
