%{
/* LORNA XIAO HOMEWORK 3 PART B and C
 * texting.l - convert shorthand texts to english equivalents
 * IS - in shorthand, NIS - not in shorthand
 * WC word character, NW not word character, LS - left string ^
 */
%}

WC	[A-Za-z']
NW	[^A-Za-z']
LS	[\^!".]
%start	IS NIS

%%

{NW}	{BEGIN NIS;ECHO;}

<LS>"lol" {BEGIN IS; printf("Lots of love");}
"lol"	{BEGIN IS; printf("lots of love");}
"LOL"	{BEGIN IS; printf("lots of love");}
"rofl"	{BEGIN IS; printf("rolling on the floor laughing");}
"ROFL"	{BEGIN IS; printf("rolling on the floor laughing");}
"sry"	{BEGIN IS; printf("sorry");}
"plz"	{BEGIN IS; printf("please");}
"b4"	{BEGIN IS; printf("before");}
"m8"	{BEGIN IS; printf("mate");}
"l8"	{BEGIN IS; printf("late");}
"w8"	{BEGIN IS; printf("wait");}
"g2g"	{BEGIN IS; printf("got to go");}
"gtg"	{BEGIN IS; printf("got to go");}
"GTG"	{BEGIN IS; printf("got to go");}
"brb"	{BEGIN IS; printf("be right back");}
"BRB" 	{BEGIN IS; printf("be right back");}
"btw"	{BEGIN IS; printf("by the way");}
"BTW"	{BEGIN IS; printf("by the way");}
"fyi"	{BEGIN IS; printf("for your information");}
"FYI"	{BEGIN IS; printf("for your information");}
"ftw"	{BEGIN IS; printf("for the win");}
"FTW"	{BEGIN IS; printf("for the win");}
"gg"	{BEGIN IS; printf("good game");}
"G"	{BEGIN IS; printf("good game");}
"GL"	{BEGIN IS; printf("good luck");}
"omg"	{BEGIN IS; printf("oh my god");}
"OMG"	{BEGIN IS; printf("OH MY GOD");}

.	{BEGIN IS; ECHO;}
