mkdir mountain_plot
for i in `cat dp_files`
do
/data1/ViennaRNA-2.1.7/Utils/mountain.pl $i | xmgrace -pipe -hardcopy -printfile mountain_plot/"$i.jpg" -hdevice JPEG -fixed 1000 800
done
