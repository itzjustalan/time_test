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
  ttt=$( (time gcc ./hello.c) 2>&1)
  rtcc=$(echo $ttt | cut -d' ' -f2)
  utcc=$(echo $ttt | cut -d' ' -f4)
  stcc=$(echo $ttt | cut -d' ' -f6)


  ttt=$( (time rustc ./hello.rs) 2>&1)
  rtrc=$(echo $ttt | cut -d' ' -f2)
  utrc=$(echo $ttt | cut -d' ' -f4)
  strc=$(echo $ttt | cut -d' ' -f6)


  ttt=$( (time dart compile exe hello.dart >/dev/null 2>/dev/null) 2>&1)
  rtdc=$(echo $ttt | cut -d' ' -f2)
  utdc=$(echo $ttt | cut -d' ' -f4)
  stdc=$(echo $ttt | cut -d' ' -f6)


  bold "# Compiling.."

  echo "
        C         Rust      Dart
  real  ${rtcc}  ${rtrc}  ${rtdc}
  user  ${utcc}  ${utrc}  ${utdc}
  sys   ${stcc}  ${strc}  ${stdc}
  "
}


executePgms() {
  ttt=$( (time ./a.out) 2>&1)
  rtce=$(echo $ttt | cut -d' ' -f4)
  utce=$(echo $ttt | cut -d' ' -f6)
  stce=$(echo $ttt | cut -d' ' -f8)

  ttt=$( (time ./hello) 2>&1)
  rtre=$(echo $ttt | cut -d' ' -f4)
  utre=$(echo $ttt | cut -d' ' -f6)
  stre=$(echo $ttt | cut -d' ' -f8)

  ttt=$( (time ./hello.exe) 2>&1)
  rtde=$(echo $ttt | cut -d' ' -f4)
  utde=$(echo $ttt | cut -d' ' -f6)
  stde=$(echo $ttt | cut -d' ' -f8)


  bold "${nl}# Running.."

  echo "
        C         Rust      Dart
  real  ${rtce}  ${rtre}  ${rtde}
  user  ${utce}  ${utre}  ${utde}
  sys   ${stce}  ${stre}  ${stde}
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


