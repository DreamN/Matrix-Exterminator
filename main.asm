.model  tiny 
.386   
        .data
        row db 0
        col db 0
		ypos dw 100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,3,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,2,100,100,100,1,100,100,100,100,0,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100
        clr db 0
        chk db 0
        cx1 dw 0
        cx2 dw 0
        cx3 dw 0
        cx4 dw 0
        cx5 dw 0
        cx6 dw 0
        cx7 db 0
        sc 	db 0
        hp  db 9
        cnew dw 0
        speed dw 0
        level db 0
        fck   db 0
        score0 db 0
        score1 db 0
        score2 db 0
        ended db 0
        tmp db 0    
        .code
        org     0100h
main:   mov     ah, 00h
        mov     al, 03h			; Set to 80x25
        int     10h
        push	1546
      	mov 	cx, 100			; row amount
      	mov  	sc, 40 
      	mov 	ah, 01h
      	mov 	ch, 20h
      	int		10h

      	; Opening
			lea si, ypos
      		mov ax, 1301h
      		mov bx, 0003h
      		mov cx, 52
      		mov bp, offset opening1
      		mov dx, 020Ch
      		int 10h

      		mov bp, offset opening2
      		mov dx, 030Ch
      		int 10h

      		mov bp, offset opening3
      		mov dx, 040Ch
      		int 10h

      		mov bp, offset opening4
      		mov dx, 050Ch
      		int 10h

      		mov bp, offset opening5
      		mov dx, 060Ch
      		int 10h

      		mov bp, offset opening6
      		mov dx, 070Ch
      		int 10h

      		mov bp, offset opening7
      		mov dx, 080Ch
      		int 10h

      		mov bp, offset opening8
      		mov dx, 090Ch
      		int 10h

      		mov bp, offset opening9
      		mov dx, 0A0Ch
      		int 10h

      		mov bp, offset opening10
      		mov dx, 0B0Ch
      		int 10h

      		mov bp, offset opening11
      		mov dx, 0C0Ch
      		int 10h

			mov bx, 0006h
	  		mov bp, offset opening12
	  		mov dx, 110Ch
	  		int 10h
;Play Opening Sound
				push ds
		        pop  es
		        mov  si, offset openTune
		           
		        mov  dx,61h                  ; turn speaker on
		        in   al,dx                   ;
		        or   al,03h                  ;
		        out  dx,al                   ;
		        mov  dx,43h                  ; get the timer ready
		        mov  al,0B6h                 ;
		        out  dx,al                   ;

		LoopIt: lodsw                        ; load desired freq.
		        or   ax,ax                   ; if freq. = 0 then done
		        jz   short LDone             ;
		        mov  dx,42h                  ; port to out
		        out  dx,al                   ; out low order
		        xchg ah,al                   ;
		        out  dx,al                   ; out high order
		        lodsw                        ; get duration
		        mov  cx,ax                   ; put it in cx (16 = 1 second)
		        call PauseIt                 ; pause it
		        jmp LoopIt

		LDone:  mov  dx,61h                  ; turn speaker off
		        in   al,dx                   ;
		        and  al,0FCh                 ;
		        out  dx,al                   ;
		        jmp open2p

		PauseIt proc near uses ax cx es
		        mov  ax,0040h
		        mov  es,ax
		        ; wait for it to change the first time
		        mov  al,es:[006Ch]
		@a:     cmp  al,es:[006Ch]
		        je   short @a

		        ; wait for it to change again
		loop_it:mov  al,es:[006Ch]
		@b:     cmp  al,es:[006Ch]
		        je   short @b

		        sub  cx,55
		        jns  short loop_it

		        ret
		PauseIt endp
;End Play Opeining Sound
		
