/* ģ������Unix */
%module Unix
%{
/* ���� POSIX ����ϵͳ��API */
#include<unistd.h>
%}

/*����SWIG uid_t.*/

typedef unsigned int uid_t;

/*��SWIG��װgetuid����*/
extern uid_t getuid(void);
