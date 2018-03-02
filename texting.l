%{
/* LORNA XIAO HOMEWORK 3 PART B and C
 * texting.l - convert shorthand texts to english equivalents
 * IS - in shorthand, NIS - not in shorthand
 * WC word character, NW not word character, LS - left string ^
 */
%}

WC	[A-Za-z']
NW	[^A-Za-z']
punc	[?!."]	

%start	IS NIS 
	/*rules section begins below*/
%%

{NW}	{BEGIN NIS; ECHO;}
{punc}	{BEGIN IS; ECHO;}

"lol"		{BEGIN IS; printf("laughing out loud");}
<IS>"lol"	{BEGIN IS; printf("Laughing out loud");}
	/*"rofl"		{BEGIN IS; printf("rolling on the floor laughing");}
<IS>"rofl"	{BEGIN IS; printf("Rolling on the floor laughing");}
"sry"		{BEGIN IS; printf("sorry");}
<IS>"sry"	{BEGIN IS; printf("Sorry");}
"plz"		{BEGIN IS; printf("please");}
<IS>"plz"	{BEGIN IS; printf("Please");}
"b4"		{BEGIN IS; printf("before");}
<IS>"b4"	{BEGIN IS; printf("Before");}
"m8"		{BEGIN IS; printf("mate");}
<IS>"m8"	{BEGIN IS; printf("Mate");}
"l8"		{BEGIN IS; printf("late");}
<IS>"l8"	{BEGIN IS; printf("Late");}
"w8"		{BEGIN IS; printf("wait");}
<IS>"w8"	{BEGIN IS; printf("Wait");}
"g2g"		{BEGIN IS; printf("got to go");}
<IS>"g2g"	{BEGIN IS; printf("Got to go");}
"gtg"		{BEGIN IS; printf("got to go");}
<IS>"gtg"	{BEGIN IS; printf("Got to go");}
"brb"		{BEGIN IS; printf("be right back");}
<IS>"brb" 	{BEGIN IS; printf("Be right back");}
"btw"		{BEGIN IS; printf("by the way");}
<IS>"btw"	{BEGIN IS; printf("By the way");}
"fyi"		{BEGIN IS; printf("for your information");}
<IS>"fyi"	{BEGIN IS; printf("For your information");}
"ftw"		{BEGIN IS; printf("for the win");}
<IS>"ftw"	{BEGIN IS; printf("For the win");}
"gg"		{BEGIN IS; printf("good game");}
<IS>"gg"	{BEGIN IS; printf("Good game");}
"gl"		{BEGIN IS; printf("good luck");}
<IS>"gl"	{BEGIN IS; printf("Good luck");}
"omg"		{BEGIN IS; printf("oh my god");}
<IS>"omg"	{BEGIN IS; printf("Oh my god");}
"hbu"		{BEGIN IS; printf("how about you");}
<IS>"hbu"	{BEGIN IS; printf("How about you");}
"jk"		{BEGIN IS; printf("just kidding");}
<IS>"jk"	{BEGIN IS; printf("Just kidding");}
"op"		{BEGIN IS; printf("overpowered");}
<IS>"op"	{BEGIN IS; printf("Overpowered");}
"afk"		{BEGIN IS; printf("away from keyboard");}
<IS>"afk"	{BEGIN IS; printf("Away from keyboard");}
"ty"		{BEGIN IS; printf("thank you");}
<IS>"ty"	{BEGIN IS; printf("Thank you");}
*/
.		{BEGIN NIS; ECHO;}
