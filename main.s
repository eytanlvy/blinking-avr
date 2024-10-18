.text 				; on rentre dans la section .text
					; elle contient le code du programme
	<instruction 1> ; exemple : ldi r24, 0xff
	<instruction 2>

loop: 				; on définit ici un label « loop »
	rjmp loop 		; on « saute » sur le label « loop »
					; c’est une boucle infinie