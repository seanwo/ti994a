#!/bin/bash
echo "100 REM COPYRIGHT (C) 1987-2023 SEAN WOHLGEMUTH" >blackjack.compact.bas
sed 's/^[0-9]* REM .*//g' blackjack.bas | sed '/^$/d' | sed 's/ [:]* REM .*//g' >>blackjack.compact.bas