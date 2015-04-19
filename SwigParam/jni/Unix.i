/* 模块名是Unix */
/**
 * 定义全局变量和枚举等函数时会出现undeclared的错误，如 下面标明的》》错误1
 * 修改错误参考http://www.ibm.com/developerworks/cn/aix/library/au-swig/
 * 
 */
%module Unix
%{
/* 包含 POSIX 操作系统的API */
#include<unistd.h>
%}
/*告诉SWIG uid_t.*/

typedef unsigned int uid_t;

/*让SWIG包装getuid函数*/
extern uid_t getuid(void);

/* 全局变量counter */
//》》错误1：直接用 extern int counter;声明会出现error: 'counter'  undeclared (first use in this function)的错误 
/*通过在之前添加如下代码，可以在生成的c中定义 int counter
*	%{
*	int counter;
*	%}
*/
%{
int counter;
%}
extern int counter;

/* 用#define定义的常量*/
#define MAX_WIDTH 100;

/*用 %constant定义的常量*/
#define MAX_HEIGHT 100;

/*启用只读模式*/
%immutable;
/* 只读变量 */
//直接用 extern int xxx会出现上面 错误1 提到的错误,解决参考错误1的解决方法，如下
%{
int readOnly;
%}
extern int readOnly;

/* 禁用只读模式*/
%mutable;
/* 读写变量*/
//直接用 extern int xxx会出现上面 错误1 提到的错误,解决参考错误1的解决方法，其一如下
%{
int readWriter;
%}
extern int readWriter;

/* 匿名枚举 */
//枚举的也同样会出现 如错误1的问题，解决方法如下
enum  {one = 1,two,three}; 
%{
	enum  {one = 1,two,three}; 
%}
/* 命名枚举 */
enum days {Sunday = 1, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday}; 
%{
enum days {Sunday = 1, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday}; 
%}
/* 命名枚举 */
%inline %{
enum weeken {Sun = 1, Sat}; 
%}

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