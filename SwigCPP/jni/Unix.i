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

/* �ṹ��*/ 
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
/* ͨ��ָ�� */
void drawByPointer(struct Point* p);
//void drawByPointer(struct Point* p);
///* ͨ������ */
//void drawByReference(struct Point& p);
//
///* ͨ��ָ�� */
//void drawByValue(struct Point  p);

