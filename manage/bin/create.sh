#!/bin/bash

pthtop="$(cd "$(dirname "${0}")/../../../.." && pwd)"
source "${pthtop}"/manage/lib/params.sh
source "${pthtop}"/manage/lib/shared.sh
source "${pthcrr}"/params.sh

pthapp="${pthtop}"/import/cnnmmd_xoxxox_tttlcp/applcp
pthmdl="${pthapp}"/prm

function getmdl {
  local mdltgt=${1} ; shift
  local mdlurl=${1} ; shift

  if cd "${pthmdl}"
  then
    if test ! -e "${mdltgt}"
    then
      if cnfrtn "import: ${mdltgt}: ${mdlurl}"
      then
        curl -LO "${mdlurl}" -o "${mdltgt}"
      fi
    fi
  fi
}

# https://huggingface.co/ggml-org/gpt-oss-20b-GGUF
getmdl gpt-oss-20b-mxfp4.gguf https://huggingface.co/ggml-org/gpt-oss-20b-GGUF/resolve/main/gpt-oss-20b-mxfp4.gguf
