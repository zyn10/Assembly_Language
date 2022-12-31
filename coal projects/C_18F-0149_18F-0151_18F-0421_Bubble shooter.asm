include Irvine32.inc
.data
print1 DB "$",0
print2 DB "-",0
print3 DB "#",0 
print4 DB 118 DUP ("_"),0
print5 DB " ",0
print6 DB " ",0
print7 DB 118 DUP (" "),0
print8 Db "You win the game.",0
print9 DB "You lose the game, try again next time.",0
print10 DB "WELCOME TO BUBBLE SHOOTER GAME",0
print11 DB "________________________________",0
print12 DB "|",0

caption db " Your Game is Start ",0
cout db "Press space buttom to fire a bullet.",0
caption1 db "Congratulations .You Win the Game ",0
cout1 db "Press any key for exit game ",0
caption2 db " You lose the game, try again next time. ",0
cout2 db "Press any key for exit game ",0

var1 DB 0h
var2 DB 0h
var3 DB 0h
var4 DB 0h
var5 DB 0h
var6 DB 0h
var7 DB 0h
var8 DB 0h
var9 DB 0h
var10 DB 0h
var11 DB 0h
var12 DB 0h
var13 DB 0h
var14 DD 0h
var15 DB 5
string1 DB "Score:",0
string2 Db "Miss:",0
score1 DB 0h
miss DB 0d
.code
main proc

mov ax,lightcyan
call settextcolor

mov dh,2h;							To print "Welcome to Bubble shooter game"
mov dl,15h;							To print "Welcome to Bubble shooter game"
call gotoxy;						To print "Welcome to Bubble shooter game"
mov edx,offset print10;				To print "Welcome to Bubble shooter game"
call writestring;					To print "Welcome to Bubble shooter game"
mov dh,3h;							To print the box 
mov dl,14h;							To print the box 
call gotoxy;						To print the box 
mov edx,offset print11;				To print the box 
call writestring;					To print the box 
mov dh,0h;							To print the box 
mov dl,14h;							To print the box 
call gotoxy ;						To print the box 
mov edx,offset print11;				To print the box 
call writestring;					To print the box 
mov dh,1h;							To print the box 
mov dl,13h;							To print the box 
call gotoxy;						To print the box 
mov edx,offset print12;				To print the box 
call writestring;					To print the box 
mov dh,2h;							To print the box 
mov dl,13h;							To print the box 
call gotoxy ;						To print the box 
mov edx,offset print12;				To print the box 
call writestring;					To print the box 
mov dh,3h;							To print the box 
mov dl,13h;							To print the box 
call gotoxy ;						To print the box 
mov edx,offset print12;				To print the box 
call writestring;					To print the box 
mov dh,1h;							To print the box 
mov dl,34h;							To print the box 
call gotoxy;						To print the box 
mov edx,offset print12;				To print the box 
call writestring;					To print the box 
mov dh,2h;							To print the box 
mov dl,34h;							To print the box 
call gotoxy;						To print the box 
mov edx,offset print12;				To print the box 
call writestring;					To print the box 
mov dh,3h;							To print the box 
mov dl,34h;							To print the box 
call gotoxy;						To print the box 
mov edx,offset print12;				To print the box 
call writestring;					To print the box 

mov dh,6h;;						To print Score 
mov dl,2Ah;						To print score
call gotoxy;					To print score
mov edx,offset string1;			To print score
call writestring;				To print score

mov dh,6h;						To Print 0 in front of score
mov dl,31h;						To Print 0 in front of score
call gotoxy;					To Print 0 in front of score
mov esi,offset score1;			To Print 0 in front of score
mov eax,00h;					To Print 0 in front of score
mov eax,[esi];					To Print 0 in front of score
call writedec;					To Print 0 in front of score

mov dh,6h;						To Print Miss
mov dl,0Ah;						To Print Miss
call gotoxy;					To Print Miss
mov edx,offset string2;			To Print Miss
call writestring;				To Print Miss

mov dh,6h;						To Print 0 in front of Miss
mov dl,11h;						To Print 0 in front of Miss
call gotoxy;					To Print 0 in front of Miss
mov esi,offset miss;			To Print 0 in front of Miss
mov eax,00h;					To Print 0 in front of Miss
mov eax,[esi];					To Print 0 in front of Miss
call writedec;					To Print 0 in front of Miss

mov dh,0Ah;						TO print upper boundary
mov var7,dh;					To compare y-axis of upper boundary
mov dl,0h;						TO print upper boundary
call gotoxy;					TO print upper boundary
mov edx,offset print4;			TO print upper boundary
call writestring;				TO print upper boundary

mov dh,23h;						To print lower boundary
mov dl,0h ;						To print lower boundary
call gotoxy;					To print lower boundary
mov edx,offset print4;			To print lower boundary
call writestring;				To print lower boundary


