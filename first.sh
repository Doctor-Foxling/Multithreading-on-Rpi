
echo  "\nEntered the first shell script\n" #Announce that shell script is executed
top -H -b -n 1 |grep Threads > Threads.txt #run the top command in |thread mode '-H'|
# with |batch-mode text '-b'| and |run it once '-n 1'|
# Grab the line with 'Thread' word in the string 
#the Output is piped to Threads.txt file 

top -H -b -n 1 -w 14 |grep top >>Threads.txt  #run the top command in |thread mode '-H'|
# with |batch-mode text '-b'| and |run it once '-n 1'| with a width of 14 '-w 14'
#Grab the line with 'top' word in the line of string   
#the Output is piped to Threads.txt file 

echo  "This is the data put into the first text file\n"
 
cat Threads.txt # Output the contents of the text file

echo "\n"

C_prog_pid="$(pidof Thread_runner)" # Get the process Id of the executable Thread_runner

echo  "$C_prog_pid is the process ID of the running executable\n"
