%{
/* LORNA XIAO HOMEWORK 3 PART A 
 *
 * chef.x - convert English on stdin to Mock Swedish on stdout
 *
 * The WC definition matches any word character, and the NW definition matches
 * any non-word character.  Two start conditions are maintained: INW (in word)
 * and NIW (not in word).  The first rule passes TeX commands without change.
 *
 * HISTORY
 *
 * Apr 26, 1993; John Hagerman: Added ! and ? to the Bork Bork Bork rule.
 *
 * Apr 15, 1992; John Hagerman: Created.
 */

//declares a static integer in C
static int i_seen = 0;
%}

	/* WC matches everything inside [] as a word character */
WC		[A-Za-z']

	/* NW matches everything except what's inside [] to be a non-word character */
NW		[^A-Za-z']

	/* start INW and NIW by calling them */
%start		INW NIW

%%
	/* Rules begin here */
	/* repeat/print everything that is not a newline */
\\[^ \n]+	ECHO;

	/* when matching a non-word char, initalize var, run NIW and print the NW char */
{NW}		{ BEGIN NIW; i_seen = 0; ECHO; }

	/* when match .!?, run NIW, initialize var and printf */
[.!?]$		{ BEGIN NIW; i_seen = 0;
		  printf("%c\nBork Bork Bork!",yytext[0]); }

	/* when "bork" or "Bork" is matched and followed with a NW, repeat/print
	 * only if NIW has started */
<NIW>"bork"/{NW} ECHO;
<NIW>"Bork"/{NW} ECHO;

	/* start INW when match the words and print what's inside printf */
"an"		{ BEGIN INW; printf("un"); }	/* replace an with un */
"An"		{ BEGIN INW; printf("Un"); }	/* replace An with Un */
"au"		{ BEGIN INW; printf("oo"); }	/* replace Au with Oo */
"Au"		{ BEGIN INW; printf("Oo"); }
	/* start INW, replace letter(s) with what's inside printf, 
	 * only if letter(s) are followed by WC (for A and a) or NW (for en) */
"a"/{WC}	{ BEGIN INW; printf("e"); }	/* replace a... with e... */
"A"/{WC}	{ BEGIN INW; printf("E"); }	/* replace A... with E... */
"en"/{NW}	{ BEGIN INW; printf("ee"); }	/* replace en... with ee... */	

	/* start INW, replace the letter(s) with what's inside printf only
	 * in start condition INW or NIW, whatever is inside <> */
<INW>"ew"	{ BEGIN INW; printf("oo"); } 	/* when INW started, make ew a INW, replace ew with oo */

	/* start INW when INW already started, replace e with e-a only if followed by NW */
<INW>"e"/{NW}	{ BEGIN INW; printf("e-a"); }
<NIW>"e"	{ BEGIN INW; printf("i"); } 	/* when NIW started, replace e with i */
<NIW>"E"	{ BEGIN INW; printf("I"); }	/* when NIW started, replace E with I */
<INW>"f"	{ BEGIN INW; printf("ff"); }	/* when INW started, replace f with ff */
<INW>"ir"	{ BEGIN INW; printf("ur"); }	/* when INW started, replace ir with ur */
	/* when INW started, start INW and printf */
<INW>"i"	{ BEGIN INW; printf(i_seen++ ? "i" : "ee"); } /* replace first occurance of i with ee if in middle word */
<INW>"ow"	{ BEGIN INW; printf("oo"); }	/* when INW started, replace ow with oo */
<NIW>"o"	{ BEGIN INW; printf("oo"); }	/* when NIW started, replace o with oo */
<NIW>"O"	{ BEGIN INW; printf("Oo"); }	/* when NIW started, replaced O with Oo */
<INW>"o"	{ BEGIN INW; printf("u"); }	/* when INW started, replace owith u */
	/* start INW, replace word with what's inside printf */
"the"		{ BEGIN INW; printf("zee"); }	/* replace the with zee */
"The"		{ BEGIN INW; printf("Zee"); }	/* replace The with Zee */
"th"/{NW}	{ BEGIN INW; printf("t"); }	/* replace th with t only if followed by NW */
	/* if INW started, replace tion with shun and start INW */
<INW>"tion"	{ BEGIN INW; printf("shun"); }
<INW>"u"	{ BEGIN INW; printf("oo"); } /* replace u with oo when INW started */
<INW>"U"	{ BEGIN INW; printf("Oo"); } /* replace U with Oo when INW started */
	/* starts INW, replaces letter with what's inside printf */
"v"		{ BEGIN INW; printf("f"); }
"V"		{ BEGIN INW; printf("F"); }	
"w"		{ BEGIN INW; printf("v"); }	
"W"		{ BEGIN INW; printf("V"); }

	/* start INW and just print back anything else */
.		{ BEGIN INW; ECHO; }

	/* There is no usercode to be copied to lex.yy.c, so the second %% is skipped */