mov dh,10h;						To print "$" for gun
mov var1,10h;					To print "$" for gun
mov dl,0h;						To print "$" for gun
mov var2,0h;					To print "$" for gun
call gotoxy;					To print "$" for gun
mov edx,offset print1;			To print "$" for gun
call writestring;				To print "$" for gun

mov var3,10h;					Setting values for "-"
mov var4,3h;					Setting values for "-"
mov var11,10h;					To print spaces to erase "-"
mov var12,2h;					To print spaces to erase "-"

mov ebx,offset caption;        for display msg box 
mov edx,offset cout;                   //
call msgbox;                           //
mov eax,3000;                          //
call delay;                             //

start:
mov var10,0h
call hashfunction;				It generates randome value for Bubble on x-axis 
mov ecx,18h
L1:
call compare;					It simply turns the zero flag on
Je a9
Jne a10
a9:
call key;						Take the key and compare either the entered key is required key
mov bl,var10
cmp bl,1
Je a7

Jne a8
a7:
call printdash
a8:
a10:
call printhash
call printspace
mov bl,var5;				Compare y-axis of "#" with y-axis of "-"
mov al,var3;				Compare y-axis of "#" with y-axis of "-"
cmp bl,al;					Compare y-axis of "#" with y-axis of "-"
JE one;						Compare y-axis of "#" with y-axis of "-"
JNE two
one:;						Compare x-axis of "#" with x-axis of "-"
mov bl,var6;				Compare x-axis of "#" with x-axis of "-"
cmp bl,var4;				Compare x-axis of "#" with x-axis of "-"
JE equal1
JNE notequal1
equal1:
call scoreincrement
jmp out1
notequal1:
two:;						Compare y-axis of "#" with x-axis of "-"
mov eax,100h
call delay
mov bl,var5;				Moving y-axis of "#" to compare it with x-axis of "_" (Upper Boundary)
cmp bl,var7;				Moving y-axis of "#" to compare it with x-axis of "_" (Upper Boundary)
Je equal;					If x-axis of "_" (Upper Boundary) and y-axis of "#" are equal then in case of collosion
Jne notequal;				If collosion does not occur
equal:
call collosion
jmp out1
notequal:
Loop L1
out1:


mov bl,var4;			When the loop finishes the bubble and the bullet starts from their initial value
sub bl,1h
mov dl,bl
mov dh,var3
call gotoxy
mov edx,offset print5
call writestring

mov var5,21h
mov var4,3h
mov var12,2h
mov var8,22h

dec var15
mov al,var15
cmp var15,0



JE endgame
JNE start
endgame:

mov bl,score1
cmp bl,miss
jg win
jl lose
win:
mov dl,21h;						It simply displays the message "You win"
mov dh,8h;						It simply displays the message "You win"
call gotoxy;					It simply displays the message "You win"
mov edx,offset print8;			It simply displays the message "You win"
call writestring;				It simply displays the message "You win"
mov eax,3000;                          //
call delay;
mov ebx,offset caption1;        for display msg box 
mov edx,offset cout1;                   //
call msgbox;                           //
                             
jmp end1
lose:
mov dl,21h;					It simply displays the message "You Lose"
mov dh,8h;					It simply displays the message "You Lose"
call gotoxy;				It simply displays the message "You Lose"
mov edx,offset print9;		It simply displays the message "You Lose"
call writestring;			It simply displays the message "You Lose"
mov eax,3000;                          //
call delay;
mov ebx,offset caption2;        for display msg box 
mov edx,offset cout2;                   //
call msgbox;                           //
                             
end1:
exit


compare PROC
mov bl,var10
cmp bl,var10
ret
compare endp


collosion PROC
mov bl,22h;				If collosion occur it will start the loop again from y-axis of "#"
mov var5,bl;			If collosion occur it will start the loop again from y-axis of "#"
INC miss;				Increment miss if collosion occurs
mov dh,6h;				Place miss at its position
mov dl,11h;				Place miss at its position
call gotoxy;			Place miss at its position
mov esi,offset miss;	Place miss at its position
mov eax,00h;			Place miss at its position
mov eax,[esi];			Place miss at its position
call writedec;			Place miss at its position
mov dl,var9;			To eraser "#" after collosion
mov dh,0Bh;				To eraser "#" after collosion
call gotoxy;			To eraser "#" after collosion
mov edx,offset print7;	To eraser "#" after collosion
call writestring;		To eraser "#" after collosion
ret
collosion ENDP


