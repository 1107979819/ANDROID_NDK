/**
 * ֱ�Ӹ���C�Ĵ��뵽��c++�У����û����extern "C" { ...}�������ᱨ�������쳣
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
