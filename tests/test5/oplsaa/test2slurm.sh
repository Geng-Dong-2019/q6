#!/bin/bash
# Remember to change here the number of nodes to what is available in the queue
# you're calling. Perhaps you'll also need to issue the --exclusive option.
sbatch -n 16 -t 12:00:00 -w compute-0-24 -J test5 smooth.sh

