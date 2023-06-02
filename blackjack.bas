100 REM COPYRIGHT (C) 1987-2023 SEAN WOHLGEMUTH
110 REM ::
120 REM THIS PROGRAM IS FREE SOFTWARE: YOU CAN REDISTRIBUTE IT AND/OR MODIFY IT UNDER THE TERMS OF THE GNU GENERAL PUBLIC LICENSE
130 REM AS PUBLISHED BY THE FREE SOFTWARE FOUNDATION, EITHER VERSION 3 OF THE LICENSE, OR (AT YOUR OPTION) ANY LATER VERSION.
140 REM ::
150 REM THIS PROGRAM IS DISTRIBUTED IN THE HOPE THAT IT WILL BE USEFUL, BUT WITHOUT ANY WARRANTY; WITHOUT EVEN THE IMPLIED WARRANTY
160 REM OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. SEE THE GNU GENERAL PUBLIC LICENSE FOR MORE DETAILS.
170 REM ::
180 REM YOU SHOULD HAVE RECEIVED A COPY OF THE GNU GENERAL PUBLIC LICENSE ALONG WITH THIS PROGRAM. IF NOT, SEE
190 REM <HTTPS://WWW.GNU.ORG/LICENSES/>.
200 REM ::
210 CALL INTRO
220 CALL SETCHARS
230 CALL SETCOLORSCHEME
240 REM LABEL ***GAMELOOP***
250 CALL PLAY
260 REM LABEL ***ASKAGAIN***
270 DISPLAY AT (22,2) BEEP: "DO YOU WISH TO PLAY AGAIN?"
280 ACCEPT AT (23,14) SIZE (1) BEEP VALIDATE ("YN") : A$
290 IF A$="" THEN 270 :: REM GOTO ASKAGAIN
300 IF A$="N" THEN CALL TERMINATE
310 GOTO 250 :: REM GOTO GAMELOOP
320 END
330 REM SUBROUTINE ***INTRO***
340 SUB INTRO
350 CALL CLEAR
360 DISPLAY AT (12,10): "BLACKJACK"
370 DISPLAY AT (13,1): "presented by Sean Wohlgemuth"
380 FOR I=1 TO 500 :: NEXT I :: CALL CLEAR
390 DISPLAY AT (1, 1): "PREFACE:"
400 DISPLAY AT (3, 1): "THIS IS A GAME BETWEEN YOU"
410 DISPLAY AT (4, 1): "AND THE DEALER (COMPUTER)."
420 DISPLAY AT (6, 1): "OBJECT OF THE GAME:"
430 DISPLAY AT (8, 1): "THE OBJECT OF THE GAME IS TO"
440 DISPLAY AT (9, 1): "COLLECT A SET OF CARDS LESS"
450 DISPLAY AT (10, 1): "THAN OR EQUAL TO 21. IF YOUR"
460 DISPLAY AT (11, 1): "SET OF CARDS IS HIGHER THAN"
470 DISPLAY AT (12, 1): "THE DEALER'S AND NOT OVER 21"
480 DISPLAY AT (13, 1): "THEN YOU WIN."
490 DISPLAY AT (15, 1): "CARD VALUES:"
500 DISPLAY AT (17, 1): "NUMBER CARDS = FACE VALUE"
510 DISPLAY AT (18, 1): "FACE CARDS   = 10 PTS"
520 DISPLAY AT (19, 1): "ACES         = 11 OR 1 PT(S)"
530 DISPLAY AT (24,1): "PRESS ENTER TO CONTINUE:"
540 ACCEPT AT (24,28) BEEP VALIDATE ("") : A$
550 CALL CLEAR
560 DISPLAY AT (1, 1): "HOW TO PLAY:"
570 DISPLAY AT (3, 1): "BOTH YOU AND THE DEALER WILL"
580 DISPLAY AT (4, 1): "BE GIVEN TWO CARDS TO START."
590 DISPLAY AT (5, 1): "TAKE AS MANY CARDS AS YOU"
600 DISPLAY AT (6, 1): "WISH (UP TO 5 CARDS). IF"
610 DISPLAY AT (7, 1): "THE VALUE OF YOUR HAND"
620 DISPLAY AT (8, 1): "EXCEEDS 21 YOU BUST. ONCE"
630 DISPLAY AT (9, 1): "YOU STOP TAKING CARDS, THE"
640 DISPLAY AT (10, 1): "DEALER WILL TAKE CARDS"
650 DISPLAY AT (11, 1): "TRYING NOT TO BUST AS WELL."
660 DISPLAY AT (12, 1): "THE PLAYER WITH THE HIGHEST"
670 DISPLAY AT (13, 1): "HAND VALUE WINS."
680 DISPLAY AT (24,1): "PRESS ENTER TO BEGIN:"
690 ACCEPT AT (24,28) BEEP VALIDATE ("") : A$
700 SUBEND
710 REM SUBROUTINE ***SETCHARS***
720 SUB SETCHARS
730 CALL SETCHARSRED
740 CALL SETCHARSBLACK
750 CALL SETCHARSEDGES
760 CALL GETCARDFRONT(CARDFRONT)
770 CALL CHAR (CARDFRONT, "FFFFFFFFFFFFFFFF")
780 SUBEND
790 REM SUBROUTINE ***SETCHARSRED***
800 SUB SETCHARSRED
810 CALL GETHEART(HEART)
820 CALL CHAR (HEART, "00367F7F7F3E1C08" )
830 CALL GETDIAMOND(DIAMOND)
840 CALL CHAR (DIAMOND, "00081C3E7F3E1C08" )
850 CALL GETREDVALS(REDVALS)
860 CALL SETCHARSVALS((REDVALS))
870 CALL GETCARDBACK(CARDBACK)
880 CALL CHAR (CARDBACK, "AA55AA55AA55AA55")
890 SUBEND
900 REM SUBROUTINE ***SETCHARSBLACK***
910 SUB SETCHARSBLACK
920 CALL GETSPADE(SPADE)
930 CALL CHAR (SPADE, "0010387CFEFED638" )
940 CALL GETCLUB(CLUB)
950 CALL CHAR (CLUB, "00103854EE541038" )
960 CALL GETBLACKVALS(BLACKVALS)
970 CALL SETCHARSVALS((BLACKVALS))
980 SUBEND
990 REM SUBROUTINE ***SETCHARSVALS***
1000 SUB SETCHARSVALS(OFFSET)
1010 REM 2-10, JACK, QUEEN, KING, ACE
1020 CALL CHAR (OFFSET, "003844040830407C") :: OFFSET=OFFSET+1
1030 CALL CHAR (OFFSET, "0038040418040438") :: OFFSET=OFFSET+1
1040 CALL CHAR (OFFSET, "002424243C040404") :: OFFSET=OFFSET+1
1050 CALL CHAR (OFFSET, "003C20203C04043C") :: OFFSET=OFFSET+1
1060 CALL CHAR (OFFSET, "001C202038242418") :: OFFSET=OFFSET+1
1070 CALL CHAR (OFFSET, "003C040408081010") :: OFFSET=OFFSET+1
1080 CALL CHAR (OFFSET, "003C24243C24243C") :: OFFSET=OFFSET+1
1090 CALL CHAR (OFFSET, "001C24241C040404") :: OFFSET=OFFSET+1
1100 CALL CHAR (OFFSET, "004C52525252524C") :: OFFSET=OFFSET+1
1110 CALL CHAR (OFFSET, "003E080808084830") :: OFFSET=OFFSET+1
1120 CALL CHAR (OFFSET, "0018242424241C02") :: OFFSET=OFFSET+1
1130 CALL CHAR (OFFSET, "0024242830282424") :: OFFSET=OFFSET+1
1140 CALL CHAR (OFFSET, "001824243C242424") :: OFFSET=OFFSET+1
1150 SUBEND
1160 REM SUBROUTINE ***SETCHARSEDGES***
1170 SUB SETCHARSEDGES
1180 CALL GETCARDEDGE(CARDEDGE)
1190 CALL CHAR (CARDEDGE, "8080808080808080")
1200 CALL GETCARDTOP(CARDTOP)
1210 CALL CHAR (CARDTOP, "00000000000000FF")
1220 SUBEND
1230 REM SUBROUTINE ***SETCOLORSCHEME***
1240 SUB SETCOLORSCHEME
1250 CALL COLOR (9,7,16) :: REM DARK RED ON BLACK
1260 CALL COLOR (10,7,16) :: REM DARK RED ON BLACK
1270 CALL COLOR (11,2,16) :: REM BLACK ON WHITE
1280 CALL COLOR (12,2,16) :: REM BLACK ON WHITE
1290 CALL COLOR (13,2,1) :: REM BLACK ON TRANSPARENT
1300 CALL COLOR (14,16,16) :: REM WHITE ON WHITE
1310 CALL SCREEN (3) :: REM MED GREEN BACKGROUND
1320 SUBEND
1330 REM SUBROUTINE ***RENDERCARD***
1340 SUB RENDERCARD(PLAYER,CARD,FACEDOWN,HANDS(,,))
1350 IF FACEDOWN=1 THEN CALL GETCARDBACK(FILL) ELSE CALL GETCARDFRONT(FILL)
1360 COL=CARD*6 :: ROW=PLAYER*10
1370 REM RENDER SURFACE
1380 FOR I=1 TO 5
1390 CALL VCHAR (4+ROW, 1+COL+I, FILL, 7)
1400 NEXT I
1410 CALL GETCARDTOP(CARDTOP)
1420 CALL GETCARDEDGE(CARDEDGE)
1430 CALL HCHAR (3+ROW, 2+COL, CARDTOP, 5)
1440 CALL VCHAR (4+ROW, 7+COL, CARDEDGE, 7)
1450 IF FACEDOWN=1 THEN 1720 :: REM SUBEND
1460 REM SELECT SUIT
1470 IF HANDS(PLAYER,CARD,1)=1 THEN CALL GETHEART(SUIT)
1480 IF HANDS(PLAYER,CARD,1)=2 THEN CALL GETDIAMOND(SUIT)
1490 IF HANDS(PLAYER,CARD,1)=3 THEN CALL GETSPADE(SUIT)
1500 IF HANDS(PLAYER,CARD,1)=4 THEN CALL GETCLUB(SUIT)
1510 REM RENDER CARD VALUE
1520 IF HANDS(PLAYER,CARD,1)<3 THEN CALL GETREDVALS(CARDCHAR)
1530 IF HANDS(PLAYER,CARD,1)>2 THEN CALL GETBLACKVALS(CARDCHAR)
1540 CARDVAL=HANDS(PLAYER,CARD,0)
1550 CARDCHAR=CARDCHAR+CARDVAL-2
1560 CALL HCHAR (4+ROW, 2+COL, CARDCHAR, 1)
1570 CALL HCHAR (10+ROW, 6+COL, CARDCHAR, 1)
1580 REM RENDER CARD FACE
1590 IF CARDVAL=2 THEN CALL RENDER2(ROW,COL,SUIT) :: GOTO 1720 :: REM SUBEND
1600 IF CARDVAL=3 THEN CALL RENDER3(ROW,COL,SUIT) :: GOTO 1720 :: REM SUBEND
1610 IF CARDVAL=4 THEN CALL RENDER4(ROW,COL,SUIT) :: GOTO 1720 :: REM SUBEND
1620 IF CARDVAL=5 THEN CALL RENDER5(ROW,COL,SUIT) :: GOTO 1720 :: REM SUBEND
1630 IF CARDVAL=6 THEN CALL RENDER6(ROW,COL,SUIT) :: GOTO 1720 :: REM SUBEND
1640 IF CARDVAL=7 THEN CALL RENDER7(ROW,COL,SUIT) :: GOTO 1720 :: REM SUBEND
1650 IF CARDVAL=8 THEN CALL RENDER8(ROW,COL,SUIT) :: GOTO 1720 :: REM SUBEND
1660 IF CARDVAL=9 THEN CALL RENDER9(ROW,COL,SUIT) :: GOTO 1720 :: REM SUBEND
1670 IF CARDVAL=10 THEN CALL RENDER10(ROW,COL,SUIT) :: GOTO 1720 :: REM SUBEND
1680 IF CARDVAL=11 THEN CALL RENDERJACK(ROW,COL,SUIT) :: GOTO 1720 :: REM SUBEND
1690 IF CARDVAL=12 THEN CALL RENDERQUEEN(ROW,COL,SUIT) :: GOTO 1720 :: REM SUBEND
1700 IF CARDVAL=13 THEN CALL RENDERKING(ROW,COL,SUIT) :: GOTO 1720 :: REM SUBEND
1710 IF CARDVAL=14 THEN CALL RENDERACE(ROW,COL,SUIT) :: GOTO 1720 :: REM SUBEND
1720 SUBEND
1730 REM SUBROUTINE ***RENDER2***
1740 SUB RENDER2(ROW,COL,SUIT)
1750 CALL HCHAR (6+ROW,4+COL,SUIT,1)
1760 CALL HCHAR (8+ROW,4+COL,SUIT,1)
1770 SUBEND
1780 REM SUBROUTINE ***RENDER3***
1790 SUB RENDER3(ROW,COL,SUIT)
1800 CALL VCHAR (6+ROW,4+COL,SUIT,3)
1810 SUBEND
1820 REM SUBROUTINE ***RENDER4***
1830 SUB RENDER4(ROW,COL,SUIT)
1840 CALL HCHAR (6+ROW,3+COL,SUIT,1)
1850 CALL HCHAR (8+ROW,3+COL,SUIT,1)
1860 CALL HCHAR (6+ROW,5+COL,SUIT,1)
1870 CALL HCHAR (8+ROW,5+COL,SUIT,1)
1880 SUBEND
1890 REM SUBROUTINE ***RENDER5***
1900 SUB RENDER5(ROW,COL,SUIT)
1910 CALL RENDER4((ROW),(COL),(SUIT))
1920 CALL HCHAR (7+ROW,4+COL,SUIT,1)
1930 SUBEND
1940 REM SUBROUTINE ***RENDER6***
1950 SUB RENDER6(ROW,COL,SUIT)
1960 CALL vCHAR (6+ROW,3+COL,SUIT,3)
1970 CALL vCHAR (6+ROW,5+COL,SUIT,3)
1980 SUBEND
1990 REM SUBROUTINE ***RENDER7***
2000 SUB RENDER7(ROW,COL,SUIT)
2010 CALL RENDER6((ROW),(COL),(SUIT))
2020 CALL VCHAR (7+ROW,4+COL,SUIT,1) 
2030 SUBEND
2040 REM SUBROUTINE ***RENDER8***
2050 SUB RENDER8(ROW,COL,SUIT)
2060 CALL HCHAR (5+ROW,3+COL,SUIT,1)
2070 CALL HCHAR (5+ROW,5+COL,SUIT,1)
2080 CALL HCHAR (6+ROW,4+COL,SUIT,1)
2090 CALL HCHAR (7+ROW,3+COL,SUIT,1)
2100 CALL HCHAR (7+ROW,5+COL,SUIT,1)
2110 CALL HCHAR (8+ROW,4+COL,SUIT,1)
2120 CALL HCHAR (9+ROW,3+COL,SUIT,1)
2130 CALL HCHAR (9+ROW,5+COL,SUIT,1)
2140 SUBEND
2150 REM SUBROUTINE ***RENDER9***
2160 SUB RENDER9(ROW,COL,SUIT)
2170 CALL VCHAR (5+ROW,3+COL,SUIT,2)
2180 CALL VCHAR (5+ROW,5+COL,SUIT,2)
2190 CALL VCHAR (8+ROW,3+COL,SUIT,2)
2200 CALL VCHAR (8+ROW,5+COL,SUIT,2)
2210 CALL HCHAR (7+ROW,4+COL,SUIT,1)
2220 SUBEND
2230 REM SUBROUTINE ***RENDER10***
2240 SUB RENDER10(ROW,COL,SUIT)
2250 CALL VCHAR (5+ROW,3+COL,SUIT,5)
2260 CALL VCHAR (5+ROW,5+COL,SUIT,5)
2270 SUBEND
2280 REM SUBROUTINE ***RENDERJACK***
2290 SUB RENDERJACK(ROW,COL,SUIT)
2300 CALL VCHAR (5+ROW,5+COL,SUIT,5)
2310 CALL HCHAR (9+ROW,3+COL,SUIT,2)
2320 CALL HCHAR (8+ROW,3+COL,SUIT,1)
2330 SUBEND
2340 REM SUBROUTINE ***RENDERQUEEN***
2350 SUB RENDERQUEEN(ROW,COL,SUIT)
2360 CALL VCHAR (5+ROW,3+COL,SUIT,5)
2370 CALL VCHAR (5+ROW,5+COL,SUIT,5)
2380 CALL HCHAR (5+ROW,4+COL,SUIT,1)
2390 CALL HCHAR (9+ROW,4+COL,SUIT,1)
2400 SUBEND
2410 REM SUBROUTINE ***RENDERKING***
2420 SUB RENDERKING(ROW,COL,SUIT)
2430 CALL VCHAR (5+ROW,3+COL,SUIT,5)
2440 CALL VCHAR (5+ROW,5+COL,SUIT,2)
2450 CALL VCHAR (8+ROW,5+COL,SUIT,2)
2460 CALL VCHAR (7+ROW,4+COL,SUIT,1)
2470 SUBEND
2480 REM SUBROUTINE ***RENDERACE***
2490 SUB RENDERACE(ROW,COL,SUIT)
2500 CALL HCHAR (7+ROW,4+COL,SUIT,1)
2510 SUBEND
2520 REM SUBROUTINE ***PLAY***
2530 SUB PLAY
2540 DIM HANDS(1,4,1) :: REM HANDS[PLAYER,CARD,SUIT]
2550 DIM CARDS(1) :: REM CARDS[PLAYER]
2560 DIM SUMS(1) :: REM SUMS[PLAYER]
2570 CALL CLEARTABLE(HANDS(,,),CARDS(),SUMS())
2580 CALL SHUFFLE(HANDS(,,))
2590 PLAYER=0 :: FACEDOWN=0
2600 CALL DEAL(CARDS(),SUMS(),(PLAYER),(FACEDOWN),HANDS(,,))
2610 CALL DEAL(CARDS(),SUMS(),(PLAYER),(FACEDOWN),HANDS(,,))
2620 PLAYER=1 :: FACEDOWN=0
2630 CALL DEAL(CARDS(),SUMS(),(PLAYER),(FACEDOWN),HANDS(,,))
2640 PLAYER=1 :: FACEDOWN=1
2650 CALL DEAL(CARDS(),SUMS(),(PLAYER),(FACEDOWN),HANDS(,,))
2660 REM PLAYERS TURNS
2670 BUSTED=0
2680 FOR J=3 TO 5
2690 DISPLAY AT (22,2): "DO YOU WANT ANOTHER CARD?"
2700 REM LABEL ***ASKANOTHER***
2710 ACCEPT AT (23,14) VALIDATE ("YN") BEEP SIZE (1) : A$
2720 IF A$="" THEN 2710 :: REM GOTO ASKANOTHER
2730 DISPLAY AT (22,2): "                         " :: DISPLAY AT (23,14): " "
2740 IF A$="N" THEN 2820 :: REM GOTO REVEAL
2750 PLAYER=0 :: FACEDOWN=0
2760 CALL DEAL(CARDS(),SUMS(),(PLAYER),(FACEDOWN),HANDS(,,))
2770 IF SUMS(PLAYER)>21 THEN BUSTED=1
2780 IF BUSTED=1 THEN DISPLAY AT (12,4) BEEP: "YOU BUSTED. YOU LOSE."
2790 IF BUSTED=1 THEN 2820 :: REM GOTO REVEAL
2800 NEXT J
2810 REM LABEL ***REVEAL***
2820 PLAYER=1 :: FACEDOWN=0 :: CARD=1
2830 CALL RENDERCARD((PLAYER),(CARD),(FACEDOWN),HANDS(,,))
2840 IF BUSTED=1 THEN 2990 :: REM GOTO GAMEOVER
2850 REM DEALERS TURNS
2860 BUSTED=0
2870 FOR J=3 TO 5
2880 PLAYER=1 :: FACEDOWN=0
2890 CALL CALCSCORE(SCORE,(PLAYER),SUMS(),CARDS(),HANDS(,,))
2900 IF SCORE>=17 THEN 2970 :: REM GOTO TALLY
2910 CALL DEAL(CARDS(),SUMS(),(PLAYER),(FACEDOWN),HANDS(,,))
2920 IF SUMS(PLAYER)>21 THEN BUSTED=1
2930 IF BUSTED=1 THEN DISPLAY AT (12,3) BEEP: "DEALER BUSTED. YOU WIN."
2940 IF BUSTED=1 THEN 2990 :: REM GOTO GAMEOVER
2950 NEXT J
2960 REM LABEL ***TALLY***
2970 CALL WHOWON(SUMS(),CARDS(),HANDS(,,))
2980 REM LABEL ***GAMEOVER***
2990 SUBEND
3000 REM SUBROUTINE ***CLEARTABLE***
3010 SUB CLEARTABLE(HANDS(,,),CARDS(),SUMS())
3020 CALL CLEAR
3030 DISPLAY AT (1, 10): "BLACKJACK"
3040 FOR I=0 TO 1 :: SUMS(I)=0 :: CARDS(I)=0 :: NEXT I
3050 FOR I=0 TO 1 :: FOR J=0 TO 4 :: FOR K=0 TO 1 :: HANDS(I,J,K)=0 :: NEXT K :: NEXT J :: NEXT I
3060 SUBEND
3070 REM SUBROUTINE ***SHUFFLE***
3080 SUB SHUFFLE(HANDS(,,))
3090 RANDOMIZE
3100 DIM DECK(9) :: FOR I=0 TO 9 :: DECK(I)=0 :: NEXT I
3110 FOR H=0 TO 9
3120 REM LABEL ***DRAWLOOP***
3130 DISPLAY AT(12,6): "SHUFFLING THE DECK"
3140 X=INT(RND*4)+1
3150 X=X*16
3160 X=X+INT(RND*13)+2
3170 DUP=0
3180 CALL CHECKDUP(DUP,(X),DECK())
3190 IF DUP=1 THEN 3130 :: REM GOTO DRAWLOOP
3200 DECK(H)=X
3210 NEXT H
3220 FOR H=0 TO 4
3230 HANDS(0,H,1)=INT(DECK(H)/16)
3240 HANDS(0,H,0)=DECK(H)-HANDS(0,H,1)*16
3250 NEXT H
3260 FOR H=0 TO 4
3270 HANDS(1,H,1)=INT(DECK(H+5)/16)
3280 HANDS(1,H,0)=DECK(H+5)-HANDS(1,H,1)*16
3290 NEXT H
3300 DISPLAY AT(12,6): "                  "
3310 SUBEND
3320 REM SUBROUTINE ***CHECKDUP***
3330 SUB CHECKDUP(DUP,X,DECK())
3340 DUP=0
3350 FOR I=0 TO 9
3360 IF DECK(I)=X THEN DUP=1 :: GOTO 3380 :: REM SUBEND
3370 NEXT I
3380 SUBEND
3390 REM SUBROUTINE ***DEAL***
3400 SUB DEAL(CARDS(),SUMS(),PLAYER,FACEDOWN,HANDS(,,))
3410 CARDS(PLAYER)=CARDS(PLAYER)+1
3420 CARD=CARDS(PLAYER)-1
3430 CVAL=HANDS(PLAYER,CARD,0)
3440 IF CVAL>10 THEN IF CVAL=14 THEN CVAL=1 ELSE CVAL=10
3450 SUMS(PLAYER)=SUMS(PLAYER)+CVAL
3460 CALL RENDERCARD((PLAYER),(CARD),(FACEDOWN),HANDS(,,))
3470 SUBEND
3480 REM SUBROUTINE ***CALCSCORE***
3490 SUB CALCSCORE(SCORE,PLAYER,SUMS(),CARDS(),HANDS(,,))
3500 SCORE=SUMS(PLAYER)
3510 IF SCORE+10>21 THEN 3550 :: REM GOTO CALCSCORE.SUBEND
3520 FOR I=0 TO CARDS(PLAYER)-1
3530 IF HANDS(PLAYER,I,0)=14 THEN SCORE=SCORE+10 :: GOTO 3550 :: REM GOTO CALCSCORE.SUBEND
3540 NEXT I
3550 SUBEND
3560 REM SUBROUTINE ***WHOWON***
3570 SUB WHOWON(SUMS(),CARDS(),HANDS(,,))
3580 PLAYER=0 :: PSCORE=0
3590 CALL CALCSCORE(PSCORE,(PLAYER),SUMS(),CARDS(),HANDS(,,))
3600 REM DISPLAY AT (1,24): "P:"&STR$(PSCORE)
3610 PLAYER=1 :: DSCORE=0
3620 CALL CALCSCORE(DSCORE,(PLAYER),SUMS(),CARDS(),HANDS(,,))
3630 REM DISPLAY AT (2,24):"D:"&STR$(DSCORE)
3640 IF PSCORE=DSCORE THEN DISPLAY AT (12,11): "TIE GAME"
3650 IF PSCORE>DSCORE THEN DISPLAY AT (12,11): "YOU WIN!"
3660 IF PSCORE<DSCORE THEN DISPLAY AT (12,11): "YOU LOSE"
3670 SUBEND
3680 REM SUBROUTINE ***TERMINATE***
3690 SUB TERMINATE
3700 FOR I=1 TO 5 :: CALL CLEAR :: DISPLAY AT (12,7) BEEP: "GAME TERMINATED" :: FOR J=1 TO 100 :: NEXT J :: NEXT I
3710 FOR I=1 TO 1000 :: NEXT I 
3720 END
3730 SUBEND
3740 REM SUBROUTINE ***GETHEART***
3750 SUB GETHEART(CHARVAL)
3760 CHARVAL=96
3770 SUBEND
3780 REM SUBROUTINE ***GETDIAMOND***
3790 SUB GETDIAMOND(CHARVAL)
3800 CHARVAL=97
3810 SUBEND
3820 REM SUBROUTINE ***GETREDVALS***
3830 SUB GETREDVALS(CHARVAL)
3840 CHARVAL=98
3850 SUBEND
3860 REM SUBROUTINE ***GETCARDBACK***
3870 SUB GETCARDBACK(CHARVAL)
3880 CHARVAL=111
3890 SUBEND
3900 REM SUBROUTINE ***GETSPADE***
3910 SUB GETSPADE(CHARVAL)
3920 CHARVAL=112
3930 SUBEND
3940 REM SUBROUTINE ***GETCLUB***
3950 SUB GETCLUB(CHARVAL)
3960 CHARVAL=113
3970 SUBEND
3980 REM SUBROUTINE ***GETBLACKVALS***
3990 SUB GETBLACKVALS(CHARVAL)
4000 CHARVAL=114
4010 SUBEND
4020 REM SUBROUTINE ***GETCARDEDGE***
4030 SUB GETCARDEDGE(CHARVAL)
4040 CHARVAL=128
4050 SUBEND
4060 REM SUBROUTINE ***GETCARDTOP***
4070 SUB GETCARDTOP(CHARVAL)
4080 CHARVAL=129
4090 SUBEND
4100 REM SUBROUTINE ***GETCARDFRONT***
4110 SUB GETCARDFRONT(CHARVAL)
4120 CHARVAL=136
4130 SUBEND