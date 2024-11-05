#!/usr/bin/env zsh

# yay -S protobuf
# go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
# go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

function compile() {
  local proto=$1
  local import=$(dirname $proto)
  local out=$(dirname $import)
  protoc --proto_path=$import --go_out=$out --go-grpc_out=$out $proto
}

node="node/rpc/node.proto"
acc="node/rpc/account.proto"
tx="node/rpc/tx.proto"
blk="node/rpc/block.proto"

compile $node
compile $acc
compile $tx
compile $blk
