#!/bin/bash
set -ex # setting the automatic exit, if we get error, set -ex for debug

failure(){
    echo "Failed at: $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR # ERR is the error signal
echo "hellow sankar.he is the hardwoker person"
echooo "he is the lazy boy"
echo "sankar is the not failure boy. he is the keep focus on learning"