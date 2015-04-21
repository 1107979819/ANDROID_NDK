#include <string.h>
#include <jni.h>

jstring Java_com_test_MainActivity_stringFromJNI( JNIEnv* env, jobject thiz )
{
    return (*env)->NewStringUTF(env, "Hello from JNI !!  ");
}
