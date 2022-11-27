file1=$1 # input_sequence_file
file2=$2 # output file
RNAfold -p -c < $file1 > $file2
ls | grep ".ss.ps" > ss_files
ls | grep ".dp.ps" > dp_files
paste dp_files ss_files | sed 's/\t/|/g' > input_file_list
mkdir rss_ps_file pdf_file 
for i in $(cat input_file_list)
do
column1=$(echo $i |  cut -f1 -d'|' )
column2=$(echo $i | cut -f2 -d'|')
echo "$column1"
perl /data1/ViennaRNA-2.1.7/Utils/relplot.pl $column2 $column1 > rss_ps_file/$column1._rss.ps
gs -sDEVICE=pdfwrite -o pdf_file/$column1.pdf rss_ps_file/$column1._rss.ps
done

