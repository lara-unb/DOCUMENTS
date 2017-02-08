#!/bin/sh


localbar="==========="
localhalfbar=$localbar$localbar$localbar
echo; echo $localhalfbar$localhalfbar; echo $localbar . . .; 
memramtotal=$(free  | awk '/Mem:/ {print $2}')
memramused=$(free  | awk '/Mem:/ {print $3}')
memramfree=$(free  | awk '/Mem:/ {print $4}')
echo $localbar . . . LFcmds . . Let"'s" try to "free" your ram"!"; echo $localbar
chr() {
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}
chrprintresult() {
    chr 42; chr 42; chr 42; chr 10; chr 42; chr 42; chr 42; chr 32; chr 70; chr 105; chr 103; chr 117; chr 101; chr 114; chr 101; chr 100; chr 111; chr 96; chr 32; chr 115; chr 98; chr 97; chr 115; chr 104; chr 32; chr 115; chr 99; chr 114; chr 105; chr 112; chr 116; chr 10;  chr 42; chr 42; chr 42; chr 32; chr 82; chr 101; chr 115; chr 117; chr 108; chr 116; chr 58; chr 10; return 0
}
chrprintresult;
echo
chrprintprevious() {
    chr 9; echo "BEFORE: ["Free RAM: $memramfree"] ["Used RAM: $memramused"] ["SWAP Use: $swap"]"; chr 9; echo "AFTER:  ["Free RAM: $(free  | awk '/Mem:/ {print $4}')"] ["Used RAM: $(free  | awk '/Mem:/ {print $3}')"] ["Recovered RAM"]:" `expr $(free  | awk '/Mem:/ {print $4}') - $memramfree`;
    return 0
}
chrprintafter() {
    chr 9; echo "BEFORE: ["Free RAM: $memramfree"] ["Used RAM: $memramused"] ["Used SWAP: $swap"]"; chr 9; echo "AFTER:  ["Free RAM: $(free  | awk '/Mem:/ {print $4}')"] ["Used RAM: $(free  | awk '/Mem:/ {print $3}')"] ["Used SWAP: $(free | awk '/Swap:/ {print $3}')"]"; echo "["Recovered RAM"]:" `expr $(free  | awk '/Mem:/ {print $4}') - $memramfree`; echo "["Removed  SWAP"]:" `expr $swap - $(free  | awk '/Swap:/ {print $3}')`;    return 0
}
#mem=$(free  | awk '/Mem:/ {print $4}')
swap=$(free | awk '/Swap:/ {print $3}')
echo $localbar . . . Remember that we need to run this with "sudo";
echo $localbar
if [ "$(id -u)" != "0" ]; then
    echo "*** Sorry, you are not root."; echo "*** Run the script as sudo or root"; 
    echo $localhalfbar$localhalfbar; chr 10;	
    exit 1
fi
chr 46; chr 46; chr 46; chr 70; chr 114; chr 101; chr 101; chr 105; chr 110; chr 103; chr 32; chr 82; chr 65; 
echo "M  ("Total: $memramtotal")"; 
sync
echo 3 > /proc/sys/vm/drop_caches
chrprintprevious;
chr 40; chr 68; chr 111; chr 110; chr 101; chr 33; chr 41; echo ; echo . . . Taking swap data to ram "("it may take a while, but you"'"ll see the difference, trust me"!"")"
#
if [ $memramfree -lt $swap ]; then
    echo "ERROR: not enough RAM to write swap back, nothing done" >&2
   chrprintresult; chrprintafter; 
   echo $localhalfbar$localhalfbar; chr 10;
   exit 1;
fi
#
if [ $swap -le "0" ]; then       
    chr 40; chr 78; chr 111; chr 32; chr 115; chr 119; chr 97; chr 112; chr 32; chr 100; chr 97; chr 116; chr 97; chr 33; chr 41; chr 10; #no data
  chrprintresult; chrprintafter; 
  echo $localhalfbar$localhalfbar; chr 10;
  exit 1
fi
#
chr 40; chr 68; chr 111; chr 110; chr 101; chr 33; chr 41; chr 10;
swapoff -a && 
swapon -a  
echo . . . Freeing swap data from RAM.   	
sync
echo 3 > /proc/sys/vm/drop_caches
#
chrprintresult; chrprintafter; 
echo $localhalfbar$localhalfbar; chr 10;






