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

/* 全局变量counter */
//在生成的Unix_wrap.c文件中如果出现counter未定义的错误，则需要进行全局声明 int counter;
extern int counter;

/* 用#define定义的常量*/
#define MAX_WIDTH 100;

/*用 %constant定义的常量*/
#define MAX_HEIGHT 100;

/*启用只读模式*/
%immutable;
/* 只读变量 */
extern int readOnly;

/* 禁用只读模式*/
%mutable;
/* 读写变量*/
extern int readWriter;

/* 匿名枚举 */
enum{ one = 1,two = 2,three };

/* 命名枚举 */
enum{ one = 1,two = 2,three };

/* 结构体*/
/*
struct Point{
	int x;	
	int y;
};*/