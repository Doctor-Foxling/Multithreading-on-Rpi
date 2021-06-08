# Multithreading-on-Rpi

<p>
The project explores the advantages of writing multi-threaded code over traditional, sequential style code. A multi-threaded C-program is created on a Raspberry-pi that makes
use of the multiple cores of a Raspberry-pi and runs simultaneously. Two shell scripts are forked as child processes, that grabs the background system data, at the time when 
the multi-threaded code is running and this data is then piped into two respective text files. A Perl script is used to break the stored data to extract useful information that
is used to analyse the working of OS as the Kernel-Level threads are created.
<br><br>
A detailed explaination is provided <a href="#0">Here</a>.
</p>

## What I learned

<ul>
  <li>Learned to write multi-threaded code</li>
  <li>Learned to work with multiple child processes spawned from a parent process</li>
  <li>Improved shell scripting skills</li>
  <li>Learned to write code in Perl</li>
  <li>Gained a deeper understanding of the lower level workings of an OS</li>
</ul>

## Screenshots

<img src="https://github.com/Doctor-Foxling/Multithreading-on-Rpi/blob/master/Readme/top%20multi_core.png">

<img src="https://github.com/Doctor-Foxling/Multithreading-on-Rpi/blob/master/Readme/Final_Output.png">

<img src="https://github.com/Doctor-Foxling/Multithreading-on-Rpi/blob/master/Readme/Perl%20script%201.png">



