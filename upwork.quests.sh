#!/bin/bash

cd /etc \
&& cp hosts hosts.backup."$(date +%s)" \
&& echo '# This is a new line' >> hosts

cd /etc \
&& cp hosts hosts.backup."$(date +%s)" \
&& tac hosts > hosts.revers \
&& echo '# This is a new line' >> hosts.revers \
&& tac hosts.revers > hosts



