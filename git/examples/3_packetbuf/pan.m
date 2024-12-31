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

		 /* CLAIM no_continuous_overflow */
	case 3: // STATE 1 - _spin_nvr.tmp:21 - [(!(!(critical_error)))] (6:0:0 - 1)
		
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
		if (!( !( !(((int)now.critical_error)))))
			continue;
		/* merge: assert(!(!(!(critical_error))))(0, 2, 6) */
		reached[7][2] = 1;
		spin_assert( !( !( !(((int)now.critical_error)))), " !( !( !(critical_error)))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[7][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 4: // STATE 10 - _spin_nvr.tmp:26 - [-end-] (0:0:0 - 1)
		
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

		 /* CLAIM buffer_size_invariant */
	case 5: // STATE 1 - _spin_nvr.tmp:12 - [(!((buflen<=128)))] (6:0:0 - 1)
		
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
		reached[6][1] = 1;
		if (!( !((now.buflen<=128))))
			continue;
		/* merge: assert(!(!((buflen<=128))))(0, 2, 6) */
		reached[6][2] = 1;
		spin_assert( !( !((now.buflen<=128))), " !( !((buflen<=128)))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[6][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 6: // STATE 10 - _spin_nvr.tmp:17 - [-end-] (0:0:0 - 1)
		
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
		reached[6][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM packet_flow_safety */
	case 7: // STATE 1 - _spin_nvr.tmp:3 - [(!(((packet_count<=10)&&!(critical_error))))] (6:0:0 - 1)
		
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
		reached[5][1] = 1;
		if (!( !(((now.packet_count<=10)&& !(((int)now.critical_error))))))
			continue;
		/* merge: assert(!(!(((packet_count<=10)&&!(critical_error)))))(0, 2, 6) */
		reached[5][2] = 1;
		spin_assert( !( !(((now.packet_count<=10)&& !(((int)now.critical_error))))), " !( !(((packet_count<=10)&& !(critical_error))))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[5][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 8: // STATE 10 - _spin_nvr.tmp:8 - [-end-] (0:0:0 - 1)
		
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
		reached[5][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 9: // STATE 1 - final2.pml:164 - [choice = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[4][1] = 1;
		(trpt+1)->bup.oval = ((P4 *)_this)->_7_5_choice;
		((P4 *)_this)->_7_5_choice = 0;
#ifdef VAR_RANGES
		logval(":init::choice", ((P4 *)_this)->_7_5_choice);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 2 - final2.pml:165 - [choice = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[4][2] = 1;
		(trpt+1)->bup.oval = ((P4 *)_this)->_7_5_choice;
		((P4 *)_this)->_7_5_choice = 0;
#ifdef VAR_RANGES
		logval(":init::choice", ((P4 *)_this)->_7_5_choice);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 3 - final2.pml:166 - [(run packetbuf_clear())] (0:0:0 - 1)
		IfNotBlocked
		reached[4][3] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 4 - final2.pml:167 - [(run packetbuf_attr_clear())] (0:0:0 - 1)
		IfNotBlocked
		reached[4][4] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 5 - final2.pml:168 - [(run packetbuf_copyfrom())] (0:0:0 - 1)
		IfNotBlocked
		reached[4][5] = 1;
		if (!(addproc(II, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 6 - final2.pml:169 - [choice = 1] (0:0:2 - 1)
		IfNotBlocked
		reached[4][6] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P4 *)_this)->_7_5_choice;
		((P4 *)_this)->_7_5_choice = 1;
#ifdef VAR_RANGES
		logval(":init::choice", ((P4 *)_this)->_7_5_choice);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: _7_5_choice */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P4 *)_this)->_7_5_choice = 0;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 7 - final2.pml:170 - [(run packetbuf_clear())] (0:0:0 - 1)
		IfNotBlocked
		reached[4][7] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 8 - final2.pml:171 - [(run packetbuf_hdralloc())] (0:0:0 - 1)
		IfNotBlocked
		reached[4][8] = 1;
		if (!(addproc(II, 1, 3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 9 - final2.pml:172 - [(run packetbuf_copyfrom())] (0:0:0 - 1)
		IfNotBlocked
		reached[4][9] = 1;
		if (!(addproc(II, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 10 - final2.pml:173 - [choice = 2] (0:0:2 - 1)
		IfNotBlocked
		reached[4][10] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P4 *)_this)->_7_5_choice;
		((P4 *)_this)->_7_5_choice = 2;
#ifdef VAR_RANGES
		logval(":init::choice", ((P4 *)_this)->_7_5_choice);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: _7_5_choice */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P4 *)_this)->_7_5_choice = 0;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 11 - final2.pml:174 - [(run packetbuf_attr_clear())] (0:0:0 - 1)
		IfNotBlocked
		reached[4][11] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 12 - final2.pml:175 - [(run packetbuf_copyfrom())] (0:0:0 - 1)
		IfNotBlocked
		reached[4][12] = 1;
		if (!(addproc(II, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 13 - final2.pml:176 - [(run packetbuf_hdralloc())] (0:0:0 - 1)
		IfNotBlocked
		reached[4][13] = 1;
		if (!(addproc(II, 1, 3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 20 - final2.pml:180 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[4][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC packetbuf_hdralloc */
	case 23: // STATE 1 - final2.pml:135 - [size = 5] (0:0:1 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		(trpt+1)->bup.oval = ((P3 *)_this)->size;
		((P3 *)_this)->size = 5;
#ifdef VAR_RANGES
		logval("packetbuf_hdralloc:size", ((P3 *)_this)->size);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 2 - final2.pml:136 - [size = 10] (0:0:1 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		(trpt+1)->bup.oval = ((P3 *)_this)->size;
		((P3 *)_this)->size = 10;
#ifdef VAR_RANGES
		logval("packetbuf_hdralloc:size", ((P3 *)_this)->size);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 3 - final2.pml:137 - [size = 20] (0:0:1 - 1)
		IfNotBlocked
		reached[3][3] = 1;
		(trpt+1)->bup.oval = ((P3 *)_this)->size;
		((P3 *)_this)->size = 20;
#ifdef VAR_RANGES
		logval("packetbuf_hdralloc:size", ((P3 *)_this)->size);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 4 - final2.pml:138 - [size = 50] (0:0:1 - 1)
		IfNotBlocked
		reached[3][4] = 1;
		(trpt+1)->bup.oval = ((P3 *)_this)->size;
		((P3 *)_this)->size = 50;
#ifdef VAR_RANGES
		logval("packetbuf_hdralloc:size", ((P3 *)_this)->size);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 7 - final2.pml:142 - [((((hdrlen+buflen)+size)>128))] (24:0:3 - 1)
		IfNotBlocked
		reached[3][7] = 1;
		if (!((((now.hdrlen+now.buflen)+((P3 *)_this)->size)>128)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: size */  (trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P3 *)_this)->size;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P3 *)_this)->size = 0;
		/* merge: error_overflow = 1(24, 8, 24) */
		reached[3][8] = 1;
		(trpt+1)->bup.ovals[1] = ((int)error_overflow);
		error_overflow = 1;
#ifdef VAR_RANGES
		logval("error_overflow", ((int)error_overflow));
#endif
		;
		/* merge: critical_error = 1(24, 9, 24) */
		reached[3][9] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.critical_error);
		now.critical_error = 1;
#ifdef VAR_RANGES
		logval("critical_error", ((int)now.critical_error));
#endif
		;
		/* merge: .(goto)(24, 22, 24) */
		reached[3][22] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 28: // STATE 22 - final2.pml:157 - [.(goto)] (0:24:0 - 2)
		IfNotBlocked
		reached[3][22] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 11 - final2.pml:148 - [i = ((hdrlen+buflen)-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[3][11] = 1;
		(trpt+1)->bup.oval = ((P3 *)_this)->_6_4_i;
		((P3 *)_this)->_6_4_i = ((now.hdrlen+now.buflen)-1);
#ifdef VAR_RANGES
		logval("packetbuf_hdralloc:i", ((P3 *)_this)->_6_4_i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 12 - final2.pml:149 - [((i>=0))] (17:0:2 - 1)
		IfNotBlocked
		reached[3][12] = 1;
		if (!((((P3 *)_this)->_6_4_i>=0)))
			continue;
		/* merge: packetbuf[(i+size)] = packetbuf[i](17, 13, 17) */
		reached[3][13] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.packetbuf[ Index((((P3 *)_this)->_6_4_i+((P3 *)_this)->size), 128) ]);
		now.packetbuf[ Index((((P3 *)_this)->_6_4_i+((P3 *)_this)->size), 128) ] = ((int)now.packetbuf[ Index(((P3 *)_this)->_6_4_i, 128) ]);
#ifdef VAR_RANGES
		logval("packetbuf[(packetbuf_hdralloc:i+packetbuf_hdralloc:size)]", ((int)now.packetbuf[ Index((((P3 *)_this)->_6_4_i+((P3 *)_this)->size), 128) ]));
#endif
		;
		/* merge: i = (i-1)(17, 14, 17) */
		reached[3][14] = 1;
		(trpt+1)->bup.ovals[1] = ((P3 *)_this)->_6_4_i;
		((P3 *)_this)->_6_4_i = (((P3 *)_this)->_6_4_i-1);
#ifdef VAR_RANGES
		logval("packetbuf_hdralloc:i", ((P3 *)_this)->_6_4_i);
#endif
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[3][18] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 31: // STATE 20 - final2.pml:155 - [hdrlen = (hdrlen+size)] (0:24:1 - 3)
		IfNotBlocked
		reached[3][20] = 1;
		(trpt+1)->bup.oval = now.hdrlen;
		now.hdrlen = (now.hdrlen+((P3 *)_this)->size);
#ifdef VAR_RANGES
		logval("hdrlen", now.hdrlen);
#endif
		;
		/* merge: .(goto)(24, 22, 24) */
		reached[3][22] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 32: // STATE 24 - final2.pml:158 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][24] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC packetbuf_copyfrom */
	case 33: // STATE 1 - final2.pml:80 - [ln = 10] (0:0:1 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->ln;
		((P2 *)_this)->ln = 10;
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:ln", ((P2 *)_this)->ln);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 2 - final2.pml:81 - [ln = 50] (0:0:1 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->ln;
		((P2 *)_this)->ln = 50;
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:ln", ((P2 *)_this)->ln);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 3 - final2.pml:82 - [ln = 100] (0:0:1 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->ln;
		((P2 *)_this)->ln = 100;
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:ln", ((P2 *)_this)->ln);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 4 - final2.pml:83 - [ln = 128] (0:0:1 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->ln;
		((P2 *)_this)->ln = 128;
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:ln", ((P2 *)_this)->ln);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 7 - final2.pml:87 - [((packet_count>=10))] (47:0:2 - 1)
		IfNotBlocked
		reached[2][7] = 1;
		if (!((now.packet_count>=10)))
			continue;
		/* merge: error_overflow = 1(47, 8, 47) */
		reached[2][8] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)error_overflow);
		error_overflow = 1;
#ifdef VAR_RANGES
		logval("error_overflow", ((int)error_overflow));
#endif
		;
		/* merge: critical_error = 1(47, 9, 47) */
		reached[2][9] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.critical_error);
		now.critical_error = 1;
#ifdef VAR_RANGES
		logval("critical_error", ((int)now.critical_error));
#endif
		;
		/* merge: .(goto)(47, 45, 47) */
		reached[2][45] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 38: // STATE 45 - final2.pml:125 - [.(goto)] (0:47:0 - 2)
		IfNotBlocked
		reached[2][45] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 11 - final2.pml:91 - [(run packetbuf_clear())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][11] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 12 - final2.pml:95 - [((ln<=128))] (19:0:1 - 1)
		IfNotBlocked
		reached[2][12] = 1;
		if (!((((P2 *)_this)->ln<=128)))
			continue;
		/* merge: i = 0(0, 13, 19) */
		reached[2][13] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->_5_3_i;
		((P2 *)_this)->_5_3_i = 0;
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:i", ((P2 *)_this)->_5_3_i);
#endif
		;
		/* merge: .(goto)(0, 20, 19) */
		reached[2][20] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 41: // STATE 14 - final2.pml:98 - [((i<ln))] (19:0:2 - 1)
		IfNotBlocked
		reached[2][14] = 1;
		if (!((((P2 *)_this)->_5_3_i<((P2 *)_this)->ln)))
			continue;
		/* merge: from[i] = ((i*13)%256)(19, 15, 19) */
		reached[2][15] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P2 *)_this)->from[ Index(((P2 *)_this)->_5_3_i, 128) ]);
		((P2 *)_this)->from[ Index(((P2 *)_this)->_5_3_i, 128) ] = ((((P2 *)_this)->_5_3_i*13)%256);
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:from[packetbuf_copyfrom:i]", ((int)((P2 *)_this)->from[ Index(((P2 *)_this)->_5_3_i, 128) ]));
#endif
		;
		/* merge: i = (i+1)(19, 16, 19) */
		reached[2][16] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->_5_3_i;
		((P2 *)_this)->_5_3_i = (((P2 *)_this)->_5_3_i+1);
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:i", ((P2 *)_this)->_5_3_i);
#endif
		;
		/* merge: .(goto)(0, 20, 19) */
		reached[2][20] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 42: // STATE 22 - final2.pml:106 - [(((buflen+ln)>128))] (47:0:3 - 1)
		IfNotBlocked
		reached[2][22] = 1;
		if (!(((now.buflen+((P2 *)_this)->ln)>128)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: ln */  (trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->ln;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->ln = 0;
		/* merge: error_overflow = 1(47, 23, 47) */
		reached[2][23] = 1;
		(trpt+1)->bup.ovals[1] = ((int)error_overflow);
		error_overflow = 1;
#ifdef VAR_RANGES
		logval("error_overflow", ((int)error_overflow));
#endif
		;
		/* merge: critical_error = 1(47, 24, 47) */
		reached[2][24] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.critical_error);
		now.critical_error = 1;
#ifdef VAR_RANGES
		logval("critical_error", ((int)now.critical_error));
#endif
		;
		/* merge: .(goto)(47, 38, 47) */
		reached[2][38] = 1;
		;
		/* merge: .(goto)(47, 43, 47) */
		reached[2][43] = 1;
		;
		/* merge: .(goto)(47, 45, 47) */
		reached[2][45] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 43: // STATE 26 - final2.pml:111 - [j = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][26] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->_5_3_j;
		((P2 *)_this)->_5_3_j = 0;
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:j", ((P2 *)_this)->_5_3_j);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 44: // STATE 27 - final2.pml:112 - [((j<ln))] (32:0:2 - 1)
		IfNotBlocked
		reached[2][27] = 1;
		if (!((((P2 *)_this)->_5_3_j<((P2 *)_this)->ln)))
			continue;
		/* merge: packetbuf[j] = from[j](32, 28, 32) */
		reached[2][28] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.packetbuf[ Index(((P2 *)_this)->_5_3_j, 128) ]);
		now.packetbuf[ Index(((P2 *)_this)->_5_3_j, 128) ] = ((int)((P2 *)_this)->from[ Index(((P2 *)_this)->_5_3_j, 128) ]);
#ifdef VAR_RANGES
		logval("packetbuf[packetbuf_copyfrom:j]", ((int)now.packetbuf[ Index(((P2 *)_this)->_5_3_j, 128) ]));
#endif
		;
		/* merge: j = (j+1)(32, 29, 32) */
		reached[2][29] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->_5_3_j;
		((P2 *)_this)->_5_3_j = (((P2 *)_this)->_5_3_j+1);
#ifdef VAR_RANGES
		logval("packetbuf_copyfrom:j", ((P2 *)_this)->_5_3_j);
#endif
		;
		/* merge: .(goto)(0, 33, 32) */
		reached[2][33] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 45: // STATE 35 - final2.pml:117 - [buflen = ln] (0:47:2 - 3)
		IfNotBlocked
		reached[2][35] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.buflen;
		now.buflen = ((P2 *)_this)->ln;
#ifdef VAR_RANGES
		logval("buflen", now.buflen);
#endif
		;
		/* merge: packet_count = (packet_count+1)(47, 36, 47) */
		reached[2][36] = 1;
		(trpt+1)->bup.ovals[1] = now.packet_count;
		now.packet_count = (now.packet_count+1);
#ifdef VAR_RANGES
		logval("packet_count", now.packet_count);
#endif
		;
		/* merge: .(goto)(47, 38, 47) */
		reached[2][38] = 1;
		;
		/* merge: .(goto)(47, 43, 47) */
		reached[2][43] = 1;
		;
		/* merge: .(goto)(47, 45, 47) */
		reached[2][45] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 46: // STATE 43 - final2.pml:124 - [.(goto)] (0:47:0 - 4)
		IfNotBlocked
		reached[2][43] = 1;
		;
		/* merge: .(goto)(47, 45, 47) */
		reached[2][45] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 47: // STATE 40 - final2.pml:121 - [error_overflow = 1] (0:47:2 - 1)
		IfNotBlocked
		reached[2][40] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)error_overflow);
		error_overflow = 1;
#ifdef VAR_RANGES
		logval("error_overflow", ((int)error_overflow));
#endif
		;
		/* merge: critical_error = 1(47, 41, 47) */
		reached[2][41] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.critical_error);
		now.critical_error = 1;
#ifdef VAR_RANGES
		logval("critical_error", ((int)now.critical_error));
#endif
		;
		/* merge: .(goto)(47, 43, 47) */
		reached[2][43] = 1;
		;
		/* merge: .(goto)(47, 45, 47) */
		reached[2][45] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 48: // STATE 47 - final2.pml:126 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][47] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC packetbuf_clear */
	case 49: // STATE 1 - final2.pml:65 - [buflen = 0] (0:4:3 - 1)
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
		(trpt+1)->bup.ovals[1] = bufptr;
		bufptr = 0;
#ifdef VAR_RANGES
		logval("bufptr", bufptr);
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
	case 50: // STATE 4 - final2.pml:68 - [(run packetbuf_attr_clear())] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 51: // STATE 6 - final2.pml:70 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC packetbuf_attr_clear */
	case 52: // STATE 1 - final2.pml:34 - [i = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->_3_1_i;
		((P0 *)_this)->_3_1_i = 0;
#ifdef VAR_RANGES
		logval("packetbuf_attr_clear:i", ((P0 *)_this)->_3_1_i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 53: // STATE 2 - final2.pml:35 - [((i<16))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((P0 *)_this)->_3_1_i<16)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 3 - final2.pml:38 - [packetbuf_attrs[i].val = 0] (0:11:3 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].val;
		now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].val = 0;
#ifdef VAR_RANGES
		logval("packetbuf_attrs[packetbuf_attr_clear:i].val", now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].val);
#endif
		;
		/* merge: .(goto)(11, 6, 11) */
		reached[0][6] = 1;
		;
		/* merge: packetbuf_attrs[i].is_critical = ((i%2)==0)(11, 7, 11) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].is_critical);
		now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].is_critical = ((((P0 *)_this)->_3_1_i%2)==0);
#ifdef VAR_RANGES
		logval("packetbuf_attrs[packetbuf_attr_clear:i].is_critical", ((int)now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].is_critical));
#endif
		;
		/* merge: i = (i+1)(11, 8, 11) */
		reached[0][8] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->_3_1_i;
		((P0 *)_this)->_3_1_i = (((P0 *)_this)->_3_1_i+1);
#ifdef VAR_RANGES
		logval("packetbuf_attr_clear:i", ((P0 *)_this)->_3_1_i);
#endif
		;
		/* merge: .(goto)(0, 12, 11) */
		reached[0][12] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 55: // STATE 4 - final2.pml:39 - [packetbuf_attrs[i].val = ((i*10)%255)] (0:11:3 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].val;
		now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].val = ((((P0 *)_this)->_3_1_i*10)%255);
#ifdef VAR_RANGES
		logval("packetbuf_attrs[packetbuf_attr_clear:i].val", now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].val);
#endif
		;
		/* merge: .(goto)(11, 6, 11) */
		reached[0][6] = 1;
		;
		/* merge: packetbuf_attrs[i].is_critical = ((i%2)==0)(11, 7, 11) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].is_critical);
		now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].is_critical = ((((P0 *)_this)->_3_1_i%2)==0);
#ifdef VAR_RANGES
		logval("packetbuf_attrs[packetbuf_attr_clear:i].is_critical", ((int)now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].is_critical));
#endif
		;
		/* merge: i = (i+1)(11, 8, 11) */
		reached[0][8] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->_3_1_i;
		((P0 *)_this)->_3_1_i = (((P0 *)_this)->_3_1_i+1);
#ifdef VAR_RANGES
		logval("packetbuf_attr_clear:i", ((P0 *)_this)->_3_1_i);
#endif
		;
		/* merge: .(goto)(0, 12, 11) */
		reached[0][12] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 56: // STATE 7 - final2.pml:41 - [packetbuf_attrs[i].is_critical = ((i%2)==0)] (0:11:2 - 3)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].is_critical);
		now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].is_critical = ((((P0 *)_this)->_3_1_i%2)==0);
#ifdef VAR_RANGES
		logval("packetbuf_attrs[packetbuf_attr_clear:i].is_critical", ((int)now.packetbuf_attrs[ Index(((P0 *)_this)->_3_1_i, 16) ].is_critical));
#endif
		;
		/* merge: i = (i+1)(11, 8, 11) */
		reached[0][8] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->_3_1_i;
		((P0 *)_this)->_3_1_i = (((P0 *)_this)->_3_1_i+1);
#ifdef VAR_RANGES
		logval("packetbuf_attr_clear:i", ((P0 *)_this)->_3_1_i);
#endif
		;
		/* merge: .(goto)(0, 12, 11) */
		reached[0][12] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 57: // STATE 14 - final2.pml:46 - [i = 0] (0:25:1 - 3)
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->_3_1_i;
		((P0 *)_this)->_3_1_i = 0;
#ifdef VAR_RANGES
		logval("packetbuf_attr_clear:i", ((P0 *)_this)->_3_1_i);
#endif
		;
		/* merge: .(goto)(0, 26, 25) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 58: // STATE 15 - final2.pml:48 - [((i<8))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][15] = 1;
		if (!((((P0 *)_this)->_3_1_i<8)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 59: // STATE 16 - final2.pml:51 - [packetbuf_addrs[i].addr = 0] (0:25:4 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].addr;
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].addr = 0;
#ifdef VAR_RANGES
		logval("packetbuf_addrs[packetbuf_attr_clear:i].addr", now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].addr);
#endif
		;
		/* merge: .(goto)(25, 19, 25) */
		reached[0][19] = 1;
		;
		/* merge: packetbuf_addrs[i].is_null = ((i%3)==0)(25, 20, 25) */
		reached[0][20] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null);
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null = ((((P0 *)_this)->_3_1_i%3)==0);
#ifdef VAR_RANGES
		logval("packetbuf_addrs[packetbuf_attr_clear:i].is_null", ((int)now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null));
#endif
		;
		/* merge: packetbuf_addrs[i].is_valid = ((i%2)==1)(25, 21, 25) */
		reached[0][21] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_valid);
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_valid = ((((P0 *)_this)->_3_1_i%2)==1);
#ifdef VAR_RANGES
		logval("packetbuf_addrs[packetbuf_attr_clear:i].is_valid", ((int)now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_valid));
#endif
		;
		/* merge: i = (i+1)(25, 22, 25) */
		reached[0][22] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)_this)->_3_1_i;
		((P0 *)_this)->_3_1_i = (((P0 *)_this)->_3_1_i+1);
