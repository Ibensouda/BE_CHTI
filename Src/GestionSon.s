	PRESERVE8
	THUMB   
		
	export CallbackSon
	export StartSon	
	import LongueurSon
	import Son
	import PWM_Set_Value_TIM3_Ch3
	export SortieSon
	include DriverJeuLaser.inc
; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite
		
SortieSon DCW 0		
tab DCD 0
	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici		


;void CallbackSon(){
;	if (index <= LongeurSon) {
;		SortieSon = (son[index]*360)/32768 + 360
;		index++;
;

	
CallbackSon proc
	push {r1,r2,r3,r4,r5,r6,r7}
	ldr r1,=LongueurSon
	ldr r2,=tab
	ldr r3, [r1]
	ldr r4, [r2]
	
;	if (index <= LongeurSon)
	cmp r4, r3
	bgt fin
	ldr r1,=Son
	
;	SortieSon = son[index]
	ldrsh r5, [r1, r4, lsl #1]
;	SortieSon = (son[index]*360)
	mov r6, #360
	mul r5, r6
	
;	SotieSon = SortieSon/32768
	asr r5,#15
	
;	SortieSon = SortieSon + 360
	add r5, #360	
	ldr r1,=SortieSon
	strh r5, [r1]
	push {r0, lr}
	mov r0, r5
	bl PWM_Set_Value_TIM3_Ch3
	pop {r0, lr}
;	index++;
	add r4, #1
	strh r4, [r2]
	
fin
	pop {r1,r2,r3,r4,r5,r6,r7}
	bx	lr
	ENDP
	
StartSon proc
	ldr r1,=tab
	ldr r2, [r1]
	mov r2, #0
	str r2, [r1]
	bx lr
	ENDP

	END
		
	 