open2p:
		mov     ah, 00h
        mov     al, 03h			; Set to 80x25
        int     10h
		lea si, ypos
  		mov ax, 1301h
  		mov bx, 0003h
  		mov cx, 52

						mov ah, 02h         ; Move cursor XY
				        mov bh, 00h
				        mov dl, 0Ch
				        mov dh, 12h
				        int 10h
				        mov ah, 09h         ; Write Char
				        mov al, 'E'			
				        mov bh, 00h
				        mov bl, 06h			; color 
				        mov cx, 0001h       ; Repeat
				        int 10h
						mov ah, 02h         ; Move cursor XY
				        mov bh, 00h
				        mov dl, 0Dh
				        mov dh, 12h
				        int 10h
				        mov ah, 09h         ; Write Char
				        mov al, 'n'			
				        mov bh, 00h
				        mov bl, 06h			; color 
				        mov cx, 0001h       ; Repeat
				        int 10h						     
						mov ah, 02h         ; Move cursor XY
				        mov bh, 00h
				        mov dl, 0Eh
				        mov dh, 12h
				        int 10h
				        mov ah, 09h         ; Write Char
				        mov al, 't'			
				        mov bh, 00h
				        mov bl, 06h			; color 
				        mov cx, 0001h       ; Repeat
				        int 10h
						mov ah, 02h         ; Move cursor XY
				        mov bh, 00h
				        mov dl, 0Fh
				        mov dh, 12h
				        int 10h
				        mov ah, 09h         ; Write Char
				        mov al, 'e'			
				        mov bh, 00h
				        mov bl, 06h			; color 
				        mov cx, 0001h       ; Repeat
				        int 10h
						mov ah, 02h         ; Move cursor XY
				        mov bh, 00h
				        mov dl, 10h
				        mov dh, 12h
				        int 10h
				        mov ah, 09h         ; Write Char
				        mov al, 'r'			
				        mov bh, 00h
				        mov bl, 06h			; color 
				        mov cx, 0001h       ; Repeat
				        int 10h
						mov ah, 02h         ; Move cursor XY
				        mov bh, 00h
				        mov dl, 11h
				        mov dh, 12h
				        int 10h
				        mov ah, 09h         ; Write Char
				        mov al, ':'			
				        mov bh, 00h
				        mov bl, 06h			; color 
				        mov cx, 0001h       ; Repeat
				        int 10h
			mov ah, 02h         ; Move cursor XY
	        mov bh, 00h
	        mov dl, 14h
	        mov dh, 12h
	        int 10h
      	; Get Level
      		getlevel:
      		mov al, 00
      		mov ah, 0Bh
      		int 21h
      		mov bl, 00
      		cmp al, bl
      		je getlevel

      		mov ah, 00h
      		int 16h		;al is level 1 or 2 or 3
      		mov level, al
				mov ah, 02h         ; Move cursor XY
		        mov bh, 00h
		        mov dl, 10
		        mov dh, 10
		        add ah, 1
		        int 10h

		        mov ah, 09h         ; Write Char	
		        mov al, level		
		        mov bh, 00h
		        mov bl, 02h			; color 
		        mov cx, 0001h       ; Repeat
		        int 10h
      		mov cnew, 2
      		mov speed, 200
      		lea si, ypos
      		mov bl, '1'
      		cmp al, bl
      		je lv1
      		mov bl, '2'
      		cmp al, bl
      		je lv2
      		mov bl, '3'
      		cmp al, bl
      		jne getlevel
      			mov [si+18], 4
      			mov [si+30], 5
      			mov speed, 20
      			jmp gostart
      		lv2:
      			mov speed, 50
      			jmp gostart
      		lv1:
      			mov speed, 100
      			jmp gostart



      	; end get level
      	; Clear Screen
    gostart:
    	mov     ah, 00h
        mov     al, 03h			; Set to 80x25
        int     10h

        loop1:


            mov col, 0
	        mov cx, 80 				; col amount 
			lea si, ypos
	        loop2:

	        	mov cx1, cx

	        	mov al, 100
	        	cmp [si], al
	        	je ted
	        		mov cl, 1
	        		add [si], cl
	; check if [si] == 25
	        	mov ax, [si]
	        	cmp ax, 25
	        	jne l2
				; Hit!
	; 
				        mov     al, 182         ; Prepare the speaker for the
				        out     43h, al         ;  note.
				        mov     ax, 1207        ; Frequency number (in decimal)
				                                ;  for middle C.
				        out     42h, al         ; Output low byte.
				        mov     al, ah          ; Output high byte.
				        out     42h, al 
				        in      al, 61h         ; Turn on note (get value from
				                                ;  port 61h).
				        or      al, 00000011b   ; Set bits 1 and 0.
				        out     61h, al         ; Send new value.
				        mov     bx, 25          ; Pause for duration of note.
				.pause11:
				        mov     cx, 10000
				.pause21:
				        dec     cx
				        jne     .pause21
				        dec     bx
				        jne     .pause11
				        in      al, 61h         ; Turn off note (get value from
				                                ;  port 61h).
				        and     al, 11111100b   ; Reset bits 1 and 0.
				        out     61h, al         ; Send new value.

	        		mov [si], 100
	        		sub hp, 1
	        		add cnew, 1

	        		mov cx, 25
	        		mov cx7, 25
	        		clearhit:
	        			push cx
			        		mov ah, 02h
				        	mov bh, 00h
				        	mov dl, col
				        	mov dh, cx7
				        	int 10h

				        	mov ah, 09h
				        	mov al, ' '
				        	mov bh, 00h
				        	mov bl, 00h
				        	mov cx, 0001h
				        	int 10h

				        	sub cx7, 1
	        			pop cx
	        		loop clearhit


	        		cmp hp, 0
	        		jle exit
				l2:

				mov bl, 100
				cmp [si], bl
				je ted
				; set blank after tail
			    	mov al, [si]
		        	sub al, 9
		        	mov clr, al

		        	mov ah, 02h
		        	mov bh, 00h
		        	mov dl, col
		        	mov dh, clr
		        	int 10h

		        	mov ah, 09h
		        	mov al, ' '
		        	mov bh, 00h
		        	mov bl, 00h
		        	mov cx, 0001h
		        	int 10h

	        	; set head 
					mov ah, 02h         ; Move cursor XY
			        mov bh, 00h
			        mov dl, col
			        mov dh, [si]
			        add si, 2
			        int 10h

			        rnd1:

				  		;PRNG
				  		pop ax
				        mov bx, 1395
				        mul bl
				        add eax, 1546
				        xor edx, edx
				        mov ecx, 93
				        div ecx
				        mov eax, edx
				        push ax

				        add al, '!'

			        mov ah, 09h         ; Write Char	
			        mov bh, 00h
			        mov bl, 07h		; color
			        mov cx, 0001h       ; Repeat
			        int 10h
			        jmp ted2
			    ted:
			    	add si, 2
			    ted2:
	        	add col, 1
	        	mov cx, cx1
        	sub cx, 1
        	cmp cx, 0
        	jne loop2

    		;Delay

	        mov cx, speed			; fast-level
	        dl1:
	        	mov cx6, cx
	        			;Spacecraft
							; center
								mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, sc
						        mov dh, 24
						        int 10h

						        mov ah, 09h         ; Write Char
						        mov al, 'X'			
						        mov bh, 00h
						        mov bl, 06h			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h
					        ; prev
								mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, sc
						        mov dh, 24
						        sub dl, 1
						        int 10h

						        mov ah, 09h         ; Write Char
						        mov al, '<'			
						        mov bh, 00h
						        mov bl, 06h			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h		
						    ; next
								mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, sc
						        mov dh, 24
						        add dl, 1
						        int 10h

						        mov ah, 09h         ; Write Char
						        mov al, '>'			
						        mov bh, 00h
						        mov bl, 06h			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h	        
						;End Spacecraft
						; Score Box
								mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 70
						        mov dh, 0
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, 'H'			
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h

								mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 71
						        mov dh, 0
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, 'P'			
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h

						        mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 72
						        mov dh, 0
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, ':'			
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h

						        mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 73
						        mov dh, 0
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, ' '			
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h

						        mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 74
						        mov dh, 0
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, ' '			
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h

						        mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 75
						        mov dh, 0
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, ' '			
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h

						        mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 76
						        mov dh, 0
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, ' '			
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h

						        mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 77
						        mov dh, 0
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, ' '			
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h

						        mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 78
						        mov dh, 0
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, hp
						        add al, '0'			
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h

				; Point


						    	mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 70
						        mov dh, 1
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, 'S'	
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0005h       ; Repeat
						        int 10h

						        mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 71
						        mov dh, 1
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, 'C'	
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0005h       ; Repeat
						        int 10h

						        mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 72
						        mov dh, 1
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, 'O'	
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0005h       ; Repeat
						        int 10h

						        mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 73
						        mov dh, 1
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, 'R'	
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0005h       ; Repeat
						        int 10h


						    	mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 74
						        mov dh, 1
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, 'E'	
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h
						        
						        mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 75
						        mov dh, 1
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, ':'	
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h

						    	mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 76
						        mov dh, 1
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, score2
						        add al, '0'			
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h

						        mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 77
						        mov dh, 1
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, score1
						        add al, '0'			
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h

						        mov ah, 02h         ; Move cursor XY
						        mov bh, 00h
						        mov dl, 78
						        mov dh, 1
						        int 10h
						        mov ah, 09h         ; Write Char
						        mov al, score0
						        add al, '0'			
						        mov bh, 00h
						        mov bl, 3Fh			; color 
						        mov cx, 0001h       ; Repeat
						        int 10h
						; End Scorebox
	        	mov cx, 100
	        	dl2:
		        	mov cx3, cx

	        		cmp cnew, 1
			        jl normal
			        		;Generate new col
				        		gennewcol0:
						        		pop ax
								        ;mov ax, dx
								        mov bx, 1395
								        mul bl
								        add eax, 1546
								        xor edx, edx
								        mov ecx, 78
								        div ecx
								        mov eax, edx
								        push ax

								        add al, 1
								        
						        		lea si, ypos
						        		mov ch, 0
						        		mov cl, al
						        		ladd:
						        			add si, 2
						        		loop ladd

						        		cmp [si], 30
						        		jl gennewcol0

						        		mov [si], 0
						       	sub cnew, 1
			        normal:

	        		mov ah, 0Bh
	        		int 21h
	        		mov bl, 00
	        		cmp al, bl
	        		je mvout

	        		mov ah, 00h
	        		int 16h
