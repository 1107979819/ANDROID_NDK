/*
 * c调用java的 方法
 */
#include<jni.h>
#include<string.h>



//获取java的类
//使用GetObjectClass 或者 FindClass方法获得类
Java_com_calljavabyc_MainActivity_getJavaClass(JNIEnv *env,jobject thiz)
{
	jclass clazz;
	//GetObjectClass方法只能传入jobject thiz获取调用本方法的类，不能和FindClass方法那样通过类的路径来获取类
	//clazz = (*env)->GetObjectClass(env,thiz);
	//clazz = (*env)->FindClass(env, thiz);//直接传入thiz作为参数，发生异常
	//clazz = (*env)->FindClass(env, "com/calljavabyc/MainActivity");
	clazz = (*env)->FindClass(env, "com/calljavabyc/JavaMethod");
	return clazz;
}
//获取获取实例方法的ID
//使用 GetMethodID 方法获取实例方法ID
jint Java_com_calljavabyc_MainActivity_getJavaInstanceMethodID(JNIEnv *env,jobject thiz)
{
	jclass clazz = (*env)->FindClass(env, "com/calljavabyc/JavaMethod");
	jmethodID jmId = (*env)->GetMethodID(env,clazz, "javaInstanceMethod", "()Ljava/lang/String;");//注意  "()Ljava/lang/String;" 前面有对括号，后面有一个分号

	return jmId;
}
//获取获取静态方法的ID
//使用GetStaticMethodID方法获取静态方法的ID
jint Java_com_calljavabyc_MainActivity_getJavaStaticMethodID(JNIEnv *env,jobject thiz)
{
	jclass  clazz = (*env)->FindClass(env, "com/calljavabyc/JavaMethod");
	jmethodID jmId = (*env)->GetStaticMethodID(env,clazz, "javaStaticMethod", "()Ljava/lang/String;");//注意  "()Ljava/lang/String;" 前面有对括号，后面有一个分号

	return jmId;
}
//调用实例方法
//使用 Call<Type>Method 方法调用 java的实例方法
//用java调用该方法时出现异常未解决
jint Java_com_calljavabyc_MainActivity_callInstanceMethod(JNIEnv *env,jobject thiz)
{
	jclass clazz = (*env)->GetObjectClass(env,thiz);
	jmethodID jmId = (*env)->GetMethodID(env,clazz, "instanceMethod", "()Ljava/lang/integer;");//整型的域描述()Ljava/lang/integer;可以用()I来代替
	jint  i= (*env)->CallIntMethod(env,clazz,jmId);
	return i;
}
