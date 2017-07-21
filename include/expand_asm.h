;Expand the operation as specified by N_OPS define

%ifndef OPERATION
%define OPERATION  add eax,1
%endif

%define N_OPS_1 OPERATION

%macro N_OPS_2 0
	N_OPS_1
	N_OPS_1
%endmacro
%macro N_OPS_4 0
	N_OPS_2
	N_OPS_2
%endmacro
%macro N_OPS_8 0
	N_OPS_4
	N_OPS_4
%endmacro
%macro N_OPS_16 0
	N_OPS_8
	N_OPS_8
%endmacro
%macro N_OPS_32 0
	N_OPS_16
	N_OPS_16
%endmacro
%macro N_OPS_64 0
	N_OPS_32
	N_OPS_32
%endmacro
%macro N_OPS_128 0
	N_OPS_64
	N_OPS_64
%endmacro
%macro N_OPS_256 0
	N_OPS_128
	N_OPS_128
%endmacro
%macro N_OPS_512 0
	N_OPS_256
	N_OPS_256
%endmacro
%macro N_OPS_1024 0
	N_OPS_512
	N_OPS_512
%endmacro
%macro N_OPS_2048 0
	N_OPS_1024
	N_OPS_1024
%endmacro
%macro N_OPS_4096 0
	N_OPS_2048
	N_OPS_2048
%endmacro
%macro N_OPS_8138 0
	N_OPS_4096
	N_OPS_4096
%endmacro
%macro N_OPS_16276 0
	N_OPS_8138
	N_OPS_8138
%endmacro
%macro N_OPS_32552 0
	N_OPS_16276
	N_OPS_16276
%endmacro
%macro N_OPS_65104 0
	N_OPS_32552
	N_OPS_32552
%endmacro
%macro N_OPS_130208 0
	N_OPS_65104
	N_OPS_65104
%endmacro
%macro N_OPS_260416 0
	N_OPS_130208
	N_OPS_130208
%endmacro
%macro N_OPS_520832 0
	N_OPS_260416
	N_OPS_260416
%endmacro
%macro N_OPS_1041664 0
        N_OPS_520832
        N_OPS_520832
%endmacro
%macro N_OPS_1000000 0
	N_OPS_520832
	N_OPS_260416
	N_OPS_130208
	N_OPS_65104
	N_OPS_16276
	N_OPS_4096
	N_OPS_2048
	N_OPS_512
	N_OPS_256
	N_OPS_128
	N_OPS_64
	N_OPS_32
	N_OPS_16
	N_OPS_8
	N_OPS_4
%endmacro
%macro N_OPS_2000000 0
	N_OPS_1000000
	N_OPS_1000000
%endmacro
%macro N_OPS_5000000 0
	N_OPS_1000000
	N_OPS_2000000
	N_OPS_2000000
%endmacro

%ifndef N_OPS
%define N_OPS N_OPS_1
%endif

%define CODE N_OPS
