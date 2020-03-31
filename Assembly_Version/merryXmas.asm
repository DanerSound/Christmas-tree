.data
# BASE SIMBOLS 
	asterisco: 	.asciiz  "*"	
	newLine:	.asciiz  "\n"
	msg:		.asciiz  " Buon Natale! "
.align 2	
# SETTINGS VARIABILE
	simbolsNum:	.word 	 1, 3, 5, 1
.align 2	

.text
			
	    	 						
main:	    	 	la	$a0, simbolsNum			# il primo riferimento dell'array dei simboli  
			jal 	ArrayLength			 
	    	 	move	$s6, $v1			# recupera lunghezza array
	    	 	 	   	 			
	    	 	 	   	 			# Trova nel vettore delle informazioni di base	
			jal	getMax				# ritorna il massimo in $v1
	    	 	
	    	 	li	$s1, 0				# inizializo il puntatore dell'array a zero  
	    	 	li	$s7, 0				# inizializzo il contatore del ciclo di stampa 
	    	 	jal	printNewLine	
	    	 	
	    	 	la 	$a0, msg
	    	 	jal	findMid				# trova il punto mezzo della stringa 
	    	 	move	$s5, $v1
	    	 	
	    	 	
	    	 	
treePrinter:		beq	$s7, $s6, text			# controllo se sono arrivato alla fine dell'Array
			
			move	$a1, $s5 			# passo il numero di spazi da stampare
			jal	printSpace			# shift the tree view to the center of the text
			
			move	$a0, $v1			# Carico il Massimo Corrente
			jal	calculateSpaces			 
			move	$a1, $v1 			# passo il numero di spazi da stampare
			jal	printSpace			
			
	     	 	lw	$t1, simbolsNum($s1)		# recupero il numero di occorenze da stampare
	      		move	$a1, $t1			
	        	jal	asteriscoPrint			# stampa tanti asterischi quanti specificati da $a0
	     
	        	jal	printNewLine			
	        	
	      		addi	$s7, $s7, 1			# aggiorna il contatore delle ripetizioni del while
	       		addi 	$s1, $s1, 4			# scorre il vettore delle lunghezze
	      			 			
		   	j	treePrinter

text:			li	$v0, 4
			la	$a0, msg
			syscall	
			j  exit	
			
		   	
# getMax: Cacola il valore massimo del vettore contenente i numeri dei simboli da stampare 
# parametri: 		$v1 ---> ritorna il valore massimo (contenuto in findMax)
getMax:			addi 	$sp, $sp, -4
			sw   	$ra, 0($sp)			# salvo il registro di ritorno 
				 	
			la	$a0, simbolsNum			
			jal 	ArrayLength			# calcola lunghezza dell'array
	    	
	    	 	move	$a1, $v1			# recupera la lunghezza del array
	    	 	lw	$a0, simbolsNum			
	    	 	jal	findmax				# cerca il massimo 
	    	 	
			lw	$ra, 0($sp)			# ripristina l'indirizzo di ritorno 
			addi	$sp, $sp, 4
			jr   	$ra
			
# findMid:  Trova la posizione in mezzo della stringa da leggere 
# parametri: 		$a0 ---> stringa da trovare il punto mezzo
#			$v1 <--- ritorna la posizione da trovare il mezzo
findMid:		addi 	$sp, $sp, -4
			sw   	$ra, 0($sp)			# salvo il registro di ritorno 
			
			jal	ArrayLength			# trova la lunghezza dell'array
			move	$t1, $v1			# carico le ripetizioni la lunghezza dell'array
			li	$t3, 2
			div	$t1, $t3 
			mfhi	$t2
			beq	$t2, $zero, pair
			add	$t1, $t1 -1
pair:			mflo	$t2
			move	$v1, $t2			
			
			lw	$ra, 0($sp)			# ripristina l'indirizzo di ritorno 
			addi	$sp, $sp, 4
			jr   	$ra
			
#calculateSpaces: Calcola il mumero degli spazi da stampare
# patrametro 		$a0 ---> riceve il valore attuale di max che mi serve per calcolare 
#			$v1 <--- ritorna il numero degli spazi da stampare 
calculateSpaces:	addi 	$sp, $sp, -4
			sw   	$ra, 0($sp)			# salvo il registro di ritorno 
																		
			move	$t0, $a0			# copio il valore di max
			beqz	$t0, last			# se non ho altri elementi da leggere  
			blt	$t0, 5 , solodiv
			addi	$t0, $t0, -1
solodiv:		div	$t0, $t0, 2						
			j 	exitspace
						
last:			jal	getMax				# sezione dedicata per l'ultimo elemento
			addi	$v1, $v1, -1			# il valore di ritorno è in $v1 assegnato da getmax
			div	$v1, $v1, 2	
     			j	quickExit			
     			
exitspace:		move	$v1, $t0			# ritorna il 
quickExit:		lw	$ra, 0($sp)			# ripristina l'indirizzo di ritorno 
			addi	$sp, $sp, 4
			jr   	$ra			
	 	

