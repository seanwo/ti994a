# ti994a

Repository for the reconstruction (and "reimagining") of TI-99/4A projects developed during my childhood.

## Project: BlackJack

Source Code: [blackjack.bas](blackjack.bas)  
Source Code (compacted): [blackjack.compact.bas](blackjack.compact.bas)  
Cassette Tape: [blackjack.compact.wav](blackjack.compact.wav)  
GROM: [BLACKJAC-G.BIN](BLACKJACK/BLACKJAC-G.BIN)  
ROM: [BLACKJAC-8.BIN](BLACKJACK/BLACKJAC-8.BIN)  

Gameplay Video:  
[![ti994a BlackJack Game](https://img.youtube.com/vi/NXRHZJ8q77w/0.jpg)](https://www.youtube.com/watch?v=NXRHZJ8q77w)

## Project: Battleship

Source Code: [battleship.bas](battleship.bas)  
Source Code (compacted): [battleship.compact.bas](battleship.compact.bas)  
Cassette Tape: [battleship.compact.wav](battleship.compact.wav)  
GROM: [BATTLESH-G.BIN](BATTLESHIP/BATTLESH-G.BIN)  
ROM: [BLATTLESH-8.BIN](BATTLESHIP/BATTLESH-8.BIN)  

Gameplay Video:  
[![ti994a Battleship Game](https://img.youtube.com/vi/pnJ6ugJYJeI/0.jpg)](https://www.youtube.com/watch?v=pnJ6ugJYJeI)


## Tools

Name: Win994a-TI-99/4A Simulator for Windows  
Description: Win994a is a TI-99/4A simulator written by Cory Burr that installs and runs in the Windows environment.  It was written to simulate  the TI-99/4A, not to emulate it perfectly.  
Notes: Great for BASIC code development.  
URL: [Win994a-TI-99/4A Simulator for Windows](https://www.99er.net/win994a.shtml)  

Name: Classic99  
Description: Classic99 TI-99/4A emulator for Windows, QI3xx series.  
Notes: Great for cutting and pasting XB code straight into emulator.  
URL: [Classic99](https://github.com/tursilion/classic99/tree/main/dist)  

Name: js99er  
Description: TI-99/4A emulator written in TypeScript using Angular.  
Notes: Great for generating .wav cassette files.  
URL: [js99er](https://github.com/Rasmus-M/js99er-angular)  

Name: Ti99Dir  
Description: Ti99Dir is a Windows program to browse through TI-99/4A files (v9t9 format), Archive files (v9t9 format and created with Barry Boones archiver) and .DSK files (v9t9 and PC99*) on a PC.  
Notes: Great for drive management; browsing and extracting.  
URL: [Ti99dir](https://www.99er.net/download2/index.php?act=view&id=219)  

Name: XB (Extended BASIC) Game Developers Package (XBGDP or JUWEL4)  
Description: For all its strengths, Extended BASIC has two major weaknesses. It cannot utilize the full power of the 9918A video processor, and programs generally run slowly. This package contains two stand alone applications (XB256 and the Extended BASIC Compiler) that can also be used together to address these shortcomings, making it possible to produce arcade quality games with XB.  
Notes: This is one of the only ways to create a TI cartridge GROM or ROM.  Follow the instructions in the "Using XBGDP" document that comes with the package.  
URL: [XBGDP](https://forums.atariage.com/topic/224905-xb-game-developers-package/)

## Loading Cassette Program (.wav) Files From Mac To TI-99/4A

* Plug the TI tape audio cable serial end into the back of the TI
* Plug the TI tape audio cable (white wire) into the headphone jack of your mac
* Set your mac system volume to max
* Set VLC volume to max
* Set VLC->Window->Audio Effects...->Equalizer->Enable->Full treble
* From the TI: ```OLD CS1```
* Follow the on screen instructions, when prompted to press play on cassette, press play in VLC
