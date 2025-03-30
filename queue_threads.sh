#!/bin/bash

queue=()
queue_size=5  # User-defined length (modify if needed)
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

# Producer function (random number generator)
producer() {
    while true; do
        lock
        if [ ${#queue[@]} -lt $queue_size ]; then
            num=$((RANDOM % 100 + 1))
            queue+=("$num")
            echo "Produced: $num"
        fi
        unlock
        sleep 1  # Simulate work
    done
}

# Consumer function (dequeues and prints values)
consumer() {
    while true; do
        lock
        if [ ${#queue[@]} -gt 0 ]; then
            num=${queue[0]}
            queue=("${queue[@]:1}")  # Remove first element
            echo "Consumed: $num"
        fi
        unlock
        sleep 2  # Simulate work
    done
}

# Start producer and consumer in background
producer &
consumer &

# Keep script running
wait
