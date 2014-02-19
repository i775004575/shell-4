#                         (C) 2014 HuangJinDong                        # 
########################################################################

CC=gcc
CFLAGS += -Wall
CFLAGS += -I$(INCLUDE) 
CFLAGS += -std=gnu99
#CFLAGS += -O3 # release

SRC=./src
OBJ=./obj
INCLUDE=./include

install:$(OBJ)/main.o $(OBJ)/scan.o $(OBJ)/build_in.o
	$(CC) $(CFLAGS) $^ -o ddsh

$(OBJ)/scan.o:$(SRC)/scan.c $(INCLUDE)/scan.h
	$(CC) $(CFLAGS) -c $< -o $@ 

$(OBJ)/main.o:$(SRC)/main.c $(INCLUDE)/globals.h
	$(CC) $(CFLAGS) -c $< -o $@ 

$(OBJ)/build_in.o:$(SRC)/build_in.c $(INCLUDE)/build_in.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ)/* 
	rm -f ddsh 
