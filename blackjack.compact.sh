#!/bin/bash
echo "100 REM COPYRIGHT (C) 1987-2023 SEAN WOHLGEMUTH" >blackjack.compact.bas
sed 's/^[0-9]* REM .*//g' blackjack.bas | sed '/^$/d' | sed 's/ [:]* REM .*//g' >>tmp0.bas

# Remove calls to these subroutines
sed 's/^[0-9]* CALL GETBLACKVALS(BLACKVALS)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETREDVALS(REDVALS)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETCARDEDGE(CARDEDGE)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETCARDFRONT(CARDFRONT)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETCARDBACK(CARDBACK)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETCARDTOP(CARDTOP)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETHEART(HEART)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETDIAMOND(DIAMOND)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETSPADE(SPADE)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/^[0-9]* CALL GETCLUB(CLUB)//g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas

#Remove call to these subroutine with inline statements
sed 's/CALL GETHEART(SUIT)/SUIT=96/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL GETDIAMOND(SUIT)/SUIT=97/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL GETSPADE(SUIT)/SUIT=112/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL GETCLUB(SUIT)/SUIT=113/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL GETREDVALS(CARDCHAR)/CARDCHAR=98/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL GETBLACKVALS(CARDCHAR)/CARDCHAR=114/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL GETCARDBACK(FILL)/FILL=111/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL GETCARDFRONT(FILL)/FILL=136/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas

#remove these subroutines completely
sed '/SUB GETHEART/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETDIAMOND/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETSPADE/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETCLUB/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETREDVALS/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETBLACKVALS/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETCARDBACK/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETCARDFRONT/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETCARDEDGE/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed '/SUB GETCARDTOP/,/SUBEND/d' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas

#reduce subroutine names to 3 letters
sed 's/SUB CALCSCORE/SUB CAS/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL CALCSCORE/CALL CAS/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB CHECKDUP/SUB CKD/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL CHECKDUP/CALL CKD/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB CLEARTABLE/SUB CTB/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL CLEARTABLE/CALL CTB/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB DEAL/SUB DEA/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL DEAL/CALL DEA/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB INTRO/SUB TRO/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL INTRO/CALL TRO/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB PLAY/SUB PLY/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL PLAY/CALL PLY/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB RENDER10/SUB R0A/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL RENDER10/CALL R0A/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB RENDER2/SUB R02/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL RENDER2/CALL R02/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB RENDER3/SUB R03/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL RENDER3/CALL R03/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB RENDER4/SUB R04/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL RENDER4/CALL R04/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB RENDER5/SUB R05/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL RENDER5/CALL R05/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB RENDER6/SUB R06/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL RENDER6/CALL R06/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB RENDER7/SUB R07/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL RENDER7/CALL R07/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB RENDER8/SUB R08/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL RENDER8/CALL R08/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB RENDER9/SUB R09/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL RENDER9/CALL R09/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB RENDERACE/SUB RAC/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL RENDERACE/CALL RAC/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB RENDERCARD/SUB RCD/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL RENDERCARD/CALL RCD/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB RENDERJACK/SUB RJK/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL RENDERJACK/CALL RJK/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB RENDERQUEEN/SUB RQN/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL RENDERQUEEN/CALL RQN/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB RENDERKING/SUB RKG/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL RENDERKING/CALL RKG/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB SETCHARSBLACK/SUB SCB/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL SETCHARSBLACK/CALL SCB/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB SETCHARSEDGES/SUB SCE/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL SETCHARSEDGES/CALL SCE/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB SETCHARSRED/SUB SCR/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL SETCHARSRED/CALL SCR/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB SETCHARSVALS/SUB SCV/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL SETCHARSVALS/CALL SCV/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB SETCHARS/SUB SCH/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL SETCHARS/CALL SCH/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB SETCOLORSCHEME/SUB SCS/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL SETCOLORSCHEME/CALL SCS/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB SHUFFLE/SUB SHF/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL SHUFFLE/CALL SHF/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB TERMINATE/SUB TRM/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL TERMINATE/CALL TRM/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUB WHOWON/SUB WHW/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CALL WHOWON/CALL WHW/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas

#replace these variable with constants
sed 's/BLACKVALS/114/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/REDVALS/98/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CARDEDGE/128/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CARDFRONT/136/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CARDBACK/111/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CARDTOP/129/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/HEART/96/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/DIAMOND/97/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SPADE/112/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CLUB/113/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas

#reduce arrays to 2 letters
sed 's/HANDS(/HD(/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CARDS(/CA(/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUMS(/SM(/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/DECK(/DK(/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas

#reduce number variables to 2 letters
sed 's/THE PLAYER/XXXXXX/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/PLAYER/P/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/XXXXXX/THE PLAYER/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/BUSTED\./XXXXXX\./g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/BUSTED/BU/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/XXXXXX\./BUSTED\./g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CARDCHAR/CC/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CARDVAL/CV/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/CVAL/CL/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/ROW/RO/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/PSCORE/PS/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/DSCORE/DS/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SCORE/SC/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/FACEDOWN/FD/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/OFFSET/OF/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/FILL/FI/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/SUIT/SU/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas
sed 's/DUP/DU/g' tmp0.bas > tmp1.bas
mv tmp1.bas tmp0.bas

# CARD
# COL

sed '/^$/d' tmp0.bas >> blackjack.compact.bas
rm tmp0.bas