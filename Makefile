GCC_PREFIX='aarch64-linux-gnu-'

time: table.c table_lookup.S table_lookup_fixed.S time.c
	${GCC_PREFIX}gcc -O3 table.c table_lookup.S table_lookup_fixed.S time.c -o time

table_lookup.S: table_lookup.c
	${GCC_PREFIX}gcc -S -fverbose-asm -O3 table_lookup.c -o table_lookup.S

