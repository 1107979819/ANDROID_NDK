LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE	:=data-type

LOCAL_SRC_FILES	:=data-type.c

include $(BUILD_SHARED_LIBRARY)