; ESC
	        		mov bl, 27
	        		cmp al, bl
	        		je exit
	        		mov bl, 'a'
	        		cmp al, bl
	        		je ssc
	        		jmp rornot
		        		ssc:
		        		mov bl, 1
		        		cmp sc, bl
		        		je mvout
		        			;Del Spacecraft
								; center
									mov ah, 02h         ; Move cursor XY
							        mov bh, 00h
							        mov dl, sc
							        mov dh, 24
							        int 10h

							        mov ah, 09h         ; Write Char
							        mov al, ' '			
							        mov bh, 00h
							        mov bl, 06h			; color 
							        mov cx, 0001h       ; Repeat
							        int 10h
						        ; prev
									mov ah, 02h         ; Move cursor XY
							        mov bh, 00h
							        mov dl, sc
							        mov dh, 24
							        sub dl, 1
							        int 10h

							        mov ah, 09h         ; Write Char
							        mov al, ' '			
							        mov bh, 00h
							        mov bl, 06h			; color 
							        mov cx, 0001h       ; Repeat
							        int 10h		
							    ; next
									mov ah, 02h         ; Move cursor XY
							        mov bh, 00h
							        mov dl, sc
							        mov dh, 24
							        add dl, 1
							        int 10h

							        mov ah, 09h         ; Write Char
							        mov al, ' '			
							        mov bh, 00h
							        mov bl, 06h			; color 
							        mov cx, 0001h       ; Repeat
							        int 10h	        
							;End Del Spacecraft
		        			sub sc, 1
		        			jmp mvout
		        		rornot:
		        		mov bl, 'd'
		        		cmp al, bl
		        		je asc
		        		jmp mvout
		        			asc:
		        			mov bl, 78
		        			cmp bl, sc
		        			je mvout
			        			;Del Spacecraft
									; center
										mov ah, 02h         ; Move cursor XY
								        mov bh, 00h
								        mov dl, sc
								        mov dh, 24
								        int 10h

								        mov ah, 09h         ; Write Char
								        mov al, ' '			
								        mov bh, 00h
								        mov bl, 06h			; color 
								        mov cx, 0001h       ; Repeat
								        int 10h
							        ; prev
										mov ah, 02h         ; Move cursor XY
								        mov bh, 00h
								        mov dl, sc
								        mov dh, 24
								        sub dl, 1
								        int 10h

								        mov ah, 09h         ; Write Char
								        mov al, ' '			
								        mov bh, 00h
								        mov bl, 06h			; color 
								        mov cx, 0001h       ; Repeat
								        int 10h		
								    ; next
										mov ah, 02h         ; Move cursor XY
								        mov bh, 00h
								        mov dl, sc
								        mov dh, 24
								        add dl, 1
								        int 10h

								        mov ah, 09h         ; Write Char
								        mov al, ' '			
								        mov bh, 00h
								        mov bl, 06h			; color 
								        mov cx, 0001h       ; Repeat
								        int 10h	        
								;End Del Spacecraft
			        			add sc, 1
			        			jmp mvout
		        		mvout:
		        			mov bl, 'w'
		        			cmp al, bl
		        			jne keyout

		        			; shoot it!

        mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax, 8126        ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 25          ; Pause for duration of note.
