

#include "DriverJeuLaser.h"

extern void CallbackSon(void);
extern void StartSon(void); 
int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

  
// Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers
CLOCK_Configure();
Active_IT_Debordement_Timer( TIM4, 2, CallbackSon);
Timer_1234_Init_ff( TIM4, 91*72);
Active_IT_Debordement_Timer( TIM2, 1, StartSon);
Timer_1234_Init_ff( TIM2, 72000000);
GPIO_Configure(GPIOB, 0, OUTPUT, ALT_PPULL);
PWM_Init_ff( TIM3, 3, 720);
PWM_Set_Value_TIM3_Ch3(720);

	

//============================================================================	
	
	
while	(1)
	{
	}
}

