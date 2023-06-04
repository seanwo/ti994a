#!/bin/bash

# Remove all comments
echo "100 REM COPYRIGHT (C) 1987-2023 SEAN WOHLGEMUTH" >battleship.compact.bas
sed 's/^[0-9]* REM .*//g' battleship.bas | sed '/^$/d' | sed 's/ [:]* REM .*//g' >>tmp0.bas

# Remove calls to these subroutines
sed 's/^[0-9]* CALL GETHOLECHAR(HOLECHAR)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETFILLCHAR(FILLCHAR)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETHITCHAR(HITCHAR)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETSHIPCHAR(SHIPCHAR)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETTENCHAR(TENCHAR)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETMISSCHAR(MISSCHAR)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETSUNKCHAR(SUNKCHAR)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETNUMSHIPS(NUMSHIPS)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL QUEUESIZE(QSIZE)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas

#Remove call to these subroutine with inline statements
sed 's/CALL GETBOARDORIG(ROW,COL)/ROW=5::COL=3/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL GETAUXORIG(ROW,COL)/ROW=3::COL=23/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL GETMENUORIG(ROW,COL)/ROW=14::COL=23/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL GETMENUORIG(MROW,MCOL)/MROW=14::MCOL=23/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL GETHITCHAR(CHARVAL)/CHARVAL=104/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL GETMISSCHAR(CHARVAL)/CHARVAL=128/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas

#remove these subroutines completely
sed '/SUB GETHOLECHAR/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETFILLCHAR/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETHITCHAR/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETSHIPCHAR/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETTENCHAR/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETMISSCHAR/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETSUNKCHAR/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETNUMSHIPS/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB QUEUESIZE/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETBOARDORIG/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETAUXORIG/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETMENUORIG/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas

# Replace these variable with constants
sed 's/HOLECHAR/96/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/FILLCHAR/97/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/HITCHAR/104/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SHIPCHAR/112/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/TENCHAR/120/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/MISSCHAR/128/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUNKCHAR/136/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/NUMSHIPS/5/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/QSIZE/11/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas

# Reduce subroutine names to 3 letters
sed 's/CHECKHIT/CHI/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CHECKHORIZONTAL/CHO/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CHECKOVERLAP/COV/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CHECKSEQUENTIAL/CSE/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CHECKVALIDSHIP/CVI/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CHECKVALIDSHOT/CVO/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/COMPUTERTURN/CTU/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/DELOYPLAYER/DPL/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/DEPLOYAUTO/DAU/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/DEPLOYCOMPUTER/DCO/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/DEPLOYMANUAL/DMA/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/DEPLOYSHIPS/DSH/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/GAMEAI/GAI/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/GETAUTOPLAY/GAP/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/GETDEBUGFLAG/GDF/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/GETSHIPLEN/GSL/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/GETSHIPNAME/GSN/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/INPUTPOS/IPO/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/INPUTSHIP/ISH/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/INPUTTARGET/ITA/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/MENUAUTODEPLOY/MAD/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/MENUCLEAR/MCL/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/MENUDEPLOYING/MDG/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/MENUDEPLOY/MDE/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/MENUGAMEOVER/MGO/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/MENUTARGET/MTA/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/PLAYERTURN/PTU/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/PLAYGAME/PGA/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/PROCESSSHOT/PSH/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/QUEUEADD/QAD/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/QUEUEDEL/QDE/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/QUEUEINIT/QIN/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/RENDERAUX/RAU/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/RENDERAXES/RAX/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/RENDERBACKBOARD/RBB/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/RENDERBOARDS/RBS/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/RENDERBOARD/RBO/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/RENDERHOLES/RHO/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/RENDERSHIPSAUX/RSA/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/RENDERSHIP/RSI/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/RENDERSHOT/RSO/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/RENDERSUNK/RSU/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/RENDERTEXT/TXT/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SETCHARS/SCH/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SETCOLORSCHEME/SCS/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas

#reduce string variables to 1 letter + $
sed 's/AUTODEPLOY\$/A\$/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/INPUTROW\$/IR\$/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/PLAYAGAIN\$/P\$/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SHIPNAMES\$/N\$/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SHIPNAME\$/S\$/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/TEXT\$/T\$/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/TARGETROW\$/AR\$/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas

#reduce number variables to 1-2 letter
sed 's/ACTSUM/AS/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/AUTOPLAY/A/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CHARVAL/CV/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/COFFSET/CO/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/ROFFSET/RO/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/OFFSET/O/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SCOL/SC/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CURRENTSHIPLEN/CL/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CURRENTSHIP/CS/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CURR/CU/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/DEBUG/D/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/DINDEX/DI/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/INDEX/X/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CDIR/CD/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/RDIR/RD/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/DIR/DR/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/ERRVAL/E/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/EXPSUM/ES/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/HITSLEFT/HL/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/\"HIT/\"XXXXXX/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/HIT/H/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/XXXXXX/HIT/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/HORIZONTAL/HZ/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/INPUTCOL/IC/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/TARGETCOL/AC/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUNKLOC/SU/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/STOREDLOC/SD/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/\"LOC/\"XXXXXX/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/LOC/L/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/XXXXXX/LOC/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/MCOL/MC/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/MINCOORD/ML/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/MROW/MR/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/NOISE/N/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/OLDQLEN/OL/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/QLEN/QL/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/\"PLAYER/\"XXXXXX/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/PLAYER/P/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/XXXXXX/PLAYER/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/PREV/PV/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/REVERSED/RV/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/ROW/R/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SEQUENCE/SQ/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SHIPBEGIN/SB/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SHIPLENS/SA/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SHIPLEN/SL/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SHIPSLEFT/SM/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/\"SHIPS/\"XXXXXX/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SHIPS/SS/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/XXXXXX/SHIPS/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/\"SHIP/\"XXXXXX/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/\"BATTLESHIP/\"YYYYYY/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SHIP/S/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/YYYYYY/BATTLESHIP/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/XXXXXX/SHIP/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SHOTS/SH/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SROW/SR/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/STATIC/ST/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/STRLEN/TL/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/TCOL/TC/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/TMP/T/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/TROW/TR/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/VALUE/V/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/VISIBLE/VI/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/\"WINNER/\"XXXXXX/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/WINNER/W/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/XXXXXX/WINNER/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/\COLOR/\XXXXXX/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/COL/C/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/XXXXXX/COLOR/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas

sed '/^$/d' tmp0.bas >> battleship.compact.bas
rm tmp0.bas