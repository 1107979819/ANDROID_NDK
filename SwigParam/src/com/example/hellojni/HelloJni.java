/**
 * SWING 自动生成jni代码
 * 步奏：
 * 		1、创建Unix.i文件后cmd进入项目的根目录执行
 * 命令: 
 * 			swig -java -package com.apress.swig -outdir src/com/apress/swig jni/Unix.i
 * 		2、将SWIG集成到Android构造过程中
 * 
 * 具体参照《Android C++高级编程  使用NDK 》
 * 或者http://blog.csdn.net/hai836045106/article/details/39371777
 */
package com.example.hellojni;

import com.apress.swig.Unix;
import com.apress.swig.UnixConstants;

import android.app.Activity;
import android.widget.TextView;
import android.os.Bundle;


public class HelloJni extends Activity
{
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);

        /* Create a TextView and set its content.
         * the text is retrieved by calling a native
         * function.
         */
        TextView  tv = new TextView(this);
        tv.setText( "UID："+ Unix.getuid() );
        setContentView(tv);
        //设置SWIG设定生成的全局变量 counter
        Unix.setCounter(102);
        //输出 获取SWIG设定生成的全局变量 counter
        System.out.println(Unix.getCounter());
        //输出 获取SWIG通过 %constant定义的常量
        System.out.println(UnixConstants.MAX_HEIGHT);
        //输出 获取SWIG通过 #define定义的常量
        System.out.println(UnixConstants.MAX_WIDTH);
    }

    /* A native method that is implemented by the
     * 'hello-jni' native library, which is packaged
     * with this application.
     */
    public native String  stringFromJNI();

    /* This is another native method declaration that is *not*
     * implemented by 'hello-jni'. This is simply to show that
     * you can declare as many native methods in your Java code
     * as you want, their implementation is searched in the
     * currently loaded native libraries only the first time
     * you call them.
     *
     * Trying to call this function will result in a
     * java.lang.UnsatisfiedLinkError exception !
     */
    public native String  unimplementedStringFromJNI();

    /* this is used to load the 'hello-jni' library on application
     * startup. The library has already been unpacked into
     * /data/data/com.example.hellojni/lib/libhello-jni.so at
     * installation time by the package manager.
     */
    static {
        System.loadLibrary("hello-jni");
    }
}
