#include <stdio.h>

int
main ( int argc, char * * argv ) {
  (void)fprintf(stdout, "%d\n", argc);

  for ( unsigned int i = 0; i < argc; i++ )
    (void)fprintf(stdout, "- %s\n", argv[i]);

  return (0);
}
