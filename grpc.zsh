#!/usr/bin/env zsh

boot="localhost:1122"
node="localhost:1123"
authpass="password"
ownerpass="password"

function txSignAndSend() {
  local node=$1
  local from=$2
  local to=$3
  local value=$4
  local ownerpass=$5

  local tx=$(./bcn tx sign --node $node --from $from --to $to --value $value \
    --ownerpass $ownerpass)
  echo $tx
  ./bcn tx send --node $node --sigtx $tx
}

acc1="8824f522bb131453c83225b276a3a3f8f145c99fb3518e3a7219b3f2f3bc0a0c"
acc2="715aa9e36740bce382a543b10fd70cad0bc1796b04fd7e49677a2fdcd1eac95c"

# Uncomment the following lines to use the function:
# txSignAndSend $boot $acc1 $acc2 2 $ownerpass
# txSignAndSend $boot $acc2 $acc1 1 $ownerpass
