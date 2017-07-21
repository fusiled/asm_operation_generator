#ifndef
EXE_NAME=test_exec
#endfi

#put source here
SRC_DIR=src
#put header files here
INC_DIR=include

SRC_FILES=skel.asm

INC_FILES=expand_asm.h

#your compiler
CC = nasm

#your flags
NASM_FLAGS= -f bin -O0 -I./$(INC_DIR)/
ifdef N_OPS
NASM_FLAGS+= -DN_OPS=N_OPS_$(N_OPS)
endif
ifdef OPERATION
NASM_FLAGS+= -DOPERATION='$(OPERATION)'
endif

ifndef OUTPUT
OUTPUT=$(BIN_DIR)/$(EXE_NAME)
endif

#executables will be saved here
BIN_DIR=bin

INC_PATH =$(addprefix $(INC_DIR)/,$(INC_FILES) ) 
SRC_PATH =$(addprefix $(SRC_DIR)/,$(SRC_FILES) ) 

all: $(BIN_DIR)
	$(CC) $(SRC_PATH) -o $(OUTPUT) $(NASM_FLAGS)
	chmod +x $(OUTPUT)

emit:
	$(CC) $(SRC_PATH) -E $(NASM_FLAGS)

#create dirs
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

#remove all the object files
clean:
	rm -f $(BIN_DIR)/*.o

#clean and build
full: clean all
