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

		 /* PROC P2 */
	case 3: // STATE 1 - example.pml:23 - [channel1!msg2] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (q_len(now.channel1))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.channel1);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.channel1, 0, 2, 1);
		{ boq = now.channel1; };
		_m = 2; goto P999; /* 0 */
	case 4: // STATE 2 - example.pml:24 - [printf('P2: sent msg2.\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		Printf("P2: sent msg2.\n");
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - example.pml:28 - [channel1?msg1] (0:0:0 - 1)
		reached[1][3] = 1;
		if (boq != now.channel1) continue;
		if (q_len(now.channel1) == 0) continue;

		XX=1;
		if (3 != qrecv(now.channel1, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.channel1-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.channel1, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.channel1);
			sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.channel1))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 6: // STATE 4 - example.pml:28 - [printf('P2: received msg1.\\n')] (0:10:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		Printf("P2: received msg1.\n");
		/* merge: .(goto)(10, 8, 10) */
		reached[1][8] = 1;
		;
		/* merge: printf('P2: finished execution.\\n')(10, 9, 10) */
		reached[1][9] = 1;
		Printf("P2: finished execution.\n");
		_m = 3; goto P999; /* 2 */
	case 7: // STATE 5 - example.pml:29 - [channel1?err] (0:0:0 - 1)
		reached[1][5] = 1;
		if (boq != now.channel1) continue;
		if (q_len(now.channel1) == 0) continue;

		XX=1;
		if (1 != qrecv(now.channel1, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.channel1-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.channel1, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.channel1);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.channel1))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 8: // STATE 6 - example.pml:29 - [printf('P2: received error.\\n')] (0:10:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		Printf("P2: received error.\n");
		/* merge: .(goto)(10, 8, 10) */
		reached[1][8] = 1;
		;
		/* merge: printf('P2: finished execution.\\n')(10, 9, 10) */
		reached[1][9] = 1;
		Printf("P2: finished execution.\n");
		_m = 3; goto P999; /* 2 */
	case 9: // STATE 9 - example.pml:33 - [printf('P2: finished execution.\\n')] (0:10:0 - 3)
		IfNotBlocked
		reached[1][9] = 1;
		Printf("P2: finished execution.\n");
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 10 - example.pml:34 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC P1 */
	case 11: // STATE 1 - example.pml:8 - [channel1!msg1] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (q_len(now.channel1))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.channel1);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.channel1, 0, 3, 1);
		{ boq = now.channel1; };
		_m = 2; goto P999; /* 0 */
	case 12: // STATE 2 - example.pml:9 - [printf('P1: sent msg1.\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		Printf("P1: sent msg1.\n");
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 3 - example.pml:13 - [channel1?msg2] (0:0:0 - 1)
		reached[0][3] = 1;
		if (boq != now.channel1) continue;
		if (q_len(now.channel1) == 0) continue;

		XX=1;
		if (2 != qrecv(now.channel1, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.channel1-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.channel1, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.channel1);
			sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.channel1))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 14: // STATE 4 - example.pml:13 - [printf('P1: received msg2.\\n')] (0:10:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		Printf("P1: received msg2.\n");
		/* merge: .(goto)(10, 8, 10) */
		reached[0][8] = 1;
		;
		/* merge: printf('P1: finished execution.\\n')(10, 9, 10) */
		reached[0][9] = 1;
		Printf("P1: finished execution.\n");
		_m = 3; goto P999; /* 2 */
	case 15: // STATE 5 - example.pml:14 - [channel1?err] (0:0:0 - 1)
		reached[0][5] = 1;
		if (boq != now.channel1) continue;
		if (q_len(now.channel1) == 0) continue;

		XX=1;
		if (1 != qrecv(now.channel1, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.channel1-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.channel1, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.channel1);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.channel1))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 16: // STATE 6 - example.pml:14 - [printf('P1: received error.\\n')] (0:10:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		Printf("P1: received error.\n");
		/* merge: .(goto)(10, 8, 10) */
		reached[0][8] = 1;
		;
		/* merge: printf('P1: finished execution.\\n')(10, 9, 10) */
		reached[0][9] = 1;
		Printf("P1: finished execution.\n");
		_m = 3; goto P999; /* 2 */
	case 17: // STATE 9 - example.pml:18 - [printf('P1: finished execution.\\n')] (0:10:0 - 3)
		IfNotBlocked
		reached[0][9] = 1;
		Printf("P1: finished execution.\n");
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 10 - example.pml:19 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][10] = 1;
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

