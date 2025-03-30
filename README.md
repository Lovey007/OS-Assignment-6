# OS-Assignment-6: Producer-Consumer and Queue Implementation in Shell Script

## Overview
This repository contains two shell scripts implementing:
1. **Queue with Two Threads (`queue_threads.sh`)**
   - One thread generates random numbers and enqueues them.
   - Another thread dequeues and prints values.
2. **Producer-Consumer Problem (`producer_consumer.sh`)**
   - A producer generates data and adds it to a shared buffer.
   - A consumer removes data from the buffer for processing.
   - Implements synchronization using a lock mechanism.

---

## Prerequisites
- Bash shell (Linux/macOS)
- Basic understanding of shell scripting

---

## Files
| File Name               | Description |
|-------------------------|-------------|
| `queue_threads.sh`      | Implements a queue with producer and consumer threads. |
| `producer_consumer.sh`  | Implements the classic Producer-Consumer problem using a fixed-size buffer. |

---

## How to Run

### **1. Queue with Two Threads**
#### **Running the script:**
```bash
chmod +x queue_threads.sh
./queue_threads.sh
```
#### **Example Output:**
```
Produced: 45
Consumed: 45
Produced: 22
Consumed: 22
```

---

### **2. Producer-Consumer Problem**
#### **Running the script:**
```bash
chmod +x producer_consumer.sh
./producer_consumer.sh
```
#### **Example Output:**
```
Producer added: 89
Producer added: 12
Consumer processed: 89
Producer added: 34
Consumer processed: 12
```

---

## Explanation
### **queue_threads.sh (Queue with Two Threads)**
- Uses an array as a queue.
- A **producer function** generates random numbers and enqueues them.
- A **consumer function** dequeues numbers and prints them.
- Runs both functions as background processes (`&`).
- Uses a `lockfile` mechanism to synchronize access to the queue.

### **producer_consumer.sh (Producer-Consumer Problem)**
- Implements the classic Producer-Consumer problem.
- Uses a **fixed-size buffer** (queue) to store produced data.
- A **producer** generates data and adds it to the buffer if it's not full.
- A **consumer** removes data if the buffer is not empty.
- Synchronization is managed with a `lockfile` to prevent race conditions.

---


## Author
- Name: Pranzal Sharma
- SID: 21105048
- Branch: ECE

