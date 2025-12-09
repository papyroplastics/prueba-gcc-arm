#include <stdint.h>

typedef struct hash_table_t {
  uint32_t size;
  uint32_t mask;
  uint64_t* slots;
} hash_table_t;

hash_table_t* table_init(uint32_t size);
int table_insert(hash_table_t* table, uint32_t key, uint32_t value);
uint64_t table_lookup(hash_table_t* table, uint32_t key);
uint64_t table_lookup_fixed(hash_table_t* table, uint32_t key);

