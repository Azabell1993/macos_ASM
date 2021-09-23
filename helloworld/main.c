int
main(int argc, const char **argv, const char **envp) 
{
  long write = 0x2000004;
  long stdout = 1;
  char * str = "Hello World\n";
  unsigned long len = 0xC;
  unsigned long ret = 0x0;

  __asm__(
		  "movq %1, %%rax;\n"
          "movq %2, %%rdi;\n"
          "movq %3, %%rsi;\n"
          "movq %4, %%rdx;\n"
          "syscall;\n"
          "movq %%rax, %0;\n"
          : "=g"(ret)
          : "g"(write), "g"(stdout), "g"(str), "g"(len)
          : 
		  );

  return ret;
}
