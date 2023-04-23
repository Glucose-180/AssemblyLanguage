#include <stdio.h>

unsigned int checksum(char *str) {
   unsigned int sum = 0;
   while (*str) {
      sum += *str;
      str++;
   } 
   return sum;
}

int main() {
   char str[] = "Hello, World!";
   printf("Checksum of '%s' is %u", str, checksum(str));
   return 0;
}
