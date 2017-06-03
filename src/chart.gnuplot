set xlabel "Date"
set timefmt "%s"
#set format x "%m/%d/%Y %H:%M:%S"
set format x "%m/%d/%Y
set xdata time

set terminal png size 1024,768 enhanced font "Helvetica,14"
set output '~/thomascherry.name/all.png'

plot "~/nutshell/all.data" using 1:3 every 3 title 'Bad' smooth bezier \
    ,"~/nutshell/all.data" using 1:4 every 3 title 'Good' smooth bezier

