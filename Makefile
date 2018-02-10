all:
	flex texting.l
	gcc -o text lex.yy.c -lfl
	./text
