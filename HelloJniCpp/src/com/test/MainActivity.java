
package com.test;
import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
/**
 *  JNIͨ��C++��ȡ�ַ�����C������
 *  ����� JniCppTest.cpp ��˵��
 * @author WYL
 *
 */
public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		System.out.println(stringFromJNI());
	}
    public native String  stringFromJNI();
	static{
		System.loadLibrary("JniCppTest");
		//System.loadLibrary("hello-jni");
	}
}
