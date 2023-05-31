

#include "DriverJeuLaser.h"

extern int DFT_ModuleAuCarre( short int * Signal64ech, char k) ;
extern short int LeSignal;


int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

// Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers
CLOCK_Configure();


	
//============================================================================	

	
/*void DFT_ModuleAuCarre(){
	float reel;
	for (int i=0; i<64; i++){
		reel += signal[i]*tabcos[i];
	}
}*/
	int tab[65];
	int tmp;
while	(1)
	{
		for (int i=0;i<64;i++){
			tmp=DFT_ModuleAuCarre(&LeSignal,i);
			tab[i] = tmp;
		}
	}
}

