
package com.test;
import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
/**
 *  JNI通过C++获取字符串与C的区别
 *  区别见 JniCppTest.cpp 的说明
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
