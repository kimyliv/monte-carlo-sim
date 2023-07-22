# monte-carlo-sim

The program does simulations on the XY lattice model using the Monte Carlo simulation method.
The main programs are McSimSpinsXY.m and gbinderXY.m which calculates observables for a given
gridsize and calculates the binder cumulant and magnetic susceptibility for various gridsizes.
The latter program together with the file Postprocessing_criticaltemperature.m is used to find the 
critical temperature and for the XY model.

The data found in the respiratory can be visualised with the Postprocessing files. The data was
used to create the graphs for the Monte Carlo conference poster found in the Conference_poster 
folder.

The simulation is computationally demanding and requires a big number of iterations for good 
and usable data for the different obserables.