# printSpace:  Stampa gli spazi a seconda del valore (massimo-1)/2
# parametri:		$a1<--- prende in ingresso il numero di spazi da stampare			
printSpace:		addi 	$sp, $sp, -4
			sw   	$ra, 0($sp)			# salvo il registro di ritorno 
		
			move  	$t0, $zero 			# setta contatore 
			move	$t1, $a1			# carico le ripetizioni 
											
spaceCicle:		beq	$t0, $t1, exitFo 		# se contatore e repitizioni sono uguali finisce

	     	   	jal 	printSpazio			# chiama la fuznione per stampare spazio
	     		   	
	     	   	addi	$t0, $t0, 1			# aggiorna contatore
	     	   	j 	spaceCicle			 
	     	   	
exitFo:			lw	$ra, 0($sp)			# ripristina l'indirizzo di ritorno
			addi	$sp, $sp, 4
			jr   	$ra	
   	

# FindMax: Trova il massimo del vettore in ingresso 
# parametro: 		$a0 <--- il riferimento al vettore interessato 
#			$a1 <--- carico la lunghezza del vettore
#			$v1 ---> ritorna il valore massimo 							
findmax:		move	$t0, $a0			# Definiamo il Massimo, primo Elemento del vettore
			
			li	$t3, 0				# contatore controllo 
			li	$t1, 4				# predispone di spostarsi 
control_loop:		lw	$t2, simbolsNum($t1)		# carica il valore successivo 
			ble	$t0, $t2, swap
afterswap:		beq	$t3, $a1, exitMax		# se ho raggiunto la lunghezza massima esco
	
			addi	$t1, $t1, 4			# leggo il valore successivo 
			addi	$t3, $t3, 1			# aggiorno il contattore
			j 	control_loop
		
swap:			move 	$s0, $t0			# azione di swap
			move	$t0, $t2
			move	$t2, $s0	
			j	afterswap
		
exitMax:		move	$v1, $t0			# ritorno il valore massimo
			jr	$ra
		   	
#asteriscoPrint: procedura dedicata alla stampa degli asterischi, tanti quanti sono specificati dal parametro in $a1	   		
#parametri :		$a1<---numero di ripetizioni da fare	     	     	     
asteriscoPrint :   	addi 	$sp, $sp, -4
			sw   	$ra, 0($sp)			# salvo il registro di ritorno 
		
			move  	$t0, $zero 			# setto il contatore a zero
			move	$t1, $a1			# carico le ripetizioni 
forloop:		beq	$t0, $t1, exitFor 		# ciclo di stampa 
		
	     	   	jal 	printAsterisco			# procedura dedicata stampa del simbolo 
	     	        	   	
	     	   	addi	$t0, $t0, 1
	     	   	j 	forloop
	     	   	
exitFor:		lw	$ra, 0($sp)			# ripristino l'indirizzo di ritorno
			addi	$sp, $sp, 4
			jr   	$ra

# ArrayLength: Procedura che conta il numero dei caratteri nel buffer in ingresso
# Parametri:		$a0 <--- La stringa di cui contare la lunghezza
#			$v1 ---> ritorna la lunghezza dell'array
ArrayLength:		li	$t0, 0			# Inizializzo contatore 
				
counterLoop:		lbu	$t1, 0($a0)		# Carico il carattere puntato in $t1
			beqz	$t1, endCounter		# Se sono arrivato alla fine della stringa il metodo termina	
			addi	$t0, $t0, 1		# Altrimenti aumento il contatore di 1
			addi	$a0, $a0, 4		# Scorro alla posizione successiva del buffer
			j 	counterLoop		
			
endCounter:		move	$v1, $t0		# Valore di ritorno in $v1
			jr 	$ra

# stringLength: Procedura che conta il numero dei caratteri nel buffer in ingresso
# Parametri:		$a0 <--- La stringa di cui contare la lunghezza
#			$v1 ---> ritorna la lunghezza dell'array
stringLength:		li	$t0, 0			# Inizializzo contatore 
				
Loop:			lb	$t1, 0($a0)		# Carico il carattere puntato in $t1
			beqz	$t1, Counter		# Se sono arrivato alla fine della stringa il metodo termina	
			addi	$t0, $t0, 1		# Altrimenti aumento il contatore di 1
			addi	$a0, $a0, 1		# Scorro alla posizione successiva del buffer
			j 	Loop		
			
Counter:		move	$v1, $t0		# Valore di ritorno in $v1
			jr 	$ra
			
			
#printNewLine: Permette di andare a capo nella stampa degli asterischi			     
printNewLine:	   	li	$v0, 4
	     	   	la	$a0, newLine
	     	   	syscall
			jr   	$ra
			
#printAsterisco: Stampa asterisco 			
printAsterisco:		li	$v0, 4				
	     	   	la	$a0, asterisco			
	     	   	syscall
	     	   	jr	$ra

#printAsterisco: Stampa asterisco 			
printSpazio:		li	$v0, 11				
	     	   	li	$a0, 32			
	     	   	syscall
	     	   	jr	$ra	

# esci dal programma			
 exit:			li	$v0, 10
			syscall

