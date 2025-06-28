CPPUTEST_HOME := ../cpputest
EVALUATOR = mahjong_evaluator
CPPUTEST_WARNINGFLAGS =  -Wall -Wextra -Wshadow -Wswitch-default -Wswitch-enum -Wconversion
# Disable memory leak detection for production build
CPPUTEST_USE_MEM_LEAK_DETECTION = N
#Set this to @ to keep the makefile quiet
ifndef SILENCE
	SILENCE = @
endif

#--- Inputs ----#
COMPONENT_NAME = $(EVALUATOR)

CPPUTEST_USE_EXTENSIONS = Y
CPP_PLATFORM = Gcc

SRC_DIRS = \
	src
TEST_SRC_DIRS = \
	tst

INCLUDE_DIRS =\
  .\
  include\
  ../include\
  $(SRC_DIRS)\
  $(CPPUTEST_HOME)/include
  
include $(CPPUTEST_HOME)/build/MakefileWorker.mk

