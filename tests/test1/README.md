Ligand in a water sphere test.
================================================================================

This test follows an initial equilibration/heating protocol performed 
in 5 steps and then a dynamics run split into 5 identical steps. A total of
200ps are simulated after equilibration.

The system is a simple ligand in a water sphere and the
force-field used is the OPLSAA force field from Jorgensen's lab.

To run this test the scripts `run_test_mpi.sh` and `run_test_nompi.sh` are
provided, as well as a script to submit the process to a cluster where the
slurm resource manager is available (`test2slurm.sh`). The scripts need to be
modified in the first lines in order to specify the location of the qdyn
executable in you system and also the version of MPI you will use to run the
simulation in parallel (qdynp) if such is the case.


Equilibration (Heating)
--------------------------------------------------------------------------------

### Step1
 - 100 steps / 0.1 fs ea. = 0.01ps
 - temp = 1
 - bath coupling 1
 - hydrogen shake off
 - Local Reaction Field as Taylor expansion = off


### Step2
 - 1000 steps / 2.0 fs ea. = 2ps
 - temp = 50
 - bath coupling 10
 - hydrogen shake on
 - Local Reaction Field as Taylor expansion = on


### Step3
 - 1000 steps / 2.0 fs ea. = 2ps
 - temp = 150
 - bath coupling 10
 - hydrogen shake on
 - Local Reaction Field as Taylor expansion = on


### Step4
 - 5000 steps / 2.0 fs ea. = 10ps
 - temp = 300
 - bath coupling 10
 - hydrogen shake on
 - Local Reaction Field as Taylor expansion = on


### Step5
 - 25000 steps / 2.0 fs ea. = 50ps
 - temp = 300
 - bath coupling 100
 - hydrogen shake on
 - Local Reaction Field as Taylor expansion = on



Short Production Run
--------------------------------------------------------------------------------

### Step1 through Step5 (identical steps total 200ps)
 - 20000 steps / 2.0 fs ea. = 40ps
 - temp = 300
 - bath coupling 100
 - hydrogen shake on
 - Local Reaction Field as Taylor expansion = on


Benchmarks
--------------------------------------------------------------------------------


|  Machine     | Compiler    | Comp. time (min) | Sim. time (ns) | Num Proc. |    Date    |
|:-------------|:-----------:|:----------------:|:--------------:|:---------:|:----------:|
| csb          | ifort       | 79.00            |      0.20      |   8       | 2014-05-22 |
| triolith     | ifort       | 00.00            |      0.20      |   8       | 2014-XX-XX |
| tintin       | ifort       | 00.00            |      0.20      |   8       | 2014-XX-XX |
| csb          | gcc         | 00.00            |      0.20      |   8       | 2014-XX-XX |
| triolith     | gcc         | 00.00            |      0.20      |   8       | 2014-XX-XX |
| tintin       | gcc         | 00.00            |      0.20      |   8       | 2014-XX-XX |


TODO
--------------------------------------------------------------------------------

The following to-do list highlights what needs to be done for
expanding the benchmark

- [ ] Make a script that will send runs of 1, 2, 3, 4, 5ns runs to
      different cluster nodes at the same time.
- [ ] Make number of processors gradient script.
- [x] Make a markdown document describing the test.
- [ ] Make a general R script for plotting and making statistics with
      the benchmarks.
