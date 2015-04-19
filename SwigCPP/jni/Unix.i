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

/* 结构体*/ 
%{
	struct Point{
		int x;
		int y;
	};
%}
struct Point{
	int x;
	int y;
};
/* 通过指针 */
void drawByPointer(struct Point* p);
//void drawByPointer(struct Point* p);
///* 通过引用 */
//void drawByReference(struct Point& p);
//
///* 通过指针 */
//void drawByValue(struct Point  p);

