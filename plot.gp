set encoding utf8
set samples 3000

set key autotitle columnheader
set datafile separator ","
set decimalsign '.'

set print '-'
set key center top
set xlabel 'distance [mm]'
set ylabel ''

stats 'output.csv'
no_blocks = STATS_blocks

#set timefmt "%Y-%m-%d %H:%M:%S" #2018-09-13 13:24:06.041552
#set xdata time
#set format x "%H:%M:%.3S"
#set xtics rotate by 45 right

# Define an export "function"/"string", now we don't need the export.gp file
export( file, terminal ) = sprintf( "set terminal push; set terminal %s; set output '%s'; replot; set output; set terminal pop", terminal, file)

do for [IDX=0:no_blocks] {
    set title sprintf("Teil %d", IDX+1)
    plot [:15000][-0.5:0.5] "output.csv" i IDX u 0:2 w l lc "black" t "distance [mm]", \
    0.4 lc "red", \
    -0.4 lc "red"
    print "IDX: ", IDX
  eval export(sprintf("%d.png", IDX+1), "png size 1920, 1080")
}
