package com.calljavabyc;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

import com.calljavabyc.R;
/**
 * ͨ��c������java��ķ���
 * @author WYL
 *
 */

public class MainActivity extends Activity {

    private Button btn;
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        System.out.println(getJavaClass().toString());
        System.out.println("ʵ������id��"+getJavaInstanceMethodID());
        System.out.println("��̬����id��"+getJavaStaticMethodID());
        btn = (Button)findViewById(R.id.button1);
        btn.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				 //��java���ø÷���ʱ�����쳣δ���
				//callInstanceMethod();
			}
		});
      
//        System.out.println("����ʵ���������أ�"+(String)callInstanceMethod());
    }
    //��ȡ��
    public native String getJavaClass();
    //��ȡʵ���ķ�����ID
    public native int getJavaInstanceMethodID();
    //��ȡ��̬������ID
    public native int getJavaStaticMethodID();
    //���÷���
  //��java���ø÷���ʱ�����쳣δ���
    public native int callInstanceMethod();
    static{
    	
    	System.loadLibrary("CallJavaMethod");
    }
    
    public int instanceMethod()
	{
		System.out.println("this is javaInstanceMethod");
		return 1;
	}
	public static int staticMethod()
	{
		System.out.println("this isJavaStaticMethod");
		return 1;
	}


}
