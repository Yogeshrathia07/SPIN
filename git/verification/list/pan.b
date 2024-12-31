	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 4: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 6: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;
;
		;
		
	case 8: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC list_pop */
;
		;
		
	case 10: // STATE 4
		;
		((P2 *)_this)->first_item = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 5
		;
		now.head = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 6
		;
		now.size = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 14: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC list_remove */
;
		;
		
	case 16: // STATE 3
		;
	/* 0 */	((P1 *)_this)->item = trpt->bup.oval;
		;
		;
		goto R999;

	case 17: // STATE 4
		;
		now.head = trpt->bup.oval;
		;
		goto R999;

	case 18: // STATE 5
		;
		now.size = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 7
		;
		((P1 *)_this)->prev = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 8
		;
		((P1 *)_this)->curr = trpt->bup.oval;
		;
		goto R999;

	case 21: // STATE 9
		;
	/* 0 */	((P1 *)_this)->curr = trpt->bup.oval;
		;
		;
		goto R999;

	case 22: // STATE 11
		;
	/* 0 */	((P1 *)_this)->item = trpt->bup.oval;
		;
		;
		goto R999;

	case 23: // STATE 12
		;
		now.next[ Index(((P1 *)_this)->prev, 10) ] = trpt->bup.oval;
		;
		goto R999;

	case 24: // STATE 13
		;
		now.size = trpt->bup.oval;
		;
		goto R999;

	case 25: // STATE 16
		;
		((P1 *)_this)->prev = trpt->bup.oval;
		;
		goto R999;

	case 26: // STATE 17
		;
		((P1 *)_this)->curr = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 23
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC list_add */
;
		;
		
	case 29: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;
;
		;
		
	case 31: // STATE 4
		;
		now.head = trpt->bup.oval;
		;
		goto R999;

	case 32: // STATE 5
		;
		now.next[ Index(((P0 *)_this)->item, 10) ] = trpt->bup.oval;
		;
		goto R999;

	case 33: // STATE 7
		;
		((P0 *)_this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 35: // STATE 11
		;
		((P0 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 36: // STATE 15
		;
		now.next[ Index(((P0 *)_this)->i, 10) ] = trpt->bup.oval;
		;
		goto R999;

	case 37: // STATE 16
		;
		now.next[ Index(((P0 *)_this)->item, 10) ] = trpt->bup.oval;
		;
		goto R999;

	case 38: // STATE 19
		;
		now.size = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 40: // STATE 24
		;
		p_restor(II);
		;
		;
		goto R999;
	}

