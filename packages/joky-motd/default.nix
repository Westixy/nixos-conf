{ pkgs, writeScriptBin, ... }:
writeScriptBin "joky-motd" ''
( curl -Ls https://v2.jokeapi.dev/joke/Any?format=txt 2> /dev/null \
  || echo "No connection; time to cry ... in silence" ) \
  | boxes -d peek -a c -s 60x
  echo $'\n'
''