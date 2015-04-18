/*
 * c����java�� ����
 */
#include<jni.h>
#include<string.h>



//��ȡjava����
//ʹ��GetObjectClass ���� FindClass���������
Java_com_calljavabyc_MainActivity_getJavaClass(JNIEnv *env,jobject thiz)
{
	jclass clazz;
	//GetObjectClass����ֻ�ܴ���jobject thiz��ȡ���ñ��������࣬���ܺ�FindClass��������ͨ�����·������ȡ��
	//clazz = (*env)->GetObjectClass(env,thiz);
	//clazz = (*env)->FindClass(env, thiz);//ֱ�Ӵ���thiz��Ϊ�����������쳣
	//clazz = (*env)->FindClass(env, "com/calljavabyc/MainActivity");
	clazz = (*env)->FindClass(env, "com/calljavabyc/JavaMethod");
	return clazz;
}
//��ȡ��ȡʵ��������ID
//ʹ�� GetMethodID ������ȡʵ������ID
jint Java_com_calljavabyc_MainActivity_getJavaInstanceMethodID(JNIEnv *env,jobject thiz)
{
	jclass clazz = (*env)->FindClass(env, "com/calljavabyc/JavaMethod");
	jmethodID jmId = (*env)->GetMethodID(env,clazz, "javaInstanceMethod", "()Ljava/lang/String;");//ע��  "()Ljava/lang/String;" ǰ���ж����ţ�������һ���ֺ�

	return jmId;
}
//��ȡ��ȡ��̬������ID
//ʹ��GetStaticMethodID������ȡ��̬������ID
jint Java_com_calljavabyc_MainActivity_getJavaStaticMethodID(JNIEnv *env,jobject thiz)
{
	jclass  clazz = (*env)->FindClass(env, "com/calljavabyc/JavaMethod");
	jmethodID jmId = (*env)->GetStaticMethodID(env,clazz, "javaStaticMethod", "()Ljava/lang/String;");//ע��  "()Ljava/lang/String;" ǰ���ж����ţ�������һ���ֺ�

	return jmId;
}
//����ʵ������
//ʹ�� Call<Type>Method �������� java��ʵ������
//��java���ø÷���ʱ�����쳣δ���
jint Java_com_calljavabyc_MainActivity_callInstanceMethod(JNIEnv *env,jobject thiz)
{
	jclass clazz = (*env)->GetObjectClass(env,thiz);
	jmethodID jmId = (*env)->GetMethodID(env,clazz, "instanceMethod", "()Ljava/lang/integer;");//���͵�������()Ljava/lang/integer;������()I������
	jint  i= (*env)->CallIntMethod(env,clazz,jmId);
	return i;
}
