PRODUCT := mahjong
CPPUTEST_HOME := cpputest
EVALUATOR = mahjong_evaluator
EVALUATOR_LIB = $(EVALUATOR)/lib/lib$(EVALUATOR).a
CPPUTEST_WARNINGFLAGS =  -Wall -Wextra -Wshadow -Wswitch-default -Wswitch-enum -Wconversion
# Disable memory leak detection for production build
CPPUTEST_USE_MEM_LEAK_DETECTION = N
#Set this to @ to keep the makefile quiet
ifndef SILENCE
	SILENCE = @
endif

#--- Inputs ----#
COMPONENT_NAME = $(PRODUCT)

CPPUTEST_USE_EXTENSIONS = Y
CPP_PLATFORM = Gcc

SRC_DIRS = \
	src/exercise\
	src/html_ui\
	src/mahjong_game

TEST_SRC_DIRS = \
	tst

INCLUDE_DIRS =\
  .\
  include\
  $(SRC_DIRS)\
  $(CPPUTEST_HOME)/include
  
PRODUCT_MAIN_OBJ = src/main.o
  
include $(CPPUTEST_HOME)/build/MakefileWorker.mk

$(CPPUTEST_LIB) :
	make -C cpputest all extensions
$(EVALUATOR_LIB) :
	make -C $(EVALUATOR)
	
.PHONY: product
product : $(PRODUCT)

$(PRODUCT): $(TARGET_LIB) $(PRODUCT_MAIN_OBJ) $(EVALUATOR_LIB)
	@echo 'Building target: $@'
	$(CXX) -o $@ -g $(PRODUCT_MAIN_OBJ) $(TARGET_LIB) $(EVALUATOR_LIB) $(TARGET_LIB) -lm -lpthread
	@echo 'Product built successfully. To run: ./$(PRODUCT)'