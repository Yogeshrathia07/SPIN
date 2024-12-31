	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM no_continuous_overflow */
;
		
	case 3: // STATE 1
		goto R999;

	case 4: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM buffer_size_invariant */
;
		
	case 5: // STATE 1
		goto R999;

	case 6: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM packet_flow_safety */
;
		
	case 7: // STATE 1
		goto R999;

	case 8: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 9: // STATE 1
		;
		((P4 *)_this)->_7_5_choice = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 2
		;
		((P4 *)_this)->_7_5_choice = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 12: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 13: // STATE 5
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 14: // STATE 6
		;
		((P4 *)_this)->_7_5_choice = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 15: // STATE 7
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 16: // STATE 8
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 17: // STATE 9
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 18: // STATE 10
		;
		((P4 *)_this)->_7_5_choice = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 19: // STATE 11
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 20: // STATE 12
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 21: // STATE 13
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 22: // STATE 20
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC packetbuf_hdralloc */

	case 23: // STATE 1
		;
		((P3 *)_this)->size = trpt->bup.oval;
		;
		goto R999;

	case 24: // STATE 2
		;
		((P3 *)_this)->size = trpt->bup.oval;
		;
		goto R999;

	case 25: // STATE 3
		;
		((P3 *)_this)->size = trpt->bup.oval;
		;
		goto R999;

	case 26: // STATE 4
		;
		((P3 *)_this)->size = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 9
		;
		now.critical_error = trpt->bup.ovals[2];
		error_overflow = trpt->bup.ovals[1];
	/* 0 */	((P3 *)_this)->size = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		
	case 28: // STATE 22
		goto R999;

	case 29: // STATE 11
		;
		((P3 *)_this)->_6_4_i = trpt->bup.oval;
		;
		goto R999;

	case 30: // STATE 14
		;
		((P3 *)_this)->_6_4_i = trpt->bup.ovals[1];
		now.packetbuf[ Index((((P3 *)_this)->_6_4_i+((P3 *)_this)->size), 128) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 31: // STATE 20
		;
		now.hdrlen = trpt->bup.oval;
		;
		goto R999;

	case 32: // STATE 24
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC packetbuf_copyfrom */

	case 33: // STATE 1
		;
		((P2 *)_this)->ln = trpt->bup.oval;
		;
		goto R999;

	case 34: // STATE 2
		;
		((P2 *)_this)->ln = trpt->bup.oval;
		;
		goto R999;

	case 35: // STATE 3
		;
		((P2 *)_this)->ln = trpt->bup.oval;
		;
		goto R999;

	case 36: // STATE 4
		;
		((P2 *)_this)->ln = trpt->bup.oval;
		;
		goto R999;

	case 37: // STATE 9
		;
		now.critical_error = trpt->bup.ovals[1];
		error_overflow = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 38: // STATE 45
		goto R999;

	case 39: // STATE 11
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 40: // STATE 13
		;
		((P2 *)_this)->_5_3_i = trpt->bup.oval;
		;
		goto R999;

	case 41: // STATE 16
		;
		((P2 *)_this)->_5_3_i = trpt->bup.ovals[1];
		((P2 *)_this)->from[ Index(((P2 *)_this)->_5_3_i, 128) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 42: // STATE 24
		;
		now.critical_error = trpt->bup.ovals[2];
		error_overflow = trpt->bup.ovals[1];
	/* 0 */	((P2 *)_this)->ln = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 43: // STATE 26
		;
		((P2 *)_this)->_5_3_j = trpt->bup.oval;
		;
		goto R999;

	case 44: // STATE 29
		;
		((P2 *)_this)->_5_3_j = trpt->bup.ovals[1];
		now.packetbuf[ Index(((P2 *)_this)->_5_3_j, 128) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 45: // STATE 36
		;
		now.packet_count = trpt->bup.ovals[1];
		now.buflen = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 46: // STATE 43
		goto R999;

	case 47: // STATE 41
		;
		now.critical_error = trpt->bup.ovals[1];
		error_overflow = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 48: // STATE 47
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC packetbuf_clear */

	case 49: // STATE 3
		;
		now.hdrlen = trpt->bup.ovals[2];
		bufptr = trpt->bup.ovals[1];
		now.buflen = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 50: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 51: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC packetbuf_attr_clear */

	case 52: // STATE 1
		;
		((P0 *)_this)->_3_1_i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 54: // STATE 8
		;
		((P0 *)_this)->_3_1_i = trpt->bup.ovals[2];
		now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].is_critical = trpt->bup.ovals[1];
		now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].val = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 55: // STATE 8
		;
		((P0 *)_this)->_3_1_i = trpt->bup.ovals[2];
		now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].is_critical = trpt->bup.ovals[1];
		now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].val = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 56: // STATE 8
		;
		((P0 *)_this)->_3_1_i = trpt->bup.ovals[1];
		now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].is_critical = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 57: // STATE 14
		;
		((P0 *)_this)->_3_1_i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 59: // STATE 22
		;
		((P0 *)_this)->_3_1_i = trpt->bup.ovals[3];
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_valid = trpt->bup.ovals[2];
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null = trpt->bup.ovals[1];
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].addr = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 60: // STATE 22
		;
		((P0 *)_this)->_3_1_i = trpt->bup.ovals[3];
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_valid = trpt->bup.ovals[2];
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null = trpt->bup.ovals[1];
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].addr = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 61: // STATE 22
		;
		((P0 *)_this)->_3_1_i = trpt->bup.ovals[2];
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_valid = trpt->bup.ovals[1];
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 62: // STATE 29
		;
		p_restor(II);
		;
		;
		goto R999;
	}

