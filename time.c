#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include "table.h"

int main(void) {
    hash_table_t* table = table_init(1<<16);

    for (uint32_t i = 0; i < table->size - 100; ++i) {
        table_insert(table, (uint32_t)rand(), (uint32_t)rand());
    }

    uint32_t max = 10000000;
    
    table_lookup(table, 0);
    table_lookup(table, 1);
    table_lookup(table, 2);
    table_lookup(table, 3);
    table_lookup(table, 4);

    time_t ti = time(NULL);
    for (uint32_t i = 0; i < max; ++i) {
        table_lookup(table, i);
    }
    time_t tf = time(NULL);

    time_t t_loolup = tf - ti;

    table_lookup_fixed(table, 0);
    table_lookup_fixed(table, 1);
    table_lookup_fixed(table, 2);
    table_lookup_fixed(table, 3);
    table_lookup_fixed(table, 4);

    ti = time(NULL);
    for (uint32_t i = 0; i < max; ++i) {
        table_lookup_fixed(table, i);
    }
    tf = time(NULL);
    time_t t_fixed = tf - ti;

    printf("lookup: %lu", t_loolup);
    printf("lookup: %lu", t_fixed);
    return 0;
}
