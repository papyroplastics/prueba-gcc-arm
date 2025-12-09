#include <stdint.h>
#include <stdlib.h>
#include "table.h"

hash_table_t* table_init(uint32_t size) {
    if (size == 0 || (size & (size - 1)) != 0) {
        return NULL;
    }

    hash_table_t* table = (hash_table_t*)malloc(sizeof(hash_table_t));
    if (table == NULL) {
        return NULL;
    }

    table->size = size;
    table->mask = size - 1;

    table->slots = (uint64_t*)calloc(size, sizeof(uint64_t));
    if (table->slots == NULL) {
        free(table);
        return NULL;
    }

    return table;
}

int table_insert(hash_table_t* table, uint32_t key, uint32_t value) {
    uint64_t data = ((uint64_t)value << 32) | key;
    uint32_t current_psl = 0;

    for (uint32_t d = 0; d < table->size; ++d, ++current_psl) {
        uint32_t idx = (key + d) & table->mask;
        uint64_t* slot_ptr = &table->slots[idx];
        uint64_t stored_data = *slot_ptr;

        if (stored_data == 0) {
            *slot_ptr = data;
            return 0; // Success
        }

        if (key == (uint32_t)stored_data) {
            *slot_ptr = data; // Overwrite the existing entry
            return 0; // Success
        }

        uint32_t stored_key = (uint32_t)stored_data;
        uint32_t stored_psl = (idx - stored_key) & table->mask;

        if (current_psl > stored_psl) {
            uint64_t temp = stored_data;
            *slot_ptr = data;

            data = temp;
            key = stored_key;
            
            current_psl = stored_psl;
        }
    }

    return -1;
}