printdash PROC
mov dh,var3;			printing y-axis "-" bullet
mov dl,var4;			printing x-axis "-" bullet
call gotoxy;			printing  "-" bullet
mov edx,offset print2;	printing  "-" bullet
call writestring ;		printing  "-" bullet
Inc var4;				printing  "-" bullet
mov dh,var11;			TO print spaces behind "-"
mov dl,var12;			TO print spaces behind "-"
call gotoxy;			TO print spaces behind "-"
mov edx,offset print6;	TO print spaces behind "-"
call writestring;		TO print spaces behind "-"
Inc var12;				TO print spaces behind "-"
ret
printdash ENDP


printhash PROC
mov dh,var5;			Y-axis for "#"
mov dl,var6;			x-axis for "#"
call gotoxy;			Printing "#"
mov edx,offset print3;	Printing "#"
call writestring ;		Printing "#"
ret
printhash ENDP


printspace PROC
mov dh,var8;			Printing spaces below "#" and it will replace their y-axis from below
mov dl,var9;			Printing spaces below "#" and it will replace their y-axis from below
call gotoxy;			Printing spaces below "#" and it will replace their y-axis from below
mov edx,offset print5;	Printing spaces below "#" and it will replace their y-axis from below
call writestring;		Printing spaces below "#" and it will replace their y-axis from below
dec var8;				Moving " " upside
Dec var5;				Moving "#" upside along y-axis
ret
printspace ENDP


key PROC
call readkey;			It simply reads the key
jz abc;					It checks either the zero flag is on or not
jnz xyz
xyz:
cmp al,20h;				It compares the ASCII value of pressed key with space key
Je a5
Jne a6
a5:
mov var10,1
a6:
abc:
ret
key ENDP


hashfunction PROC
mov var5,21h;				Setting values for y-axis for "#"
call random32;				Setting random x-axis for "#"
call randomize;				Setting random x-axis for "#"
mov eax,29h;				Setting random x-axis for "#"
call randomrange;			Setting random x-axis for "#"
add al,1
mov var6,al;				Setting random x-axis for "#"
cmp var6,0;					It simply compares the random value generated for x-axis of Bubble with zero
Je a1
Jne a2
a1:
add var6,2h;				If the random value for x-axis of Bubble is zero than add 2
a2:;						If the random value for x-axis is greater than 20
cmp var6,20h;				It compares the value of x-axis either it is greater than 20 or not
jae a3
jne a4
a3:;						If randomly x-axis is greater then 20 then subtract 5 from it
sub var6,0Ch
a4:;						
mov var8,22h;				To print spaces below "#" and spaces will replace it
mov al,var6;				To print spaces below "#" and spaces will replace it
mov var9,al;				To print spaces below "#" and spaces will replace it
ret
hashfunction  ENDP


scoreincrement PROC

mov eax,0h
inc score1 ;				Increment the score
mov dh,6h;					Compare y-axis of "#" with x-axis of "-"
mov dl,32h;					Compare y-axis of "#" with x-axis of "-"
call gotoxy;				Compare y-axis of "#" with x-axis of "-"
mov esi,offset score1;	Compare y-axis of "#" with x-axis of "-"
mov eax,[esi];	Compare y-axis of "#" with x-axis of "-"
mov score1,al
mov al,score1
mov ah,0
call writedec;				Compare y-axis of "#" with x-axis of "-"	
inc var12;					Compare y-axis of "#" with x-axis of "-"
dec var8;					Compare y-axis of "#" with x-axis of "-"
mov bl,var4;				If the score increments it simply remove the bullet at that position
sub bl,1;					If the score increments it simply remove the bullet at that position
mov dl,bl;					If the score increments it simply remove the bullet at that position
mov dh, var3;				If the score increments it simply remove the bullet at that position
call gotoxy;				If the score increments it simply remove the bullet at that position
mov edx,offset print5;		If the score increments it simply remove the bullet at that position
call writestring;			If the score increments it simply remove the bullet at that position
mov dl,var6;				If the score increments it simply removes the bubble at that position
sub dl,1h;					If the score increments it simply removes the bubble at that position
mov dh,var5;				If the score increments it simply removes the bubble at that position
call gotoxy;				If the score increments it simply removes the bubble at that position
mov edx,offset print5;		If the score increments it simply removes the bubble at that position
call writestring;			If the score increments it simply removes the bubble at that position
mov dl,var6;				If the score increments it simply removes the bubble at that position
mov dh,var5;				If the score increments it simply removes the bubble at that position
call gotoxy;				If the score increments it simply removes the bubble at that position
mov edx,offset print6;		If the score increments it simply removes the bubble at that position
call writestring;			If the score increments it simply removes the bubble at that position
mov dl,var4;				If the score increments it simply removes the bubble at that position
mov dh,var3;				If the score increments it simply removes the bubble at that position
call gotoxy;				If the score increments it simply removes the bubble at that position
mov edx,offset print6;		If the score increments it simply removes the bubble at that position
call writestring;			If the score increments it simply removes the bubble at that position
ret
scoreincrement ENDP


main endp
end main
