/**
 * 直接复制C的代码到到c++中，如果没有用extern "C" { ...}括起来会报出如下异常
 * No implementation found for native Lcom/whty/wcity/HelixPlayer;.setDllPath (Ljava/lang/String;)V
 */
#include <string.h>
#include <jni.h>
extern "C" {
	jstring Java_com_test_MainActivity_stringFromJNI( JNIEnv* env, jobject thiz )
	{
		return env->NewStringUTF( "Hello from JNI CPP !!! ");
	}

}
