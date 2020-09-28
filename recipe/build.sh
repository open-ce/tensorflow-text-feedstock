# *****************************************************************
#
# Licensed Materials - Property of IBM
#
# (C) Copyright IBM Corp. 2020. All Rights Reserved.
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
# *****************************************************************
#!/bin/bash

set -vex

#Clean up old bazel cache to avoid problems building TF
bazel clean --expunge
bazel shutdown

sh ${SRC_DIR}/oss_scripts/run_build.sh

# install using pip from the whl file
pip install --no-deps $SRC_DIR/tensorflow_text*p${CONDA_PY}*.whl

bazel clean --expunge
bazel shutdown
