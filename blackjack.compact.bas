100 REM  COPYRIGHT (C) 1987-2023 SEAN WOHLGEMUTH
110 CALL INTRO
120 CALL SETCHARS
130 CALL SETCOLORSCHEME
140 CALL PLAY
150 DISPLAY AT(22,2)BEEP:"DO YOU WISH TO PLAY AGAIN?"
160 ACCEPT AT(23,14)SIZE(1)BEEPVALIDATE("YN"):A$
170 IF A$="" THEN 150
180 IF A$="N" THEN CALL TERMINATE
190 GOTO 140
200 END
210 SUB INTRO
220 CALL CLEAR
230 DISPLAY AT(12,10):"BLACKJACK"
240 DISPLAY AT(13,1):"presented by Sean Wohlgemuth"
250 FOR I=1 TO 500 :: NEXT I :: CALL CLEAR
260 DISPLAY AT(1,1):"PREFACE:"
270 DISPLAY AT(3,1):"THIS IS A GAME BETWEEN YOU"
280 DISPLAY AT(4,1):"AND THE DEALER (COMPUTER)."
290 DISPLAY AT(6,1):"OBJECT OF THE GAME:"
300 DISPLAY AT(8,1):"THE OBJECT OF THE GAME IS TO"
310 DISPLAY AT(9,1):"COLLECT A SET OF CARDS LESS"
320 DISPLAY AT(10,1):"THAN OR EQUAL TO 21. IF YOUR"
330 DISPLAY AT(11,1):"SET OF CARDS IS HIGHER THAN"
340 DISPLAY AT(12,1):"THE DEALER'S AND NOT OVER 21"
350 DISPLAY AT(13,1):"THEN YOU WIN."
360 DISPLAY AT(15,1):"CARD VALUES:"
370 DISPLAY AT(17,1):"NUMBER CARDS = FACE VALUE"
380 DISPLAY AT(18,1):"FACE CARDS   = 10 PTS"
390 DISPLAY AT(19,1):"ACES         = 11 OR 1 PT(S)"
400 DISPLAY AT(24,1):"PRESS ENTER TO CONTINUE:"
410 ACCEPT AT(24,28)BEEPVALIDATE(""):A$
420 CALL CLEAR
430 DISPLAY AT(1,1):"HOW TO PLAY:"
440 DISPLAY AT(3,1):"BOTH YOU AND THE DEALER WILL"
450 DISPLAY AT(4,1):"BE GIVEN TWO CARDS TO START."
460 DISPLAY AT(5,1):"TAKE AS MANY CARDS AS YOU"
470 DISPLAY AT(6,1):"WISH (UP TO 5 CARDS). IF"
480 DISPLAY AT(7,1):"THE VALUE OF YOUR HAND"
490 DISPLAY AT(8,1):"EXCEEDS 21 YOU BUST. ONCE"
500 DISPLAY AT(9,1):"YOU STOP TAKING CARDS, THE"
510 DISPLAY AT(10,1):"DEALER WILL TAKE CARDS"
520 DISPLAY AT(11,1):"TRYING NOT TO BUST AS WELL."
530 DISPLAY AT(12,1):"THE PLAYER WITH THE HIGHEST"
540 DISPLAY AT(13,1):"HAND VALUE WINS."
550 DISPLAY AT(24,1):"PRESS ENTER TO BEGIN:"
560 ACCEPT AT(24,28)BEEPVALIDATE(""):A$
570 SUBEND
580 SUB SETCHARS
590 CALL SETCHARSRED
600 CALL SETCHARSBLACK
610 CALL SETCHARSEDGES
620 CALL GETCARDFRONT(CARDFRONT)
630 CALL CHAR(CARDFRONT,"FFFFFFFFFFFFFFFF")
640 SUBEND
650 SUB SETCHARSRED
660 CALL GETHEART(HEART)
670 CALL CHAR(HEART,"00367F7F7F3E1C08")
680 CALL GETDIAMOND(DIAMOND)
690 CALL CHAR(DIAMOND,"00081C3E7F3E1C08")
700 CALL GETREDVALS(REDVALS)
710 CALL SETCHARSVALS((REDVALS))
720 CALL GETCARDBACK(CARDBACK)
730 CALL CHAR(CARDBACK,"AA55AA55AA55AA55")
740 SUBEND
750 SUB SETCHARSBLACK
760 CALL GETSPADE(SPADE)
770 CALL CHAR(SPADE,"0010387CFEFED638")
780 CALL GETCLUB(CLUB)
790 CALL CHAR(CLUB,"00103854EE541038")
800 CALL GETBLACKVALS(BLACKVALS)
810 CALL SETCHARSVALS((BLACKVALS))
820 SUBEND
830 SUB SETCHARSVALS(OFFSET)
840 CALL CHAR(OFFSET,"003844040830407C") :: OFFSET=OFFSET+1
850 CALL CHAR(OFFSET,"0038040418040438") :: OFFSET=OFFSET+1
860 CALL CHAR(OFFSET,"002424243C040404") :: OFFSET=OFFSET+1
870 CALL CHAR(OFFSET,"003C20203C04043C") :: OFFSET=OFFSET+1
880 CALL CHAR(OFFSET,"001C202038242418") :: OFFSET=OFFSET+1
890 CALL CHAR(OFFSET,"003C040408081010") :: OFFSET=OFFSET+1
900 CALL CHAR(OFFSET,"003C24243C24243C") :: OFFSET=OFFSET+1
910 CALL CHAR(OFFSET,"001C24241C040404") :: OFFSET=OFFSET+1
920 CALL CHAR(OFFSET,"004C52525252524C") :: OFFSET=OFFSET+1
930 CALL CHAR(OFFSET,"003E080808084830") :: OFFSET=OFFSET+1
940 CALL CHAR(OFFSET,"0018242424241C02") :: OFFSET=OFFSET+1
950 CALL CHAR(OFFSET,"0024242830282424") :: OFFSET=OFFSET+1
960 CALL CHAR(OFFSET,"001824243C242424") :: OFFSET=OFFSET+1
970 SUBEND
980 SUB SETCHARSEDGES
990 CALL GETCARDEDGE(CARDEDGE)
1000 CALL CHAR(CARDEDGE,"8080808080808080")
1010 CALL GETCARDTOP(CARDTOP)
1020 CALL CHAR(CARDTOP,"00000000000000FF")
1030 SUBEND
1040 SUB SETCOLORSCHEME
1050 CALL COLOR(9,7,16)
1060 CALL COLOR(10,7,16)
1070 CALL COLOR(11,2,16)
1080 CALL COLOR(12,2,16)
1090 CALL COLOR(13,2,1)
1100 CALL COLOR(14,16,16)
1110 CALL SCREEN(3)
1120 SUBEND
1130 SUB RENDERCARD(PLAYER,CARD,FACEDOWN,HANDS(,,))
1140 IF FACEDOWN=1 THEN CALL GETCARDBACK(FILL)ELSE CALL GETCARDFRONT(FILL)
1150 COL=CARD*6 :: ROW=PLAYER*10
1160 FOR I=1 TO 5
1170 CALL VCHAR(4+ROW,1+COL+I,FILL,7)
1180 NEXT I
1190 CALL GETCARDTOP(CARDTOP)
1200 CALL GETCARDEDGE(CARDEDGE)
1210 CALL HCHAR(3+ROW,2+COL,CARDTOP,5)
1220 CALL VCHAR(4+ROW,7+COL,CARDEDGE,7)
1230 IF FACEDOWN=1 THEN 1470
1240 IF HANDS(PLAYER,CARD,1)=1 THEN CALL GETHEART(SUIT)
1250 IF HANDS(PLAYER,CARD,1)=2 THEN CALL GETDIAMOND(SUIT)
1260 IF HANDS(PLAYER,CARD,1)=3 THEN CALL GETSPADE(SUIT)
1270 IF HANDS(PLAYER,CARD,1)=4 THEN CALL GETCLUB(SUIT)
1280 IF HANDS(PLAYER,CARD,1)<3 THEN CALL GETREDVALS(CARDCHAR)
1290 IF HANDS(PLAYER,CARD,1)>2 THEN CALL GETBLACKVALS(CARDCHAR)
1300 CARDVAL=HANDS(PLAYER,CARD,0)
1310 CARDCHAR=CARDCHAR+CARDVAL-2
1320 CALL HCHAR(4+ROW,2+COL,CARDCHAR,1)
1330 CALL HCHAR(10+ROW,6+COL,CARDCHAR,1)
1340 IF CARDVAL=2 THEN CALL RENDER2(ROW,COL,SUIT) :: GOTO 1470
1350 IF CARDVAL=3 THEN CALL RENDER3(ROW,COL,SUIT) :: GOTO 1470
1360 IF CARDVAL=4 THEN CALL RENDER4(ROW,COL,SUIT) :: GOTO 1470
1370 IF CARDVAL=5 THEN CALL RENDER5(ROW,COL,SUIT) :: GOTO 1470
1380 IF CARDVAL=6 THEN CALL RENDER6(ROW,COL,SUIT) :: GOTO 1470
1390 IF CARDVAL=7 THEN CALL RENDER7(ROW,COL,SUIT) :: GOTO 1470
1400 IF CARDVAL=8 THEN CALL RENDER8(ROW,COL,SUIT) :: GOTO 1470
1410 IF CARDVAL=9 THEN CALL RENDER9(ROW,COL,SUIT) :: GOTO 1470
1420 IF CARDVAL=10 THEN CALL RENDER10(ROW,COL,SUIT) :: GOTO 1470
1430 IF CARDVAL=11 THEN CALL RENDERJACK(ROW,COL,SUIT) :: GOTO 1470
1440 IF CARDVAL=12 THEN CALL RENDERQUEEN(ROW,COL,SUIT) :: GOTO 1470
1450 IF CARDVAL=13 THEN CALL RENDERKING(ROW,COL,SUIT) :: GOTO 1470
1460 IF CARDVAL=14 THEN CALL RENDERACE(ROW,COL,SUIT) :: GOTO 1470
1470 SUBEND
1480 SUB RENDER2(ROW,COL,SUIT)
1490 CALL HCHAR(6+ROW,4+COL,SUIT,1)
1500 CALL HCHAR(8+ROW,4+COL,SUIT,1)
1510 SUBEND
1520 SUB RENDER3(ROW,COL,SUIT)
1530 CALL VCHAR(6+ROW,4+COL,SUIT,3)
1540 SUBEND
1550 SUB RENDER4(ROW,COL,SUIT)
1560 CALL HCHAR(6+ROW,3+COL,SUIT,1)
1570 CALL HCHAR(8+ROW,3+COL,SUIT,1)
1580 CALL HCHAR(6+ROW,5+COL,SUIT,1)
1590 CALL HCHAR(8+ROW,5+COL,SUIT,1)
1600 SUBEND
1610 SUB RENDER5(ROW,COL,SUIT)
1620 CALL RENDER4((ROW),(COL),(SUIT))
1630 CALL HCHAR(7+ROW,4+COL,SUIT,1)
1640 SUBEND
1650 SUB RENDER6(ROW,COL,SUIT)
1660 CALL VCHAR(6+ROW,3+COL,SUIT,3)
1670 CALL VCHAR(6+ROW,5+COL,SUIT,3)
1680 SUBEND
1690 SUB RENDER7(ROW,COL,SUIT)
1700 CALL RENDER6((ROW),(COL),(SUIT))
1710 CALL VCHAR(7+ROW,4+COL,SUIT,1)
1720 SUBEND
1730 SUB RENDER8(ROW,COL,SUIT)
1740 CALL HCHAR(5+ROW,3+COL,SUIT,1)
1750 CALL HCHAR(5+ROW,5+COL,SUIT,1)
1760 CALL HCHAR(6+ROW,4+COL,SUIT,1)
1770 CALL HCHAR(7+ROW,3+COL,SUIT,1)
1780 CALL HCHAR(7+ROW,5+COL,SUIT,1)
1790 CALL HCHAR(8+ROW,4+COL,SUIT,1)
1800 CALL HCHAR(9+ROW,3+COL,SUIT,1)
1810 CALL HCHAR(9+ROW,5+COL,SUIT,1)
1820 SUBEND
1830 SUB RENDER9(ROW,COL,SUIT)
1840 CALL VCHAR(5+ROW,3+COL,SUIT,2)
1850 CALL VCHAR(5+ROW,5+COL,SUIT,2)
1860 CALL VCHAR(8+ROW,3+COL,SUIT,2)
1870 CALL VCHAR(8+ROW,5+COL,SUIT,2)
1880 CALL HCHAR(7+ROW,4+COL,SUIT,1)
1890 SUBEND
1900 SUB RENDER10(ROW,COL,SUIT)
1910 CALL VCHAR(5+ROW,3+COL,SUIT,5)
1920 CALL VCHAR(5+ROW,5+COL,SUIT,5)
1930 SUBEND
1940 SUB RENDERJACK(ROW,COL,SUIT)
1950 CALL VCHAR(5+ROW,5+COL,SUIT,5)
1960 CALL HCHAR(9+ROW,3+COL,SUIT,2)
1970 CALL HCHAR(8+ROW,3+COL,SUIT,1)
1980 SUBEND
1990 SUB RENDERQUEEN(ROW,COL,SUIT)
2000 CALL VCHAR(5+ROW,3+COL,SUIT,5)
2010 CALL VCHAR(5+ROW,5+COL,SUIT,5)
2020 CALL HCHAR(5+ROW,4+COL,SUIT,1)
2030 CALL HCHAR(9+ROW,4+COL,SUIT,1)
2040 SUBEND
2050 SUB RENDERKING(ROW,COL,SUIT)
2060 CALL VCHAR(5+ROW,3+COL,SUIT,5)
2070 CALL VCHAR(5+ROW,5+COL,SUIT,2)
2080 CALL VCHAR(8+ROW,5+COL,SUIT,2)
2090 CALL VCHAR(7+ROW,4+COL,SUIT,1)
2100 SUBEND
2110 SUB RENDERACE(ROW,COL,SUIT)
2120 CALL HCHAR(7+ROW,4+COL,SUIT,1)
2130 SUBEND
2140 SUB PLAY
2150 DIM HANDS(1,4,1)
2160 DIM CARDS(1)
2170 DIM SUMS(1)
2180 CALL CLEARTABLE(HANDS(,,),CARDS(),SUMS())
2190 CALL SHUFFLE(HANDS(,,))
2200 PLAYER=0 :: FACEDOWN=0
2210 CALL DEAL(CARDS(),SUMS(),(PLAYER),(FACEDOWN),HANDS(,,))
2220 CALL DEAL(CARDS(),SUMS(),(PLAYER),(FACEDOWN),HANDS(,,))
2230 PLAYER=1 :: FACEDOWN=0
2240 CALL DEAL(CARDS(),SUMS(),(PLAYER),(FACEDOWN),HANDS(,,))
2250 PLAYER=1 :: FACEDOWN=1
2260 CALL DEAL(CARDS(),SUMS(),(PLAYER),(FACEDOWN),HANDS(,,))
2270 BUSTED=0
2280 FOR J=3 TO 5
2290 DISPLAY AT(22,2):"DO YOU WANT ANOTHER CARD?"
2300 ACCEPT AT(23,14)VALIDATE("YN")BEEPSIZE(1):A$
2310 IF A$="" THEN 2300
2320 DISPLAY AT(22,2):"                         " :: DISPLAY AT(23,14):" "
2330 IF A$="N" THEN 2400
2340 PLAYER=0 :: FACEDOWN=0
2350 CALL DEAL(CARDS(),SUMS(),(PLAYER),(FACEDOWN),HANDS(,,))
2360 IF SUMS(PLAYER)>21 THEN BUSTED=1
2370 IF BUSTED=1 THEN DISPLAY AT(12,4)BEEP:"YOU BUSTED. YOU LOSE."
2380 IF BUSTED=1 THEN 2400
2390 NEXT J
2400 PLAYER=1 :: FACEDOWN=0 :: CARD=1
2410 CALL RENDERCARD((PLAYER),(CARD),(FACEDOWN),HANDS(,,))
2420 IF BUSTED=1 THEN 2540
2430 BUSTED=0
2440 FOR J=3 TO 5
2450 PLAYER=1 :: FACEDOWN=0
2460 CALL CALCSCORE(SCORE,(PLAYER),SUMS(),CARDS(),HANDS(,,))
2470 IF SCORE>=17 THEN 2530
2480 CALL DEAL(CARDS(),SUMS(),(PLAYER),(FACEDOWN),HANDS(,,))
2490 IF SUMS(PLAYER)>21 THEN BUSTED=1
2500 IF BUSTED=1 THEN DISPLAY AT(12,3)BEEP:"DEALER BUSTED. YOU WIN."
2510 IF BUSTED=1 THEN 2540
2520 NEXT J
2530 CALL WHOWON(SUMS(),CARDS(),HANDS(,,))
2540 SUBEND
2550 SUB CLEARTABLE(HANDS(,,),CARDS(),SUMS())
2560 CALL CLEAR
2570 DISPLAY AT(1,10):"BLACKJACK"
2580 FOR I=0 TO 1 :: SUMS(I)=0 :: CARDS(I)=0 :: NEXT I
2590 FOR I=0 TO 1 :: FOR J=0 TO 4 :: FOR K=0 TO 1 :: HANDS(I,J,K)=0 :: NEXT K :: NEXT J :: NEXT I
2600 SUBEND
2610 SUB SHUFFLE(HANDS(,,))
2620 RANDOMIZE
2630 DIM DECK(9) :: FOR I=0 TO 9 :: DECK(I)=0 :: NEXT I
2640 FOR H=0 TO 9
2650 DISPLAY AT(12,6):"SHUFFLING THE DECK"
2660 X=INT(RND*4)+1
2670 X=X*16
2680 X=X+INT(RND*13)+2
2690 DUP=0
2700 CALL CHECKDUP(DUP,(X),DECK())
2710 IF DUP=1 THEN 2650
2720 DECK(H)=X
2730 NEXT H
2740 FOR H=0 TO 4
2750 HANDS(0,H,1)=INT(DECK(H)/16)
2760 HANDS(0,H,0)=DECK(H)-HANDS(0,H,1)*16
2770 NEXT H
2780 FOR H=0 TO 4
2790 HANDS(1,H,1)=INT(DECK(H+5)/16)
2800 HANDS(1,H,0)=DECK(H+5)-HANDS(1,H,1)*16
2810 NEXT H
2820 DISPLAY AT(12,6):"                  "
2830 SUBEND
2840 SUB CHECKDUP(DUP,X,DECK())
2850 DUP=0
2860 FOR I=0 TO 9
2870 IF DECK(I)=X THEN DUP=1 :: GOTO 2890
2880 NEXT I
2890 SUBEND
2900 SUB DEAL(CARDS(),SUMS(),PLAYER,FACEDOWN,HANDS(,,))
2910 CARDS(PLAYER)=CARDS(PLAYER)+1
2920 CARD=CARDS(PLAYER)-1
2930 CVAL=HANDS(PLAYER,CARD,0)
2940 IF CVAL>10 THEN IF CVAL=14 THEN CVAL=1 ELSE CVAL=10
2950 SUMS(PLAYER)=SUMS(PLAYER)+CVAL
2960 CALL RENDERCARD((PLAYER),(CARD),(FACEDOWN),HANDS(,,))
2970 SUBEND
2980 SUB CALCSCORE(SCORE,PLAYER,SUMS(),CARDS(),HANDS(,,))
2990 SCORE=SUMS(PLAYER)
3000 IF SCORE+10>21 THEN 3040
3010 FOR I=0 TO CARDS(PLAYER)-1
3020 IF HANDS(PLAYER,I,0)=14 THEN SCORE=SCORE+10 :: GOTO 3040
3030 NEXT I
3040 SUBEND
3050 SUB WHOWON(SUMS(),CARDS(),HANDS(,,))
3060 PLAYER=0 :: PSCORE=0
3070 CALL CALCSCORE(PSCORE,(PLAYER),SUMS(),CARDS(),HANDS(,,))
3080 PLAYER=1 :: DSCORE=0
3090 CALL CALCSCORE(DSCORE,(PLAYER),SUMS(),CARDS(),HANDS(,,))
3100 IF PSCORE=DSCORE THEN DISPLAY AT(12,11):"TIE GAME"
3110 IF PSCORE>DSCORE THEN DISPLAY AT(12,11):"YOU WIN!"
3120 IF PSCORE<DSCORE THEN DISPLAY AT(12,11):"YOU LOSE"
3130 SUBEND
3140 SUB TERMINATE
3150 FOR I=1 TO 5 :: CALL CLEAR :: DISPLAY AT(12,7)BEEP:"GAME TERMINATED" :: FOR J=1 TO 100 :: NEXT J :: NEXT I
3160 FOR I=1 TO 1000 :: NEXT I
3170 END
3180 SUBEND
3190 SUB GETHEART(CHARVAL)
3200 CHARVAL=96
3210 SUBEND
3220 SUB GETDIAMOND(CHARVAL)
3230 CHARVAL=97
3240 SUBEND
3250 SUB GETREDVALS(CHARVAL)
3260 CHARVAL=98
3270 SUBEND
3280 SUB GETCARDBACK(CHARVAL)
3290 CHARVAL=111
3300 SUBEND
3310 SUB GETSPADE(CHARVAL)
3320 CHARVAL=112
3330 SUBEND
3340 SUB GETCLUB(CHARVAL)
3350 CHARVAL=113
3360 SUBEND
3370 SUB GETBLACKVALS(CHARVAL)
3380 CHARVAL=114
3390 SUBEND
3400 SUB GETCARDEDGE(CHARVAL)
3410 CHARVAL=128
3420 SUBEND
3430 SUB GETCARDTOP(CHARVAL)
3440 CHARVAL=129
3450 SUBEND
3460 SUB GETCARDFRONT(CHARVAL)
3470 CHARVAL=136
3480 SUBEND