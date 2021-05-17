#!/bin/sh


nl='
'
bold() {
    tput bold
    #echo -n "$@"
    echo "$@"
    tput sgr0
}


compilePgms() {

  bold "# Compiling.."

  cd ./c || exit
  ttt=$( (time gcc ./main.c) 2>&1)
  rtcc=$(echo $ttt | cut -d' ' -f2)
  utcc=$(echo $ttt | cut -d' ' -f4)
  stcc=$(echo $ttt | cut -d' ' -f6)
  cd ../ || exit

  cd ./dart || exit
  ttt=$( (time dart compile exe main.dart >/dev/null 2>/dev/null) 2>&1)
  rtdc=$(echo $ttt | cut -d' ' -f2)
  utdc=$(echo $ttt | cut -d' ' -f4)
  stdc=$(echo $ttt | cut -d' ' -f6)
  cd ../ || exit

  cd ./go || exit
  ttt=$( (time go build main.go >/dev/null 2>/dev/null) 2>&1)
  rtgc=$(echo $ttt | cut -d' ' -f2)
  utgc=$(echo $ttt | cut -d' ' -f4)
  stgc=$(echo $ttt | cut -d' ' -f6)
  cd ../ || exit

  cd ./rust || exit
  ttt=$( (time rustc ./main.rs) 2>&1)
  rtrc=$(echo $ttt | cut -d' ' -f2)
  utrc=$(echo $ttt | cut -d' ' -f4)
  strc=$(echo $ttt | cut -d' ' -f6)
  cd ../ || exit

  echo "
        sys       user      real
  C     ${stcc}  ${utcc}  ${rtcc}
  Dart  ${stdc}  ${utdc}  ${rtdc}
  Go    ${stgc}  ${utgc}  ${rtgc}
  Rust  ${strc}  ${utrc}  ${rtrc}
  "
}


executePgms() {

  bold "${nl}# Executing.."

  cd ./c || exit
  ttt=$( (time ./a.out) 2>&1)
  rtce=$(echo $ttt | cut -d' ' -f4)
  utce=$(echo $ttt | cut -d' ' -f6)
  stce=$(echo $ttt | cut -d' ' -f8)
  cd ../ || exit

  cd ./dart || exit
  ttt=$( (time ./main.exe) 2>&1)
  rtde=$(echo $ttt | cut -d' ' -f4)
  utde=$(echo $ttt | cut -d' ' -f6)
  stde=$(echo $ttt | cut -d' ' -f8)
  cd ../ || exit

  cd ./go || exit
  ttt=$( (time ./main) 2>&1)
  rtge=$(echo $ttt | cut -d' ' -f4)
  utge=$(echo $ttt | cut -d' ' -f6)
  stge=$(echo $ttt | cut -d' ' -f8)
  cd ../ || exit

  cd ./rust || exit
  ttt=$( (time ./main) 2>&1)
  rtre=$(echo $ttt | cut -d' ' -f4)
  utre=$(echo $ttt | cut -d' ' -f6)
  stre=$(echo $ttt | cut -d' ' -f8)
  cd ../ || exit

  echo "
        sys       user      real
  C     ${stce}  ${utce}  ${rtce}
  Dart  ${stde}  ${utde}  ${rtde}
  Go    ${stge}  ${utge}  ${rtge}
  Rust  ${stre}  ${utre}  ${rtre}
  "
}



if [ "$#" = "0" ] || [ "$1" = '-ce' ] || [ "$1" = '-ec' ];then
  compilePgms
  executePgms
  exit
elif [ "$1" = "-c" ];then
  compilePgms
  exit
elif [ "$1" = "-e" ];then
  executePgms
  exit
fi

echo "EOF?"


