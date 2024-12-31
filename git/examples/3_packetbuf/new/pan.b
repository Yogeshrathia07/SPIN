	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM valid_copyto */
;
		;
		;
		;
		
	case 5: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM header_allocation_reduction */
;
		
	case 6: // STATE 1
		goto R999;

	case 7: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM buffer_safety */
;
		
	case 8: // STATE 1
		goto R999;

	case 9: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 10: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 11: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 12: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 13: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 14: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC packetbuf_hdrreduce */

	case 15: // STATE 5
		;
		now.total_header_reductions = trpt->bup.ovals[3];
		((P5 *)_this)->result = trpt->bup.ovals[2];
		now.buflen = trpt->bup.ovals[1];
		now.bufptr = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;
;
		
	case 16: // STATE 9
		goto R999;

	case 17: // STATE 7
		;
		((P5 *)_this)->result = trpt->bup.oval;
		;
		goto R999;

	case 18: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC packetbuf_hdralloc */

	case 19: // STATE 1
		;
		((P4 *)_this)->_7_5_i = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 3
		;
		((P4 *)_this)->result = trpt->bup.ovals[1];
	/* 0 */	((P4 *)_this)->size = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 21: // STATE 19
		goto R999;

	case 22: // STATE 5
		;
		((P4 *)_this)->_7_5_i = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 8
		;
		((P4 *)_this)->_7_5_i = trpt->bup.ovals[1];
		now.packetbuf[ Index((((P4 *)_this)->_7_5_i+((P4 *)_this)->size), 128) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 24: // STATE 17
		;
		total_header_allocations = trpt->bup.ovals[3];
		now.header_allocated = trpt->bup.ovals[2];
		((P4 *)_this)->result = trpt->bup.ovals[1];
		now.hdrlen = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;

	case 25: // STATE 21
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC packetbuf_copyto */

	case 26: // STATE 2
		;
		((P3 *)_this)->result = trpt->bup.oval;
		;
		goto R999;
;
		
	case 27: // STATE 25
		goto R999;

	case 28: // STATE 4
		;
		((P3 *)_this)->_6_4_i = trpt->bup.oval;
		;
		goto R999;

	case 29: // STATE 7
		;
		((P3 *)_this)->_6_4_i = trpt->bup.ovals[1];
		((P3 *)_this)->to[ Index(((P3 *)_this)->_6_4_i, 128) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 30: // STATE 13
		;
		((P3 *)_this)->_6_4_j = trpt->bup.oval;
		;
		goto R999;

	case 31: // STATE 17
		;
		((P3 *)_this)->_6_4_j = trpt->bup.ovals[2];
		((P3 *)_this)->_6_4_i = trpt->bup.ovals[1];
		((P3 *)_this)->to[ Index(((P3 *)_this)->_6_4_i, 128) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 32: // STATE 23
		;
		((P3 *)_this)->result = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 33: // STATE 27
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC packetbuf_copyfrom */

	case 34: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 35: // STATE 8
		;
		((P2 *)_this)->_5_3_i = trpt->bup.ovals[1];
		((P2 *)_this)->l = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 36: // STATE 8
		;
		((P2 *)_this)->_5_3_i = trpt->bup.ovals[1];
		((P2 *)_this)->l = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 37: // STATE 8
		;
		((P2 *)_this)->_5_3_i = trpt->bup.oval;
		;
		goto R999;

	case 38: // STATE 11
		;
		((P2 *)_this)->_5_3_i = trpt->bup.ovals[1];
		now.packetbuf[ Index(((P2 *)_this)->_5_3_i, 128) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 39: // STATE 17
		;
		now.buflen = trpt->bup.oval;
		;
		goto R999;

	case 40: // STATE 19
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC packetbuf_clear */

	case 41: // STATE 3
		;
		now.hdrlen = trpt->bup.ovals[2];
		now.bufptr = trpt->bup.ovals[1];
		now.buflen = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 42: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 43: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC packetbuf_attr_clear */

	case 44: // STATE 1
		;
		((P0 *)_this)->_3_1_i = trpt->bup.oval;
		;
		goto R999;

	case 45: // STATE 4
		;
		((P0 *)_this)->_3_1_i = trpt->bup.ovals[1];
		now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].val = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 46: // STATE 10
		;
		((P0 *)_this)->_3_1_i = trpt->bup.oval;
		;
		goto R999;

	case 47: // STATE 14
		;
		((P0 *)_this)->_3_1_i = trpt->bup.ovals[2];
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null = trpt->bup.ovals[1];
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].addr = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 48: // STATE 21
		;
		p_restor(II);
		;
		;
		goto R999;
	}

