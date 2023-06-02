#!/bin/bash
sed 's/^[0-9]* REM .*//g' blackjack.bas | sed '/^$/d' | sed 's/ [:]* REM .*//g' >blackjack.compact.bas