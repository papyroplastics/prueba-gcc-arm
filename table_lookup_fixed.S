	.arch armv8-a
	.file	"table_lookup.c"
// GNU C17 (Debian 12.2.0-14) version 12.2.0 (aarch64-linux-gnu)
//	compiled by GNU C version 12.2.0, GMP version 6.2.1, MPFR version 4.2.0, MPC version 1.3.1, isl version isl-0.25-GMP

// GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
// options passed: -mlittle-endian -mabi=lp64 -O2 -fasynchronous-unwind-tables
	.text
	.align	2
	.p2align 4,,11
	.global	table_lookup_fixed
	.type	table_lookup_fixed, %function
table_lookup_fixed:
.LFB0:
	.cfi_startproc
// table_lookup.c:5:   uint32_t mask = table->mask;
	ldr	w4, [x0, 4]	//, table_12(D)->mask
// table_lookup.c:6:   uint64_t* slots = table->slots;
	ldr	x6, [x0, 8]	// slots, table_12(D)->slots
// table_lookup.c:10:     uint64_t slot = slots[idx];
	//and	w0, w4, w1	// idx, mask, key
// table_lookup.c:9:     uint32_t idx = (key + d) & mask;
	and	w2, w4, w1	// idx, mask, key
// table_lookup.c:10:     uint64_t slot = slots[idx];
	ldr	x0, [x6, x2, lsl 3]	// <retval>, *_24
// table_lookup.c:12:     if (slot == 0) {
	cbz	x0, .L1	// <retval>,
// table_lookup.c:8:   for (uint32_t d = 0;; ++d) {
	mov	w3, 0	// d,
	b	.L4		//
	.p2align 2,,3
.L3:
// table_lookup.c:16:     } else if (((idx - (uint32_t)slot) & mask) < d) {
	and	w2, w2, w4	// tmp110, tmp109, mask
// table_lookup.c:16:     } else if (((idx - (uint32_t)slot) & mask) < d) {
	cmp	w2, w3	// tmp110, d
	bcc	.L5		//,
// table_lookup.c:8:   for (uint32_t d = 0;; ++d) {
	add	w3, w3, 1	// d, d,
// table_lookup.c:9:     uint32_t idx = (key + d) & mask;
	add	w0, w1, w3	// tmp111, key, d
// table_lookup.c:10:     uint64_t slot = slots[idx];
	//and	w5, w0, w4	// idx, tmp111, mask
// table_lookup.c:9:     uint32_t idx = (key + d) & mask;
	and	w2, w0, w4	// idx, tmp111, mask
// table_lookup.c:10:     uint64_t slot = slots[idx];
	ldr	x0, [x6, x2, lsl 3]	// <retval>, *_4
// table_lookup.c:12:     if (slot == 0) {
	cbz	x0, .L1	// <retval>,
.L4:
// table_lookup.c:16:     } else if (((idx - (uint32_t)slot) & mask) < d) {
	sub	w2, w2, w0	// tmp109, idx, <retval>
// table_lookup.c:14:     } else if (key == (uint32_t)slot) {
	cmp	w0, w1	// <retval>, key
	bne	.L3		//,
// table_lookup.c:15:       return (slot >> 32) | (slot << 32);
	ror	x0, x0, 32	// <retval>, <retval>,
.L1:
// table_lookup.c:20: }
	ret	
	.p2align 2,,3
.L5:
// table_lookup.c:13:       return 0;
	mov	x0, 0	// <retval>,
// table_lookup.c:20: }
	ret	
	.cfi_endproc
.LFE0:
	.size	table_lookup_fixed, .-table_lookup_fixed
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