.pause12:
        mov     cx, 15535
.pause22:
        dec     cx
        jne     .pause22
        dec     bx
        jne     .pause12
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al         ; Send new value.
		        			mov cx, 24
		        			shoot:
		        				mov cx4, cx
			        				mov ah, 02h         ; Move cursor XY
							        mov bh, 00h
							        mov dl, sc
							        mov dh, cl
							        int 10h

							        mov ah, 09h         ; Write Char
							        mov al, 34	
							        mov bh, 00h
							        mov bl, 04h			; color 
							        mov cx, 0001h       ; Repeat
							        int 10h
							        mov cx, 300
							        dlybullet:				; Delay loop
							        	mov cx5, cx
							        	mov cx, 200
							        	dlybullet2:
							        	loop dlybullet2
							        	mov cx, cx5
							        loop dlybullet
							    	mov cx, cx4
							    	mov cx4, cx
							        mov ah, 02h         ; Move cursor XY
							        mov bh, 00h
							        mov dl, sc
							        mov dh, cl
							        add ah, 1
							        int 10h

							        mov ah, 09h         ; Write Char
							        mov al, ' '			
							        mov bh, 00h
							        mov bl, 00h			; color 
							        mov cx, 0001h       ; Repeat
							        int 10h
		        				mov cx, cx4
				        		sub cx, 1
				        		cmp cx, -1
				        	jne shoot

				        	; set pos to 100

				        		lea si, ypos
				        		mov ch, 0
				        		mov cl, sc

				        		lad:
				        			add si, 2
				        		loop lad

				        		mov al, 100
				        		cmp al, [si]
				        		je nfall
