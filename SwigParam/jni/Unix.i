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

/* ȫ�ֱ���counter */
//�����ɵ�Unix_wrap.c�ļ����������counterδ����Ĵ�������Ҫ����ȫ������ int counter;
extern int counter;

/* ��#define����ĳ���*/
#define MAX_WIDTH 100;

/*�� %constant����ĳ���*/
#define MAX_HEIGHT 100;

/*����ֻ��ģʽ*/
%immutable;
/* ֻ������ */
extern int readOnly;

/* ����ֻ��ģʽ*/
%mutable;
/* ��д����*/
extern int readWriter;

/* ����ö�� */
enum{ one = 1,two = 2,three };

/* ����ö�� */
enum{ one = 1,two = 2,three };

/* �ṹ��*/
/*
struct Point{
	int x;	
	int y;
};*/