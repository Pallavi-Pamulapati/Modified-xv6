# The functions added are
- set_priority
- setpriority
- Scheduling Algorithms 
    - FCFS
    - PBS

* set_priority()
    - This is a system call, changes the static priority and returns old static priority of the process

* setpriority()
    - A user program this uses the set_priority system call to change priority and takes syscall arguments as command line arguments.

* Scheduling Algorithms 
    - FCFS 
        - The process which is runnable and that is created first is selected by the CPU and executed.
    - PBS 
        - The process which is runnable and that has high priority(low value) is selected by the CPU and executed.
