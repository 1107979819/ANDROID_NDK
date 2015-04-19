#
# Android构建系统的SWIG扩建
#
# @author Wenyule
# 

#检查变量MY_SWIG_PACKAGE是否已经定义
ifndef MY_SWIG_PACKAGE
	$(error MY_SWIG_PACKAGE is not defined.)
endif

#用斜线替换Java目录中的圆点
MY_SWIG_OUTDIR:= $(NDK_PROJECT_PATH)/src/$(subst .,/,$(MY_SWIG_PACKAGE))

#SWIG的默认类型是C
ifndef MY_SWIG_TYPE
	MY_SWIG_TYPE	:= c
endif

#设置SWIG的模式
ifeq ($(MY_SWIG_TYPE),cxx)
	MY_SWIG_MODE	:=	-c++
else 
	MY_SWIG_MODE	:=
endif

#追加SWIG封装源文件
LOCAL_SRC_FILES+=$(foreach MY_SWIG_INTERFACE,\
	$(MY_SWIG_INTERFACES),\
	$(basename $(MY_SWIG_INTERFACE))_wrap.$(MY_SWIG_TYPE))
	
# 添加.cxx 作为c++ 扩展名
LOCAL_CPP_EXTENSION+= .cpp

#生成SWIG封闭代码（indention should be tabs for this block）
%_wrap.$(MY_SWIG_TYPE)	: %.i
	$(call host-mkdir,$(MY_SWIG_OUTDIR))
	swig -java	\
	$(MY_SWIG_MODE)	\
	-package $(MY_SWIG_PACKAGE)	\
	-outdir $(MY_SWIG_OUTDIR)	\
	$<
