# asm Operation Generator
Generate a sequence of assembly operations with a small overhead using the nasm preprocessor.

##The number of instruction that can be generated is fixed
At the moment, the number of instruction that you can generate is fixed in macro defintion. You can generate only for the following number of instructions:
 * 2^N where N is in the inclusive range of \[0,20\]
 * 1000000, 2000000, 5000000 (1,2 and 5 million)
Note that you can easily change `include/expand_asm.h` to suit your needs.

## Requirements
 * [nasm](http://www.nasm.us/)
 * [makefile](https://en.wikipedia.org/wiki/Make_(software))

## Usage
 `make` compiles the executable in the `bin` folder. You can define the 
number of operations that you want to generate with the option 
`N_OPS=<number>`. You can also define the operation that you want to 
generate `<number>` times with the option `OPERATION="<my_operation>"`.
The default behavior (just `make`) is to generate one `add eax,1` instruction

## An Example

 `make N_OPS=4 OPERATION="imul eax,5"` generates a program with 4 `imul eax,5` instructions. You can inspect the code that you want to generate with `make emit`. Considering this example,
 `make emit N_OPS=4 OPERATION="imul eax,5"` produces to the STDOUT:

```
;initialization code
_start:
 mov eax, 1
 imul eax,5
%line 43+0 src/skel.asm
 imul eax,5
 imul eax,5
 imul eax,5
%line 44+1 src/skel.asm
 mov eax,1
 int 0x80 
```
## TODOs

Add a support program that can generate *any* number of instructions. 


