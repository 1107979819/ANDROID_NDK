/**
 * 	��������
 */
#include<string.h>
#include<jni.h>

//����UTF-8���ַ���
Java_com_jnidatatype_MainActivity_getUTFString(JNIEnv *env,jobject thiz)
{
	return (*env)->NewStringUTF(env,"this is UTF String");
}

//��ȡjava������ַ���������java�ַ���ת��Ϊc���ַ������ٷ���
Java_com_jnidatatype_MainActivity_strCat(JNIEnv *env,jobject thiz,jstring string1,jstring string2)
{
	const char* str1;
	const char* str2;
	jboolean isCopy;
	str1 = (*env)->GetStringUTFChars(env,string1,isCopy);
	str2 = (*env)->GetStringUTFChars(env,string2,isCopy);

		int str1_len = strlen(str1);

	    int str2_len = strlen(str2);


	    char pszRet[str1_len + str2_len*2 +1];

	    strcpy(pszRet, str1);

	    strcat(pszRet, str2);

	    strcat(pszRet, str2);

	return (*env)->NewStringUTF(env, pszRet);
}
