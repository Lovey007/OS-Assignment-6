#!/bin/bash

queue=()
queue_size=5
lockfile="queue.lock"

# Function to acquire lock
lock() {
    while [ -e "$lockfile" ]; do
        sleep 0.1
    done
    touch "$lockfile"
}

# Function to release lock
unlock() {
    rm -f "$lockfile"
}

# Producer function (produces data)
producer() {
    while true; do
        lock
        if [ ${#queue[@]} -lt $queue_size ]; then
            num=$((RANDOM % 100 + 1))
            queue+=("$num")
            echo "Producer added: $num"
        fi
        unlock
        sleep $((RANDOM % 3 + 1))  # Simulating random production time
    done
}

# Consumer function (consumes data)
consumer() {
    while true; do
        lock
        if [ ${#queue[@]} -gt 0 ]; then
            num=${queue[0]}
            queue=("${queue[@]:1}")  # Remove first element
            echo "Consumer processed: $num"
        fi
        unlock
        sleep $((RANDOM % 3 + 1))  # Simulating random consumption time
    done
}

# Start producer and consumer in background
producer &
consumer &

# Keep script running
wait
