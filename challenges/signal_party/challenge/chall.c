#include<stdio.h>
#include<stdlib.h>
#include<signal.h>
#include<unistd.h>
#include<sys/types.h>

FILE *output;

void encrypt(int sig){
  fputc(sig + 0x7F, output);
}

int main (int argc, char *argv[])
{
  pid_t pid = getpid();
  char c;
  FILE *flag = fopen("flag.txt","r");
  if ( flag == NULL ){
    printf("Could not open file.\n");
    return 1;
  }
  output = fopen("output","w");

  signal(SIGSYS,encrypt);
  signal(SIGPOLL,encrypt);
  signal(SIGWINCH,encrypt);
  signal(SIGVTALRM,encrypt);
  signal(SIGXCPU,encrypt);
  signal(SIGTTOU,encrypt);
  signal(SIGTSTP,encrypt);
  signal(SIGCHLD,encrypt);
  signal(SIGTERM,encrypt);
  signal(SIGPIPE,encrypt);
  signal(SIGSEGV,encrypt);
  signal(SIGFPE,encrypt);
  signal(SIGABRT,encrypt);
  signal(SIGILL,encrypt);
  signal(SIGINT,encrypt);
  signal(SIGHUP,encrypt);
  signal(SIGQUIT,encrypt);
  signal(SIGTRAP,encrypt);
  signal(SIGBUS,encrypt);
  signal(SIGUSR1,encrypt);
  signal(SIGUSR2,encrypt);
  signal(SIGALRM,encrypt);
  signal(SIGSTKFLT,encrypt);
  signal(SIGCONT,encrypt);
  signal(SIGTTIN,encrypt);
  signal(SIGURG,encrypt);
  signal(SIGXFSZ,encrypt);
  signal(SIGPROF,encrypt);
  signal(SIGIO,encrypt);
  signal(SIGPWR,encrypt);

  while ((c = fgetc(flag))!= EOF)
  {
    if ((int)c > 64 )
    {
      kill(pid,(int)c % 32);
    }else if((int)c < 58){
      kill(pid,(int)c % 32 % 5 + 27);
    }
  }

  fclose(flag);
  fclose(output);

  return 0;
}
