#include <stdint.h>
#include <stdio.h>
#include <time.h>
#include "table.h"

int main(void) {
    hash_table_t* table = table_init(1<<16);
    table_insert(table, 192, 581);

    printf("lookup: %lu", table_lookup(table, 192));
    printf("fixed: %lu", table_lookup_fixed(table, 192));

    return 0;
}
