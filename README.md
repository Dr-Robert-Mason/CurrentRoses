# CurrentRoses
Creating current roses

"Wind_spokes_plot.R" contains code for creating currrent roses based on an input matrix that contains raw counts of number of measurements/timepoints falling in each of 16 sectors of the compass from a current sensor e.g. the Marotte sensor. This script needs to be updated to automatically accept matrices with any even number of sectors for plotting current or wind roses.
"Compiling Marotte_data_for_curr..." contains code for creating this matrix from Marotte outputs that I have worked with. It is included just as a guide of what the input matrix to "Wind_spokes_plot.R" should look like, and can be deleted once the "Wind_spokes_plot.R" is updated to a more general format (ie. being able to accept a variety of numbers of sectors of the compass for creating the wind/ current spokes). 
