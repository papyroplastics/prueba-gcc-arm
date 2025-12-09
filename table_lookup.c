#include <stdint.h>
#include "table.h"

uint64_t table_lookup(hash_table_t* table, uint32_t key) {
  uint32_t mask = table->mask;
  uint64_t* slots = table->slots;

  for (uint32_t d = 0;; ++d) {
    uint32_t idx = (key + d) & mask;
    uint64_t slot = slots[idx];

    if (slot == 0) {
      return 0;
    } else if (key == (uint32_t)slot) {
      return (slot >> 32) | (slot << 32);
    } else if (((idx - (uint32_t)slot) & mask) < d) {
      return 0;
    }
  }
}

