#ifdef WIN32
	#define sys 1
	#define slash "\\"
	#define C_NRM  ""
	#define C_RED  ""
	#define C_GRN  ""
	#define C_ORG  ""
#else
	#define sys 0
	#define slash "/"
	#define C_NRM  "\x1B[0m"
	#define C_RED  "\x1B[31m"
	#define C_GRN  "\x1B[32m"
	#define C_ORG
#endif

#define MAXLEN 30

/*----------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>


/*----------------------------------------*/
#include "structs.h"

#include "outros.h"
#include "inputs.h"

#include "files_write.h"
#include "creationFunctions/reservation.h"
#include "creationFunctions/date.h"
#include "creationFunctions/space.h"
#include "creationFunctions/user.h"

#include "lowLevFunctions.h"
#include "highLevFunctions.h"

#include "files_read.h"