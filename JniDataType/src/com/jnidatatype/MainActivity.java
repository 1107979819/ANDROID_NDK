package com.jnidatatype;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;
/**
 * JNI��������ѧϰ
 * @author WYL
 *
 */

public class MainActivity extends Activity {
	private TextView tv1,tv2;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        tv1 = (TextView)findViewById(R.id.t1);
        tv2 = (TextView)findViewById(R.id.t2);
        tv1.setText(getUTFString());
        tv2.setText(strCat("���","ndk"));
    }
    
    //��ȡC++���ص�UTF-8���ַ���
    public native String getUTFString();
    
    public native String  unimplementedgetUTFString();
    
    //���������ַ���������c++�����������ַ���
    public native String strCat(String str,String str2);
    public native String  unimplementedstrCat(String str,String str2);
    
    //////////////////////
    static{
    	System.loadLibrary("data-type");
    }

}
