#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <time.h>

// **NOTE** fprintf is used to print the messages to terminal and 'standard error
// stream' is used  instead 'standard output', this methods prints the messages 
// in the right sequence instead of buffering them to the end

void* Thread_1(void* arg) // Function for thread 1 
{
  struct timeval t0, t1, time_diff;  // Used for testing the 
  gettimeofday(&t0,NULL);             // actual time taken by the thread 
  fprintf(stderr,"Entered the first thread\n");   
  sleep(1);   // sleep for 1 second
  gettimeofday(&t1,NULL);   //  time after 
  timersub(&t1,&t0,&time_diff); // store the difference in before and after time
  fprintf(stderr,"\nLeft the first thread\n"); 
  fprintf(stderr,"doSomething (thread %ld) took %d.%06d sec\n",(long)pthread_self()
	 ,time_diff.tv_sec,time_diff.tv_usec); // print time taken with the accuracy
						// of microseconds 
  pthread_exit(0); // exit the thread
}

void* Thread_2(void* arg) // Function for thread 2 
{
  fprintf(stderr,"Entered the second thread\n"); 
  sleep(7); // sleep for seven seconds
  fprintf(stderr,"\nLeft the second thread\n");
  pthread_exit(0); // exit the thread
}

void* Thread_3(void* arg) // Function for thread 3
{
  fprintf(stderr,"Entered the third thread\n");
  sleep(5); // sleep for five seconds
  fprintf(stderr,"\nLeft the third thread\n");
  pthread_exit(0);// exit thread
}


int main()
{
pid_t pid; // declare a variable 'pid' of type pid_t
pid =fork();// fork a child and parent process and assign the return value to 'pid' 

if(pid==0) // if inside child process (fork's return value zero means in child process)
{
 char * path1="./first.sh"; // path for the first shell script
char * arg1[]={"./first",NULL}; // default argument needed by 'execvp' function
 execvp(path1,arg1); // executes the 'first.sh' shell script
}

else if(pid > 0) // If Inside the parent process
{
//Thread ID
pthread_t tid1; // declare a variable 'tid1' of type pthread_t
pthread_t tid2; // declare a variable 'tid2' of type pthread_t
pthread_t tid3; // declare a variable 'tid3' of type pthread_t

//Create the threads
pthread_create(&tid1,NULL,&Thread_1,NULL);//initalize tid1 and run Thread_1 function 
pthread_create(&tid2,NULL,&Thread_2,NULL);//initalize tid1 and run Thread_1 function 
pthread_create(&tid3,NULL,&Thread_3,NULL);//initalize tid1 and run Thread_1 function 

//wait until the thread has done its work
pthread_join(tid1,NULL); // wait for thread with thread ID tid1, no return value needed
pthread_join(tid2,NULL); // wait for thread with thread ID tid1, no return value needed
pthread_join(tid3,NULL); // wait for thread with thread ID tid1, no return value needed
//sleep(10);
wait(NULL); // Wait for the child process to finish (If it hasn't)
}
else if(pid < 0) // If there was an error in forking
{
 perror("Fork failed"); //Print an error messsage
 exit(1); // exit with return value 1 
}

pid=fork(); // Create another child process and parent process  
if(pid == 0) // If in child process 
{
char *path2="./second.sh"; // path to second shell script
char *arg2[]={"./second",NULL}; // default argument needed for execvp
execvp(path2,arg2);// execute the 'second.sh' shell script 
}
else if(pid>0) 
{
wait(NULL); // wait for the child process to finish
printf("\nExiting the main loop\n"); 
}
}
//to compile we use  = gcc sum_on_t.c  -pthread -o some_name 
// we use the c99 format because we declared the variable in the for loop which can't be done in the linux C version
