# me_ILD1750

1. place logfiles in ./data & run 'pull_logfile_into_one_file.bat' in main folder → creates '0_all_data.dat'
2. run 'python code.py' → creates 'output.csv'
3. run 'gnuplot plot.gp' → creates *.png files from found data blocks
---
* plot ranges are hard coded in 'plot.gp'
* limits are hard coded in 'plot.gp' (red lines)
* error prone string comparison in 'code.py'! (see manual page 64, bits)
