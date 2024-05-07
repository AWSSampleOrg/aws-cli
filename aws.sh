#!/usr/bin/env bash

SOURCE_DIR=$(cd $(dirname ${BASHS_SOURCE:-$0}) && pwd)
cd ${SOURCE_DIR}

./output/bin/aws $@

# When Debugging AWS code with LLDB just run following code
# apropos EXC_BAD_INSTRUCTION
# settings set platform.plugin.darwin.ignored-exceptions EXC_BAD_INSTRUCTION
# process handle SIGILL -n false -p true -s false
# bt

