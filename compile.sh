#!/bin/sh
${GCC_PREFIX}gcc -O2 table.c table_lookup.S table_lookup_fixed.S time.c -o time
