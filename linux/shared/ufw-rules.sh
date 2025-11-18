#!/bin/bash

# LocalSend rules
sudo ufw allow in 53317/tcp
sudo ufw allow in 53317/udp

# Docker rules
sudo ufw allow from 172.16.0.0/12
