#ifndef N
 #define N	2
#endif
init {	// file: ex_1f.pml
	chan dummy = [N] of { byte } // a message channel of N slots
	do
	:: dummy!100    // send value  85 to the channel
	:: dummy!200   // send value 170 to the channel
	od
}