; Hit!
						        mov     al, 182         ; Prepare the speaker for the
						        out     43h, al         ;  note.
						        mov     ax, 2873        ; Frequency number (in decimal)
						                                ;  for middle C.
						        out     42h, al         ; Output low byte.
						        mov     al, ah          ; Output high byte.
						        out     42h, al 
						        in      al, 61h         ; Turn on note (get value from
						                                ;  port 61h).
						        or      al, 00000011b   ; Set bits 1 and 0.
						        out     61h, al         ; Send new value.
						        mov     bx, 25          ; Pause for duration of note.
						.pause13:
						        mov     cx, 8000
						.pause23:
						        dec     cx
						        jne     .pause23
						        dec     bx
						        jne     .pause13
						        in      al, 61h         ; Turn off note (get value from
						                                ;  port 61h).
						        and     al, 11111100b   ; Reset bits 1 and 0.
						        out     61h, al         ; Send new value.
						; Hit!
						        mov     al, 182         ; Prepare the speaker for the
						        out     43h, al         ;  note.
						        mov     ax, 6449       ; Frequency number (in decimal)
						                                ;  for middle C.
						        out     42h, al         ; Output low byte.
						        mov     al, ah          ; Output high byte.
						        out     42h, al 
						        in      al, 61h         ; Turn on note (get value from
						                                ;  port 61h).
						        or      al, 00000011b   ; Set bits 1 and 0.
						        out     61h, al         ; Send new value.
						        mov     bx, 25          ; Pause for duration of note.
						.pause14:
						        mov     cx, 4000
						.pause24:
						        dec     cx
						        jne     .pause24
						        dec     bx
						        jne     .pause14
						        in      al, 61h         ; Turn off note (get value from
						                                ;  port 61h).
						        and     al, 11111100b   ; Reset bits 1 and 0.
						        out     61h, al         ; Send new value.

									mov bx, speed
									cmp bx, 1
									je scoring
										sub speed, 1
									scoring:
									cmp score0, 9
									je x1
									jmp y1
									x1:
										mov score0, 0
										cmp score1, 9
										je x2
										jmp y2
										x2:
											mov score1, 0
											add score2, 1
											jmp pointed
									y1:
										add score0, 1
										jmp pointed
									y2:
										add score1, 1
								pointed:

				        			mov [si], 100

				        			;add cnew
				        			add cnew, 1
				        		nfall:
		        		keyout:

		        	mov cx, cx3
		        	sub cx, 1
		        	cmp cx, 0
		        	jne dl2

        	mov cx, cx6
        	sub cx, 1
        	cmp cx, 0
        	jne dl1



       	;Generate new col
		gennewcol:
			mov bx, cnew
       		cmp bx, 1
       		jl colorloop

    		pop ax
    		add ax, 2
	        ;mov ax, dx
	        mov bx, 1395
	        mul bl
	        add eax, 1546
	        xor edx, edx
	        mov ecx, 78
	        div ecx
	        mov eax, edx
	        push ax
	        add al, 1
	        
    		lea si, ypos
    		mov ch, 0
    		mov cl, al
    		lad0:
    			add si, 2
    		loop lad0

    		cmp [si], 30

    		jl gennewcol
    		mov [si], 0
    		sub cnew, 1


    	colorloop:

	        ; color loop

	        mov col, 0
	        mov cx,	80
	        lea si, ypos

	        ; Change color to Green
	        ccolor:
	        	mov cx2, cx

	        	mov bl, 100
	        	cmp [si], bl
	        	je nextclrl			; Next Color Loop

		        mov ah, 02h         ; Move cursor XY
		        mov bh, 00h
		        mov dl, col
		        mov dh, [si]
		        int 10h

		        rnd2:

			  		;PRNG
			  		pop ax
			        ;mov ax, dx
			        mov bx, 1395
			        mul bl
			        add eax, 1546
			        xor edx, edx
			        mov ecx, 93
			        div ecx
			        mov eax, edx
			        push ax
			        
			        add al, '!'

		        mov ah, 09h         ; Write Char
		        mov bh, 00h
		        mov bl, 02h		; color
		        mov cx, 0001h       ; Repeat
		        int 10h

		    nextclrl:
		    	add si, 2
	        	add col, 1
	        	mov cx, cx2
	        loop ccolor
	        add row, 1

	    jmp loop1
        ret
        ;Exit
	    exit:
	    	mov ended, 0
				    		push ds
					        pop  es
					        mov  si, offset overTune
					           
					        mov  dx,61h                  ; turn speaker on
					        in   al,dx                   ;
					        or   al,03h                  ;
					        out  dx,al                   ;
					        mov  dx,43h                  ; get the timer ready
					        mov  al,0B6h                 ;
					        out  dx,al                   ;

					LoopIt2: lodsw                        ; load desired freq.
					        or   ax,ax                   ; if freq. = 0 then done
					        jz   short LDone2             ;
					        mov  dx,42h                  ; port to out
					        out  dx,al                   ; out low order
					        xchg ah,al                   ;
					        out  dx,al                   ; out high order
					        lodsw                        ; get duration
					        mov  cx,ax                   ; put it in cx (16 = 1 second)
					        call PauseIt2                 ; pause it
					        jmp LoopIt2

					LDone2:  mov  dx,61h                  ; turn speaker off
					        in   al,dx                   ;
					        and  al,0FCh                 ;
					        out  dx,al                   ;
					        jmp endloop

					PauseIt2 proc near uses ax cx es
					        mov  ax,0040h
					        mov  es,ax
					        ; wait for it to change the first time
					        mov  al,es:[006Ch]
					@a2:     cmp  al,es:[006Ch]
					        je   short @a2

					        ; wait for it to change again
					loop_it2:mov  al,es:[006Ch]
					@b2:     cmp  al,es:[006Ch]
					        je   short @b2

					        sub  cx,55
					        jns  short loop_it2

					        ret
					PauseIt2 endp


	    	mov ended, 0
	    	endloop:
	    		mov tmp, 0
	    		end1:
		    		mov ah, 02h         ; Move cursor XY
			        mov bh, 00h
			        mov dl, tmp
			        mov dh, ended
			        int 10h

			        mov ah, 09h         ; Write Char	
			        mov al, '>'		
			        mov bh, 00h
			        mov bl, 04h			; color 
			        mov cx, 0001h       ; Repeat
			        int 10h
			        mov cx, 100 
			        eiei1:
			        	push cx
			        		mov cx, 100
			        		eiei2:
			        		loop eiei2
			        	pop cx
			        loop eiei1
			        add tmp, 1
			    	cmp tmp, 80
			    jne end1

		        add ended, 1
			    mov tmp, 79
                end2:
                    mov ah, 02h         ; Move cursor XY
                    mov bh, 00h
                    mov dl, tmp
                    mov dh, ended
                    int 10h

                    mov ah, 09h         ; Write Char    
                    mov al, '<'     
                    mov bh, 00h
                    mov bl, 04h         ; color 
                    mov cx, 0001h       ; Repeat
                    int 10h
                    mov cx, 100 
                    eiei3:
                        push cx
                            mov cx, 100
                            eiei4:
                            loop eiei4
                        pop cx
                    loop eiei3

                    sub tmp, 1
                	cmp tmp, -1
                jne end2 

		        add ended, 1
		        mov bl, ended
		        cmp bl, 25
		        jl endloop

		    mov     ah, 00h
			mov     al, 03h			; Set to 80x25
			int     10h
			.exit
        opening1 	db '+--------------------------------------------------+'
        opening2 	db '|             +-------------------+                |'
        opening3 	db '|             | Matrix Challenger |                |'
        opening4 	db '|             +-------------------+                |'
        opening5 	db '|                                                  |'
        opening6 	db '|       Created By..   Pongsatorn Wanitchinchai    |'
        opening7 	db '|                      Isara Naranirattisai        |'
        opening8 	db '|                                                  |'
        opening9 	db '|                                                  |'
        opening10 	db '|      Computer Organization - [CE KMITL]          |'
        opening11	db '+--------------------------------------------------+'
		opening12 db '     Level:  [1 for Easy, 2 for Medium, 3 for Hard] '
        openTune        dw 1,1
			dw 1809, 12
			dw 1809, 12
			dw 1, 12
			dw 1809, 12
			dw 1, 12
			dw 2280, 12
			dw 1809, 12
			dw 1, 12
			dw 1521, 12
			dw 1, 12
			dw 1, 12
			dw 1, 12
			dw 3043, 12
			dw 1, 12
			dw 1, 12
			dw 1, 12
			dw 2280, 12
			dw 1, 12
			dw 1, 12
			dw 3043, 12
			dw 1, 12
			dw 1, 12
			dw 3619, 12
			dw 1, 12
			dw 1, 12
			dw 2711, 12
			dw 1, 12
			dw 2415, 12
			dw 1, 12
			dw 2559, 12
			dw 2711, 12
			dw 1, 12
			dw 3043, 9
			dw 1809, 9
			dw 1521, 9
			dw 1355, 12
			dw 1, 12
			dw 1715, 12
			dw 1521, 12
			dw 1, 12
			dw 1809, 12
			dw 1, 12
			dw 2280, 12
			dw 2031, 12
			dw 2415, 12
			dw 1, 12
			dw 1, 12
			dw 2280, 12
			dw 1, 12
			dw 1, 12
			dw 3043, 12
			dw 1, 12
			dw 1, 12
			dw 3619, 12
			dw 1, 12
			dw 1, 12
			dw 2711, 12
			dw 1, 12
			dw 2415, 12
			dw 1, 12
			dw 2559, 12
			dw 2711, 12
			dw 1, 12
			dw 3043, 9
			dw 1809, 9
			dw 1521, 9
			dw 1355, 12
			dw 1, 12
			dw 1715, 12
			dw 1521, 12
			dw 1, 12
			dw 1809, 10
			dw 1, 12
			dw 1, 12
			dw 1, 12
			dw  00h,00h
		overTune        dw 1,1
			dw 4560, 70
			dw 4304, 70
			dw 4063, 70
			dw 1,1
			dw 4831, 120
			dw 3416, 120
			dw 3416, 120
			dw 3416, 120
			dw 3619, 120
			dw 4063, 120
			dw 4560, 120
			dw 7239, 120
			dw 1,1
			dw 7239, 100
			dw 9121, 100
			dw 1,1
			dw  00h,00h
		shootTune        dw 1,1
            dw 2415, 70
            dw 1809, 70
        end main
