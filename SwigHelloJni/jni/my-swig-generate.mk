#
# Android����ϵͳ��SWIG����
#
# @author Wenyule
# 

#������MY_SWIG_PACKAGE�Ƿ��Ѿ�����
ifndef MY_SWIG_PACKAGE
	$(error MY_SWIG_PACKAGE is not defined.)
endif

#��б���滻JavaĿ¼�е�Բ��
MY_SWIG_OUTDIR:= $(NDK_PROJECT_PATH)/src/$(subst .,/,$(MY_SWIG_PACKAGE))

#SWIG��Ĭ��������C
ifndef MY_SWIG_TYPE
	MY_SWIG_TYPE	:= c
endif

#����SWIG��ģʽ
ifeq ($(MY_SWIG_TYPE),cxx)
	MY_SWIG_MODE	:=	-c++
else 
	MY_SWIG_MODE	:=
endif

#׷��SWIG��װԴ�ļ�
LOCAL_SRC_FILES+=$(foreach MY_SWIG_INTERFACE,\
	$(MY_SWIG_INTERFACES),\
	$(basename $(MY_SWIG_INTERFACE))_wrap.$(MY_SWIG_TYPE))
	
# ���.cxx ��Ϊc++ ��չ��
LOCAL_CPP_EXTENSION+= .cpp

#����SWIG��մ��루indention should be tabs for this block��
%_wrap.$(MY_SWIG_TYPE)	: %.i
	$(call host-mkdir,$(MY_SWIG_OUTDIR))
	swig -java	\
	$(MY_SWIG_MODE)	\
	-package $(MY_SWIG_PACKAGE)	\
	-outdir $(MY_SWIG_OUTDIR)	\
	$<
