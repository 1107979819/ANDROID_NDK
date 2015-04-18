/* 模块名是Unix */
%module Unix
%{
/* 包含 POSIX 操作系统的API */
#include<unistd.h>
%}

/*告诉SWIG uid_t.*/

typedef unsigned int uid_t;

/*让SWIG包装getuid函数*/
extern uid_t getuid(void);
