LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE	:=CallJavaMethod

LOCAL_SRC_FILES	:=CallJavaMethod.c

include $(BUILD_SHARED_LIBRARY)