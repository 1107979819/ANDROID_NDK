/* ģ������Unix */
/**
 * ����ȫ�ֱ�����ö�ٵȺ���ʱ�����undeclared�Ĵ����� ��������ġ�������1
 * �޸Ĵ���ο�http://www.ibm.com/developerworks/cn/aix/library/au-swig/
 * 
 */
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
//��������1��ֱ���� extern int counter;���������error: 'counter'  undeclared (first use in this function)�Ĵ��� 
/*ͨ����֮ǰ������´��룬���������ɵ�c�ж��� int counter
*	%{
*	int counter;
*	%}
*/
%{
int counter;
%}
extern int counter;

/* ��#define����ĳ���*/
#define MAX_WIDTH 100;

/*�� %constant����ĳ���*/
#define MAX_HEIGHT 100;

/*����ֻ��ģʽ*/
%immutable;
/* ֻ������ */
//ֱ���� extern int xxx��������� ����1 �ᵽ�Ĵ���,����ο�����1�Ľ������������
%{
int readOnly;
%}
extern int readOnly;

/* ����ֻ��ģʽ*/
%mutable;
/* ��д����*/
//ֱ���� extern int xxx��������� ����1 �ᵽ�Ĵ���,����ο�����1�Ľ����������һ����
%{
int readWriter;
%}
extern int readWriter;

/* ����ö�� */
//ö�ٵ�Ҳͬ������� �����1�����⣬�����������
enum  {one = 1,two,three}; 
%{
	enum  {one = 1,two,three}; 
%}
/* ����ö�� */
enum days {Sunday = 1, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday}; 
%{
enum days {Sunday = 1, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday}; 
%}
/* ����ö�� */
%inline %{
enum weeken {Sun = 1, Sat}; 
%}

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