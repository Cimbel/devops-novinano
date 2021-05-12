#!/bin/bash
echo "export ipdb=$(kubectl describe pods | grep IP | head -n 1 | cut -c 15-35)" >> /home/ubuntu/.bashrc
bash
