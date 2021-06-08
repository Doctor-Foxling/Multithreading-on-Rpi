#!/usr/bin/perl

use strict;  
use warnings;

print "\n\n THE PERL SCRIPT BEGINS \n\n"; #Annouce the entry into the perl script

my $Threads_total_before; # scalar variable for total threads in first text file
my $Threads_total_after; # scalar variable for total threads in the second text file
my $Threads_running; # scalar variable for running threads
my $Threads_sleeping; # scalar variable for running threads
my $start_minute; # scalar variable for start time's minute part
my $start_second; # scalar variable for start time's second part
my $end_minute; # scalar variable for end time's minute part
my $end_second; # scalar variable for end time's second part 
my @my_array; #array variable for storing the words in a row of a file
my @start_time; #array variable for storig the hours,minutes and secs of start time
my @end_time; #array variable for storing the hours,minutes and secs of end time 
my $row; #scalar variable for storing the row of a file

my $filename = 'Threads.txt'; # name of the text file to be read
open(my $fh,'<:encoding(UTF-8)',$filename) #Open 'Threads.txt' as a big string '$fh'
        or die "Could not open file '$filename' $!"; # exit with a message if file can't open

while( $row = <$fh>) #run a while loop with range equal to the number of rows in $fh string 
{
chomp $row; # Get rid of any empty newlines
@my_array=split(' ',$row); #split the words in the row based on 'spaces' and store them in @my_array  
if($row =~ /Threads/) # using regex '=~ //' determine if the word 'Thread' appears in the row
{
$Threads_total_before=$my_array[1]; #get the second element of @my_array which is total threads
$Threads_running=$my_array[3]; #get the fourth element of @my_array which is running threads
$Threads_sleeping=$my_array[5];# get the sixth element of @my_array which is sleeping threads
}
elsif($row =~ /top/) # using regex '=~ //' check if the word 'top' appears in the row
{
 @start_time=split(':',$my_array[2]); #split digits in the array based on ':' & store in @start_time  
 $start_minute=$start_time[1]; # store the 2nd element of @start_time, which is minutes
 $start_second=$start_time[2]; # store the 2nd element of @start_time, which is minutes
}

}

#      PRINT THE READINGS IN UNDERSTABDABLE TEXT
print "Total number of threads are $Threads_total_before\n";
print "$Threads_running of the $Threads_total_before are running\n";
print "$Threads_sleeping threads are taking a nap\n";
print "Start minute : $start_minute\n";
print "Start second : $start_second\n";

my $filename2 = 'Threads_after.txt'; # name of the second file to be read
open(my $fh2,'<:encoding(UTF-8)',$filename2)  #Open 'Threads_after.txt' as a big string '$fh2' 
        or die "Could not open file '$filename' $!"; # exit with a message if file can't open

while( $row = <$fh2>) # run a while loop with range equal to the number of rows in $fh2 string
{
chomp $row; # Get rid of empty newlines
@my_array=split(' ',$row); #split the words in the row based on 'spaces' and store them in @my_array
if($row =~ /Threads/)  # using regex '=~ //' check if the word 'Thread' appears in the row
{
$Threads_total_after=$my_array[1];#get the second element of @my_array which is total threads 
$Threads_running=$my_array[3];#get the fourth element of @my_array which is runnning threads
$Threads_sleeping=$my_array[5];#get the sixth element of @my_array which is sleeping threads
}
elsif($row =~ /top/)  # using regex '=~ //' check if the word 'Top' appears in the row
{
 @end_time=split(':',$my_array[2]); #split the words in the @my_array[2] based on ':'  

 $end_minute=$end_time[1]; # get the second element of end-time, which is minutes
 $end_second=$end_time[2]; # get the third element of end-time, which is seconds
}

}

#               PRINT THE DATA IN UNDERSTANDABLE TEXT
print "\nTotal number of threads are $Threads_total_after\n";
print "$Threads_running of the $Threads_total_after are running\n";
print "$Threads_sleeping threads are taking a nap\n";
print "End minute : $end_minute\n";
print "End second : $end_second\n";

# Get the number of threads spawned by comparing the total threads from both the text file
my $number_of_threads = $Threads_total_before - $Threads_total_after;
print "\n$number_of_threads threads were created by the executable\n";

#Get the time taken for all threads to finish executing by comparing time from both text files
if($end_minute == $start_minute) # If less than a minute was spent
{
 my $diff = $end_second - $start_second; # get the time difference
 print "\n$diff seconds were taken to complete all ",  
           "the threads spawned by the executable\n";
}
else # if more than a minute was taken
{
 my $diff = (($end_minute - $start_minute) * 60 ) + 
		($end_second - $start_second); # Get the time difference
 print "\n$diff seconds were taken to complete all ",
           "the threads spawned by the executable\n";	
}

print " \n\n PERL SCRIPT ENDS \n\n" # Announce the exit from perl script
