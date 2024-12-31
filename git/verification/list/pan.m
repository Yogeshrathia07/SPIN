#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - list_c.pml:67 - [(run list_add(1))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		if (!(addproc(II, 1, 0, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - list_c.pml:68 - [(run list_add(2))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		if (!(addproc(II, 1, 0, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - list_c.pml:69 - [(run list_add(3))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][3] = 1;
		if (!(addproc(II, 1, 0, 3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - list_c.pml:70 - [(run list_pop())] (0:0:0 - 1)
		IfNotBlocked
		reached[3][4] = 1;
		if (!(addproc(II, 1, 2, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 5 - list_c.pml:71 - [assert((size==2))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][5] = 1;
		spin_assert((now.size==2), "(size==2)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 6 - list_c.pml:72 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC list_pop */
	case 9: // STATE 1 - list_c.pml:57 - [((head==-(1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!((now.head== -(1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 4 - list_c.pml:60 - [first_item = head] (0:0:1 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->first_item;
		((P2 *)_this)->first_item = now.head;
#ifdef VAR_RANGES
		logval("list_pop:first_item", ((P2 *)_this)->first_item);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 5 - list_c.pml:60 - [head = next[head]] (0:0:1 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		(trpt+1)->bup.oval = now.head;
		now.head = now.next[ Index(now.head, 10) ];
#ifdef VAR_RANGES
		logval("head", now.head);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 6 - list_c.pml:61 - [size = (size-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		(trpt+1)->bup.oval = now.size;
		now.size = (now.size-1);
#ifdef VAR_RANGES
		logval("size", now.size);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 7 - list_c.pml:62 - [printf('Popped item: %d\\n',first_item)] (0:0:0 - 1)
		IfNotBlocked
		reached[2][7] = 1;
		Printf("Popped item: %d\n", ((P2 *)_this)->first_item);
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 10 - list_c.pml:64 - [-end-] (0:0:0 - 3)
		IfNotBlocked
		reached[2][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC list_remove */
	case 15: // STATE 1 - list_c.pml:34 - [((head==-(1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((now.head== -(1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 3 - list_c.pml:35 - [((head==item))] (0:0:1 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (!((now.head==((P1 *)_this)->item)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: item */  (trpt+1)->bup.oval = ((P1 *)_this)->item;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->item = 0;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 4 - list_c.pml:36 - [head = next[head]] (0:0:1 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		(trpt+1)->bup.oval = now.head;
		now.head = now.next[ Index(now.head, 10) ];
#ifdef VAR_RANGES
		logval("head", now.head);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 5 - list_c.pml:37 - [size = (size-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		(trpt+1)->bup.oval = now.size;
		now.size = (now.size-1);
#ifdef VAR_RANGES
		logval("size", now.size);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 7 - list_c.pml:40 - [prev = head] (0:0:1 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->prev;
		((P1 *)_this)->prev = now.head;
#ifdef VAR_RANGES
		logval("list_remove:prev", ((P1 *)_this)->prev);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 8 - list_c.pml:41 - [curr = next[head]] (0:0:1 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->curr;
		((P1 *)_this)->curr = now.next[ Index(now.head, 10) ];
#ifdef VAR_RANGES
		logval("list_remove:curr", ((P1 *)_this)->curr);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 9 - list_c.pml:42 - [((curr==-(1)))] (0:0:1 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		if (!((((P1 *)_this)->curr== -(1))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: curr */  (trpt+1)->bup.oval = ((P1 *)_this)->curr;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->curr = 0;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 11 - list_c.pml:43 - [((curr==item))] (0:0:1 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!((((P1 *)_this)->curr==((P1 *)_this)->item)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: item */  (trpt+1)->bup.oval = ((P1 *)_this)->item;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->item = 0;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 12 - list_c.pml:44 - [next[prev] = next[curr]] (0:0:1 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		(trpt+1)->bup.oval = now.next[ Index(((P1 *)_this)->prev, 10) ];
		now.next[ Index(((P1 *)_this)->prev, 10) ] = now.next[ Index(((P1 *)_this)->curr, 10) ];
#ifdef VAR_RANGES
		logval("next[list_remove:prev]", now.next[ Index(((P1 *)_this)->prev, 10) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 13 - list_c.pml:45 - [size = (size-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		(trpt+1)->bup.oval = now.size;
		now.size = (now.size-1);
#ifdef VAR_RANGES
		logval("size", now.size);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 16 - list_c.pml:48 - [prev = curr] (0:0:1 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->prev;
		((P1 *)_this)->prev = ((P1 *)_this)->curr;
#ifdef VAR_RANGES
		logval("list_remove:prev", ((P1 *)_this)->prev);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 17 - list_c.pml:49 - [curr = next[curr]] (0:0:1 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->curr;
		((P1 *)_this)->curr = now.next[ Index(((P1 *)_this)->curr, 10) ];
#ifdef VAR_RANGES
		logval("list_remove:curr", ((P1 *)_this)->curr);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 23 - list_c.pml:52 - [-end-] (0:0:0 - 8)
		IfNotBlocked
		reached[1][23] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC list_add */
	case 28: // STATE 1 - list_c.pml:9 - [((size<10))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((now.size<10)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 2 - list_c.pml:11 - [(run list_remove(item))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!(addproc(II, 1, 1, ((P0 *)_this)->item)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 3 - list_c.pml:15 - [((head==-(1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!((now.head== -(1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 4 - list_c.pml:16 - [head = item] (0:0:1 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = now.head;
		now.head = ((P0 *)_this)->item;
#ifdef VAR_RANGES
		logval("head", now.head);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 5 - list_c.pml:17 - [next[item] = -(1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		(trpt+1)->bup.oval = now.next[ Index(((P0 *)_this)->item, 10) ];
		now.next[ Index(((P0 *)_this)->item, 10) ] =  -(1);
#ifdef VAR_RANGES
		logval("next[list_add:item]", now.next[ Index(((P0 *)_this)->item, 10) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 7 - list_c.pml:20 - [i = head] (0:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->i;
		((P0 *)_this)->i = now.head;
#ifdef VAR_RANGES
		logval("list_add:i", ((P0 *)_this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 8 - list_c.pml:21 - [((next[i]==-(1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (!((now.next[ Index(((P0 *)_this)->i, 10) ]== -(1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 11 - list_c.pml:22 - [i = next[i]] (0:0:1 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->i;
		((P0 *)_this)->i = now.next[ Index(((P0 *)_this)->i, 10) ];
#ifdef VAR_RANGES
		logval("list_add:i", ((P0 *)_this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 15 - list_c.pml:24 - [next[i] = item] (0:0:1 - 3)
		IfNotBlocked
		reached[0][15] = 1;
		(trpt+1)->bup.oval = now.next[ Index(((P0 *)_this)->i, 10) ];
		now.next[ Index(((P0 *)_this)->i, 10) ] = ((P0 *)_this)->item;
#ifdef VAR_RANGES
		logval("next[list_add:i]", now.next[ Index(((P0 *)_this)->i, 10) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 16 - list_c.pml:25 - [next[item] = -(1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		(trpt+1)->bup.oval = now.next[ Index(((P0 *)_this)->item, 10) ];
		now.next[ Index(((P0 *)_this)->item, 10) ] =  -(1);
#ifdef VAR_RANGES
		logval("next[list_add:item]", now.next[ Index(((P0 *)_this)->item, 10) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 19 - list_c.pml:27 - [size = (size+1)] (0:0:1 - 3)
		IfNotBlocked
		reached[0][19] = 1;
		(trpt+1)->bup.oval = now.size;
		now.size = (now.size+1);
#ifdef VAR_RANGES
		logval("size", now.size);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 21 - list_c.pml:28 - [printf('List is full!\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][21] = 1;
		Printf("List is full!\n");
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 24 - list_c.pml:30 - [-end-] (0:0:0 - 3)
		IfNotBlocked
		reached[0][24] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

