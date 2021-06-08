echo "\nEntered the second shell script\n"

echo "This is the data put into the second text file\n"

top -H -b -n 1 |grep Threads > Threads_after.txt #run the top command in |thread mode '-H'|
# with |batch-mode text '-b'| and |run it once '-n 1'|
# Grab the line with 'Thread' word in the string 
#the Output is piped to 'Threads_after.txt' file 

top -H -b -n 1  -w 14 |grep top >> Threads_after.txt  #run the top command in |thread mode '-H'|
# with |batch-mode text '-b'| and |run it once '-n 1'| with a width of 14 '-w 14'
#Grab the line with 'top' word in the line of string   
#the Output is piped to Threads.txt file 
 
cat Threads_after.txt  # Output the contents of the text file

perl search_th.pl # Run the perl script to Output the data in a summarized fashion


