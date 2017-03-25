# myarch

A simple bash script that helps me on keeping my ArchLinux packages clean.

#### Known Problems

The system used to fetch dependencies (_pactree_) is not aware of optional
dependencies, so this script will always report them unless you add them
explicitly to some package list.
