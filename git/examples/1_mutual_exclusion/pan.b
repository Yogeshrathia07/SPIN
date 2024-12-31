	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC P2 */

	case 3: // STATE 1
		;
		_m = unsend(now.channel1);
		;
		goto R999;
;
		;
		
	case 5: // STATE 3
		;
		XX = 1;
		unrecv(now.channel1, XX-1, 0, 3, 1);
		;
		;
		goto R999;
;
		
	case 6: // STATE 4
		goto R999;

	case 7: // STATE 5
		;
		XX = 1;
		unrecv(now.channel1, XX-1, 0, 1, 1);
		;
		;
		goto R999;
;
		
	case 8: // STATE 6
		goto R999;
;
		
	case 9: // STATE 9
		goto R999;

	case 10: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC P1 */

	case 11: // STATE 1
		;
		_m = unsend(now.channel1);
		;
		goto R999;
;
		;
		
	case 13: // STATE 3
		;
		XX = 1;
		unrecv(now.channel1, XX-1, 0, 2, 1);
		;
		;
		goto R999;
;
		
	case 14: // STATE 4
		goto R999;

	case 15: // STATE 5
		;
		XX = 1;
		unrecv(now.channel1, XX-1, 0, 1, 1);
		;
		;
		goto R999;
;
		
	case 16: // STATE 6
		goto R999;
;
		
	case 17: // STATE 9
		goto R999;

	case 18: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;
	}

