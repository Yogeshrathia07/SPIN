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

		 /* CLAIM valid_copyto */
	case 3: // STATE 1 - _spin_nvr.tmp:21 - [((!(!(((hdrlen+buflen)<=128)))&&!((((bufptr+hdrlen)+buflen)>0))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[9][1] = 1;
		if (!(( !( !(((now.hdrlen+now.buflen)<=128)))&& !((((now.bufptr+now.hdrlen)+now.buflen)>0)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 8 - _spin_nvr.tmp:26 - [(!((((bufptr+hdrlen)+buflen)>0)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[9][8] = 1;
		if (!( !((((now.bufptr+now.hdrlen)+now.buflen)>0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 13 - _spin_nvr.tmp:28 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[9][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM header_allocation_reduction */
	case 6: // STATE 1 - _spin_nvr.tmp:12 - [(!((!(header_allocated)||(334>0))))] (6:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[8][1] = 1;
		if (!( !(( !(((int)now.header_allocated))||(334>0)))))
			continue;
		/* merge: assert(!(!((!(header_allocated)||(334>0)))))(0, 2, 6) */
		reached[8][2] = 1;
		spin_assert( !( !(( !(((int)now.header_allocated))||(334>0)))), " !( !(( !(header_allocated)||(334>0))))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[8][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 7: // STATE 10 - _spin_nvr.tmp:17 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[8][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM buffer_safety */
	case 8: // STATE 1 - _spin_nvr.tmp:3 - [(!(((hdrlen+buflen)<=128)))] (6:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[7][1] = 1;
		if (!( !(((now.hdrlen+now.buflen)<=128))))
			continue;
		/* merge: assert(!(!(((hdrlen+buflen)<=128))))(0, 2, 6) */
		reached[7][2] = 1;
		spin_assert( !( !(((now.hdrlen+now.buflen)<=128))), " !( !(((hdrlen+buflen)<=128)))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[7][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 9: // STATE 10 - _spin_nvr.tmp:8 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[7][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 10: // STATE 1 - 4.pml:163 - [(run packetbuf_hdralloc())] (0:0:0 - 1)
		IfNotBlocked
		reached[6][1] = 1;
		if (!(addproc(II, 1, 4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 2 - 4.pml:164 - [(run packetbuf_hdrreduce())] (0:0:0 - 1)
		IfNotBlocked
		reached[6][2] = 1;
		if (!(addproc(II, 1, 5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 3 - 4.pml:165 - [(run packetbuf_copyfrom())] (0:0:0 - 1)
		IfNotBlocked
		reached[6][3] = 1;
		if (!(addproc(II, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 4 - 4.pml:166 - [(run packetbuf_copyto())] (0:0:0 - 1)
		IfNotBlocked
		reached[6][4] = 1;
		if (!(addproc(II, 1, 3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 10 - 4.pml:170 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[6][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC packetbuf_hdrreduce */
	case 15: // STATE 1 - 4.pml:144 - [((buflen>=size))] (11:0:5 - 1)
		IfNotBlocked
		reached[5][1] = 1;
		if (!((now.buflen>=((P5 *)_this)->size)))
			continue;
		/* merge: bufptr = (bufptr+size)(11, 2, 11) */
		reached[5][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = now.bufptr;
		now.bufptr = (now.bufptr+((P5 *)_this)->size);
#ifdef VAR_RANGES
		logval("bufptr", now.bufptr);
#endif
		;
		/* merge: buflen = (buflen-size)(11, 3, 11) */
		reached[5][3] = 1;
		(trpt+1)->bup.ovals[1] = now.buflen;
		now.buflen = (now.buflen-((P5 *)_this)->size);
#ifdef VAR_RANGES
		logval("buflen", now.buflen);
#endif
		;
		/* merge: result = 1(11, 4, 11) */
		reached[5][4] = 1;
		(trpt+1)->bup.ovals[2] = ((P5 *)_this)->result;
		((P5 *)_this)->result = 1;
#ifdef VAR_RANGES
		logval("packetbuf_hdrreduce:result", ((P5 *)_this)->result);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: result */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P5 *)_this)->result = 0;
		/* merge: total_header_reductions = (total_header_reductions+1)(11, 5, 11) */
		reached[5][5] = 1;
		(trpt+1)->bup.ovals[3] = now.total_header_reductions;
		now.total_header_reductions = (now.total_header_reductions+1);
#ifdef VAR_RANGES
		logval("total_header_reductions", now.total_header_reductions);
#endif
		;
		/* merge: .(goto)(11, 9, 11) */
		reached[5][9] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 16: // STATE 9 - 4.pml:152 - [.(goto)] (0:11:0 - 2)
		IfNotBlocked
		reached[5][9] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 7 - 4.pml:150 - [result = 0] (0:11:1 - 1)
		IfNotBlocked
		reached[5][7] = 1;
		(trpt+1)->bup.oval = ((P5 *)_this)->result;
		((P5 *)_this)->result = 0;
#ifdef VAR_RANGES
		logval("packetbuf_hdrreduce:result", ((P5 *)_this)->result);
#endif
		;
		/* merge: .(goto)(11, 9, 11) */
		reached[5][9] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 18: // STATE 11 - 4.pml:153 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[5][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC packetbuf_hdralloc */
	case 19: // STATE 1 - 4.pml:119 - [i = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[4][1] = 1;
		(trpt+1)->bup.oval = ((P4 *)_this)->_7_5_i;
		((P4 *)_this)->_7_5_i = 0;
#ifdef VAR_RANGES
		logval("packetbuf_hdralloc:i", ((P4 *)_this)->_7_5_i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 2 - 4.pml:120 - [((((hdrlen+buflen)+size)>128))] (21:0:2 - 1)
		IfNotBlocked
		reached[4][2] = 1;
		if (!((((now.hdrlen+now.buflen)+((P4 *)_this)->size)>128)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: size */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P4 *)_this)->size;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P4 *)_this)->size = 0;
		/* merge: result = 0(21, 3, 21) */
		reached[4][3] = 1;
		(trpt+1)->bup.ovals[1] = ((P4 *)_this)->result;
		((P4 *)_this)->result = 0;
#ifdef VAR_RANGES
		logval("packetbuf_hdralloc:result", ((P4 *)_this)->result);
#endif
		;
		/* merge: .(goto)(21, 19, 21) */
		reached[4][19] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 21: // STATE 19 - 4.pml:135 - [.(goto)] (0:21:0 - 2)
		IfNotBlocked
		reached[4][19] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 5 - 4.pml:122 - [i = ((hdrlen+buflen)-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[4][5] = 1;
		(trpt+1)->bup.oval = ((P4 *)_this)->_7_5_i;
		((P4 *)_this)->_7_5_i = ((now.hdrlen+now.buflen)-1);
#ifdef VAR_RANGES
		logval("packetbuf_hdralloc:i", ((P4 *)_this)->_7_5_i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 6 - 4.pml:124 - [((i>=0))] (11:0:2 - 1)
		IfNotBlocked
		reached[4][6] = 1;
		if (!((((P4 *)_this)->_7_5_i>=0)))
			continue;
		/* merge: packetbuf[(i+size)] = packetbuf[i](11, 7, 11) */
		reached[4][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.packetbuf[ Index((((P4 *)_this)->_7_5_i+((P4 *)_this)->size), 128) ]);
		now.packetbuf[ Index((((P4 *)_this)->_7_5_i+((P4 *)_this)->size), 128) ] = ((int)now.packetbuf[ Index(((P4 *)_this)->_7_5_i, 128) ]);
#ifdef VAR_RANGES
		logval("packetbuf[(packetbuf_hdralloc:i+packetbuf_hdralloc:size)]", ((int)now.packetbuf[ Index((((P4 *)_this)->_7_5_i+((P4 *)_this)->size), 128) ]));
#endif
		;
		/* merge: i = (i-1)(11, 8, 11) */
		reached[4][8] = 1;
		(trpt+1)->bup.ovals[1] = ((P4 *)_this)->_7_5_i;
		((P4 *)_this)->_7_5_i = (((P4 *)_this)->_7_5_i-1);
#ifdef VAR_RANGES
		logval("packetbuf_hdralloc:i", ((P4 *)_this)->_7_5_i);
#endif
		;
		/* merge: .(goto)(0, 12, 11) */
		reached[4][12] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 24: // STATE 14 - 4.pml:130 - [hdrlen = (hdrlen+size)] (0:21:5 - 3)
		IfNotBlocked
		reached[4][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = now.hdrlen;
		now.hdrlen = (now.hdrlen+((P4 *)_this)->size);
#ifdef VAR_RANGES
		logval("hdrlen", now.hdrlen);
#endif
		;
		/* merge: result = 1(21, 15, 21) */
		reached[4][15] = 1;
		(trpt+1)->bup.ovals[1] = ((P4 *)_this)->result;
		((P4 *)_this)->result = 1;
#ifdef VAR_RANGES
		logval("packetbuf_hdralloc:result", ((P4 *)_this)->result);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: result */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P4 *)_this)->result = 0;
		/* merge: header_allocated = 1(21, 16, 21) */
		reached[4][16] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.header_allocated);
		now.header_allocated = 1;
#ifdef VAR_RANGES
		logval("header_allocated", ((int)now.header_allocated));
#endif
		;
		/* merge: total_header_allocations = (total_header_allocations+1)(21, 17, 21) */
		reached[4][17] = 1;
		(trpt+1)->bup.ovals[3] = total_header_allocations;
		total_header_allocations = (total_header_allocations+1);
#ifdef VAR_RANGES
		logval("total_header_allocations", total_header_allocations);
#endif
		;
		/* merge: .(goto)(21, 19, 21) */
		reached[4][19] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 25: // STATE 21 - 4.pml:136 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[4][21] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC packetbuf_copyto */
	case 26: // STATE 1 - 4.pml:89 - [(((hdrlen+buflen)>128))] (27:0:1 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		if (!(((now.hdrlen+now.buflen)>128)))
			continue;
		/* merge: result = 0(27, 2, 27) */
		reached[3][2] = 1;
		(trpt+1)->bup.oval = ((P3 *)_this)->result;
		((P3 *)_this)->result = 0;
#ifdef VAR_RANGES
		logval("packetbuf_copyto:result", ((P3 *)_this)->result);
#endif
		;
		/* merge: .(goto)(27, 25, 27) */
		reached[3][25] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 27: // STATE 25 - 4.pml:110 - [.(goto)] (0:27:0 - 2)
		IfNotBlocked
		reached[3][25] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 4 - 4.pml:92 - [i = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[3][4] = 1;
		(trpt+1)->bup.oval = ((P3 *)_this)->_6_4_i;
		((P3 *)_this)->_6_4_i = 0;
#ifdef VAR_RANGES
		logval("packetbuf_copyto:i", ((P3 *)_this)->_6_4_i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 5 - 4.pml:93 - [((i<hdrlen))] (10:0:2 - 1)
		IfNotBlocked
		reached[3][5] = 1;
		if (!((((P3 *)_this)->_6_4_i<now.hdrlen)))
			continue;
		/* merge: to[i] = packetbuf[i](10, 6, 10) */
		reached[3][6] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P3 *)_this)->to[ Index(((P3 *)_this)->_6_4_i, 128) ]);
		((P3 *)_this)->to[ Index(((P3 *)_this)->_6_4_i, 128) ] = ((int)now.packetbuf[ Index(((P3 *)_this)->_6_4_i, 128) ]);
#ifdef VAR_RANGES
		logval("packetbuf_copyto:to[packetbuf_copyto:i]", ((int)((P3 *)_this)->to[ Index(((P3 *)_this)->_6_4_i, 128) ]));
#endif
		;
		/* merge: i = (i+1)(10, 7, 10) */
		reached[3][7] = 1;
		(trpt+1)->bup.ovals[1] = ((P3 *)_this)->_6_4_i;
		((P3 *)_this)->_6_4_i = (((P3 *)_this)->_6_4_i+1);
#ifdef VAR_RANGES
		logval("packetbuf_copyto:i", ((P3 *)_this)->_6_4_i);
#endif
		;
		/* merge: .(goto)(0, 11, 10) */
		reached[3][11] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 30: // STATE 13 - 4.pml:100 - [j = 0] (0:20:1 - 3)
		IfNotBlocked
		reached[3][13] = 1;
		(trpt+1)->bup.oval = ((P3 *)_this)->_6_4_j;
		((P3 *)_this)->_6_4_j = 0;
#ifdef VAR_RANGES
		logval("packetbuf_copyto:j", ((P3 *)_this)->_6_4_j);
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[3][21] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 31: // STATE 14 - 4.pml:101 - [((j<buflen))] (20:0:3 - 1)
		IfNotBlocked
		reached[3][14] = 1;
		if (!((((P3 *)_this)->_6_4_j<now.buflen)))
			continue;
		/* merge: to[i] = packetbuf[(hdrlen+j)](20, 15, 20) */
		reached[3][15] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P3 *)_this)->to[ Index(((P3 *)_this)->_6_4_i, 128) ]);
		((P3 *)_this)->to[ Index(((P3 *)_this)->_6_4_i, 128) ] = ((int)now.packetbuf[ Index((now.hdrlen+((P3 *)_this)->_6_4_j), 128) ]);
#ifdef VAR_RANGES
		logval("packetbuf_copyto:to[packetbuf_copyto:i]", ((int)((P3 *)_this)->to[ Index(((P3 *)_this)->_6_4_i, 128) ]));
#endif
		;
		/* merge: i = (i+1)(20, 16, 20) */
		reached[3][16] = 1;
		(trpt+1)->bup.ovals[1] = ((P3 *)_this)->_6_4_i;
		((P3 *)_this)->_6_4_i = (((P3 *)_this)->_6_4_i+1);
#ifdef VAR_RANGES
		logval("packetbuf_copyto:i", ((P3 *)_this)->_6_4_i);
#endif
		;
		/* merge: j = (j+1)(20, 17, 20) */
		reached[3][17] = 1;
		(trpt+1)->bup.ovals[2] = ((P3 *)_this)->_6_4_j;
		((P3 *)_this)->_6_4_j = (((P3 *)_this)->_6_4_j+1);
#ifdef VAR_RANGES
		logval("packetbuf_copyto:j", ((P3 *)_this)->_6_4_j);
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[3][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 32: // STATE 23 - 4.pml:108 - [result = (hdrlen+buflen)] (0:27:2 - 3)
		IfNotBlocked
		reached[3][23] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P3 *)_this)->result;
		((P3 *)_this)->result = (now.hdrlen+now.buflen);
#ifdef VAR_RANGES
		logval("packetbuf_copyto:result", ((P3 *)_this)->result);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: result */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P3 *)_this)->result = 0;
		/* merge: .(goto)(27, 25, 27) */
		reached[3][25] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 33: // STATE 27 - 4.pml:111 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][27] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC packetbuf_copyfrom */
	case 34: // STATE 1 - 4.pml:65 - [(run packetbuf_clear())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 2 - 4.pml:68 - [((ln<=128))] (14:0:2 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!((((P2 *)_this)->ln<=128)))
			continue;
		/* merge: l = ln(14, 3, 14) */
		reached[2][3] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->l;
		((P2 *)_this)->l = ((P2 *)_this)->ln;
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:l", ((P2 *)_this)->l);
#endif
		;
		/* merge: .(goto)(14, 7, 14) */
		reached[2][7] = 1;
		;
		/* merge: i = 0(14, 8, 14) */
		reached[2][8] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->_5_3_i;
		((P2 *)_this)->_5_3_i = 0;
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:i", ((P2 *)_this)->_5_3_i);
#endif
		;
		/* merge: .(goto)(0, 15, 14) */
		reached[2][15] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 36: // STATE 5 - 4.pml:69 - [l = 128] (0:14:2 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->l;
		((P2 *)_this)->l = 128;
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:l", ((P2 *)_this)->l);
#endif
		;
		/* merge: .(goto)(14, 7, 14) */
		reached[2][7] = 1;
		;
		/* merge: i = 0(14, 8, 14) */
		reached[2][8] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->_5_3_i;
		((P2 *)_this)->_5_3_i = 0;
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:i", ((P2 *)_this)->_5_3_i);
#endif
		;
		/* merge: .(goto)(0, 15, 14) */
		reached[2][15] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 37: // STATE 8 - 4.pml:73 - [i = 0] (0:14:1 - 3)
		IfNotBlocked
		reached[2][8] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->_5_3_i;
		((P2 *)_this)->_5_3_i = 0;
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:i", ((P2 *)_this)->_5_3_i);
#endif
		;
		/* merge: .(goto)(0, 15, 14) */
		reached[2][15] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 38: // STATE 9 - 4.pml:74 - [((i<l))] (14:0:2 - 1)
		IfNotBlocked
		reached[2][9] = 1;
		if (!((((P2 *)_this)->_5_3_i<((P2 *)_this)->l)))
			continue;
		/* merge: packetbuf[i] = from[i](14, 10, 14) */
		reached[2][10] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.packetbuf[ Index(((P2 *)_this)->_5_3_i, 128) ]);
		now.packetbuf[ Index(((P2 *)_this)->_5_3_i, 128) ] = ((int)((P2 *)_this)->from[ Index(((P2 *)_this)->_5_3_i, 128) ]);
#ifdef VAR_RANGES
		logval("packetbuf[packetbuf_copyfrom:i]", ((int)now.packetbuf[ Index(((P2 *)_this)->_5_3_i, 128) ]));
#endif
		;
		/* merge: i = (i+1)(14, 11, 14) */
		reached[2][11] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->_5_3_i;
		((P2 *)_this)->_5_3_i = (((P2 *)_this)->_5_3_i+1);
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:i", ((P2 *)_this)->_5_3_i);
#endif
		;
		/* merge: .(goto)(0, 15, 14) */
		reached[2][15] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 39: // STATE 17 - 4.pml:79 - [buflen = l] (0:0:1 - 1)
		IfNotBlocked
		reached[2][17] = 1;
		(trpt+1)->bup.oval = now.buflen;
		now.buflen = ((P2 *)_this)->l;
#ifdef VAR_RANGES
		logval("buflen", now.buflen);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 19 - 4.pml:81 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][19] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC packetbuf_clear */
	case 41: // STATE 1 - 4.pml:52 - [buflen = 0] (0:4:3 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.buflen;
		now.buflen = 0;
#ifdef VAR_RANGES
		logval("buflen", now.buflen);
#endif
		;
		/* merge: bufptr = 0(4, 2, 4) */
		reached[1][2] = 1;
		(trpt+1)->bup.ovals[1] = now.bufptr;
		now.bufptr = 0;
#ifdef VAR_RANGES
		logval("bufptr", now.bufptr);
#endif
		;
		/* merge: hdrlen = 0(4, 3, 4) */
		reached[1][3] = 1;
		(trpt+1)->bup.ovals[2] = now.hdrlen;
		now.hdrlen = 0;
#ifdef VAR_RANGES
		logval("hdrlen", now.hdrlen);
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 42: // STATE 4 - 4.pml:55 - [(run packetbuf_attr_clear())] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 6 - 4.pml:57 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC packetbuf_attr_clear */
	case 44: // STATE 1 - 4.pml:32 - [i = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->_3_1_i;
		((P0 *)_this)->_3_1_i = 0;
#ifdef VAR_RANGES
		logval("packetbuf_attr_clear:i", ((P0 *)_this)->_3_1_i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 45: // STATE 2 - 4.pml:33 - [((i<16))] (7:0:2 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((P0 *)_this)->_3_1_i<16)))
			continue;
		/* merge: packetbuf_attrs[i].val = 0(7, 3, 7) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].val;
		now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].val = 0;
#ifdef VAR_RANGES
		logval("packetbuf_attrs[packetbuf_attr_clear:i].val", now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].val);
#endif
		;
		/* merge: i = (i+1)(7, 4, 7) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->_3_1_i;
		((P0 *)_this)->_3_1_i = (((P0 *)_this)->_3_1_i+1);
#ifdef VAR_RANGES
		logval("packetbuf_attr_clear:i", ((P0 *)_this)->_3_1_i);
#endif
		;
		/* merge: .(goto)(0, 8, 7) */
		reached[0][8] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 46: // STATE 10 - 4.pml:39 - [i = 0] (0:17:1 - 3)
		IfNotBlocked
		reached[0][10] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->_3_1_i;
		((P0 *)_this)->_3_1_i = 0;
#ifdef VAR_RANGES
		logval("packetbuf_attr_clear:i", ((P0 *)_this)->_3_1_i);
#endif
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[0][18] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 47: // STATE 11 - 4.pml:41 - [((i<8))] (17:0:3 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		if (!((((P0 *)_this)->_3_1_i<8)))
			continue;
		/* merge: packetbuf_addrs[i].addr = 0(17, 12, 17) */
		reached[0][12] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].addr;
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].addr = 0;
#ifdef VAR_RANGES
		logval("packetbuf_addrs[packetbuf_attr_clear:i].addr", now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].addr);
#endif
		;
		/* merge: packetbuf_addrs[i].is_null = 1(17, 13, 17) */
		reached[0][13] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null);
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null = 1;
#ifdef VAR_RANGES
		logval("packetbuf_addrs[packetbuf_attr_clear:i].is_null", ((int)now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null));
#endif
		;
		/* merge: i = (i+1)(17, 14, 17) */
		reached[0][14] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->_3_1_i;
		((P0 *)_this)->_3_1_i = (((P0 *)_this)->_3_1_i+1);
#ifdef VAR_RANGES
		logval("packetbuf_attr_clear:i", ((P0 *)_this)->_3_1_i);
#endif
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[0][18] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 48: // STATE 21 - 4.pml:48 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][21] = 1;
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