#ifdef VAR_RANGES
		logval("packetbuf_attr_clear:i", ((P0 *)_this)->_3_1_i);
#endif
		;
		/* merge: .(goto)(0, 26, 25) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 60: // STATE 17 - final2.pml:52 - [packetbuf_addrs[i].addr = ((i*17)%1024)] (0:25:4 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].addr;
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].addr = ((((P0 *)_this)->_3_1_i*17)%1024);
#ifdef VAR_RANGES
		logval("packetbuf_addrs[packetbuf_attr_clear:i].addr", now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].addr);
#endif
		;
		/* merge: .(goto)(25, 19, 25) */
		reached[0][19] = 1;
		;
		/* merge: packetbuf_addrs[i].is_null = ((i%3)==0)(25, 20, 25) */
		reached[0][20] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null);
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null = ((((P0 *)_this)->_3_1_i%3)==0);
#ifdef VAR_RANGES
		logval("packetbuf_addrs[packetbuf_attr_clear:i].is_null", ((int)now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null));
#endif
		;
		/* merge: packetbuf_addrs[i].is_valid = ((i%2)==1)(25, 21, 25) */
		reached[0][21] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_valid);
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_valid = ((((P0 *)_this)->_3_1_i%2)==1);
#ifdef VAR_RANGES
		logval("packetbuf_addrs[packetbuf_attr_clear:i].is_valid", ((int)now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_valid));
