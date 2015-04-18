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
 * 通过c来调用java类的方法
 * @author WYL
 *
 */

public class MainActivity extends Activity {

    private Button btn;
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        System.out.println(getJavaClass().toString());
        System.out.println("实例方法id："+getJavaInstanceMethodID());
        System.out.println("静态方法id："+getJavaStaticMethodID());
        btn = (Button)findViewById(R.id.button1);
        btn.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				 //用java调用该方法时出现异常未解决
				//callInstanceMethod();
			}
		});
      
//        System.out.println("调用实例方法返回："+(String)callInstanceMethod());
    }
    //获取类
    public native String getJavaClass();
    //获取实例的方法的ID
    public native int getJavaInstanceMethodID();
    //获取静态方法的ID
    public native int getJavaStaticMethodID();
    //调用方法
  //用java调用该方法时出现异常未解决
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