#endif
		;
		/* merge: i = (i+1)(25, 22, 25) */
		reached[0][22] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)_this)->_3_1_i;
		((P0 *)_this)->_3_1_i = (((P0 *)_this)->_3_1_i+1);
#ifdef VAR_RANGES
		logval("packetbuf_attr_clear:i", ((P0 *)_this)->_3_1_i);
#endif
		;
		/* merge: .(goto)(0, 26, 25) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 61: // STATE 20 - final2.pml:54 - [packetbuf_addrs[i].is_null = ((i%3)==0)] (0:25:3 - 3)
		IfNotBlocked
		reached[0][20] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null);
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null = ((((P0 *)_this)->_3_1_i%3)==0);
#ifdef VAR_RANGES
		logval("packetbuf_addrs[packetbuf_attr_clear:i].is_null", ((int)now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_null));
#endif
		;
		/* merge: packetbuf_addrs[i].is_valid = ((i%2)==1)(25, 21, 25) */
		reached[0][21] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_valid);
		now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_valid = ((((P0 *)_this)->_3_1_i%2)==1);
#ifdef VAR_RANGES
		logval("packetbuf_addrs[packetbuf_attr_clear:i].is_valid", ((int)now.packetbuf_addrs[ Index(((P0 *)_this)->_3_1_i, 8) ].is_valid));
#endif
		;
		/* merge: i = (i+1)(25, 22, 25) */
		reached[0][22] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->_3_1_i;
		((P0 *)_this)->_3_1_i = (((P0 *)_this)->_3_1_i+1);
#ifdef VAR_RANGES
		logval("packetbuf_attr_clear:i", ((P0 *)_this)->_3_1_i);
#endif
		;
		/* merge: .(goto)(0, 26, 25) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 62: // STATE 29 - final2.pml:60 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][29] = 1;
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

