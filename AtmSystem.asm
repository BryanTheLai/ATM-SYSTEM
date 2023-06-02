.model small
.stack 100
.data 
INTROMSG db 0dh,0ah, "WELCOME TO COPIUM BANK.THE ONLY BANK THAT OFFERS 10% ANNUAL INTEREST RATES$",10,13

INTRO DB '*************************** FINANCE SERVICES SYSTEM ****************************$',10,13

ThankYouMSG db 0dh,0ah, "THANK YOU FOR CHOOSING COPIUM BANK.ENJOY YOUR DAY :>$",10,13
msg db 0dh,0ah, "Exit or deposit/withdrawal (e/d/w)?:  $"
answerFromUser db ?        
MSGUSERNAME DB 0dh,0ah, "      Username : $"         


errorInputMessage db 0dh,0ah, "Please enter y or n only!  $"
msgD db 0dh,0ah, "In deposit section$"  
msgW db 0dh,0ah, "In withdrawal section$"
calcD db 0dh,0ah, "Data calculate Section$"
msgReEnter db 0dh,0ah, "ReEnter deposit withdraw (y/n)?:  $"

msgSD db 0dh,0ah, "Enter amount of deposit :  $"
answerForDw db 6 dup('$')
msgSW db 0dh,0ah, "Enter amount of withdrawal :  $"

username db 'James04$'                   ;username = admin01
etrname db 10 dup (?)                    ;to store your enter username
askname db 10,13, 'Enter Username : $'   ;ask for username
wrgname db 10,13, 'Wrong Username!$ '    ;Wrong username msg
crtname db 10,13, 'Correct Username.$'	;correct username msg

password db '12345'                     ;password = 12345
etrpwd db 10 dup (?)                    ;to store your enter password
askpwd db 10,13, 'Enter Password : $'   ;ask for password
wrgpwd db 10,13, 'Wrong Password!$ '    ;Wrong password msg
crtpwd db 10,13, 'Correct Password.$'	;correct password msg

loginf db 10,13, 'Login Failed! Please Try Again!$'    ;login failed
loginp db 10,13, '**************************** SUCCESSFULLY LOGGED IN ***************************$'            ;login success

newline db 0dh,0ah, '$' 


DWE db 10,13, '==========MAIN MENU============ $'     ;DISPLAY CHOICES  
AMG db 10,13, '|     (A) FOR ACCOUNT DETAILS |$'     
DPT db 10,13, '|     (D) FOR DEPOSIT         |$'                         ;DISPLAY D FOR DEPOSIT
WDW db 10,13, '|     (W) FOR WITHDRAWAL      |$'                      ;DISPLAY W FOR WITHDRWAL
EXT db 10,13, '|     (E) FOR EXIT            |$'                            ;DISPLAY E FOR EXIT  
DWEA db 10,13, '|                             | $'
WRG_CHO DB 10,13, '! PLEASE CHOOSE A VAILD INPUT !$'   ;DISPLAY IF WRONG INPUT
UR_CHO DB 10,13, 'INPUT (A/D/W/E): $'

DPT_MSG DB 10,13, '**************************** DEPOSIT ******************************$' 
WDW_MSG DB 10,13, '*************************** WITHDRAWAL ****************************$' 


QuestionD db 0dh , 0ah, "Please choose your Deposit Amount or (B) for back :  $"
QuestionW db 0dh , 0ah, "Please choose your Withdrawal Amount or (B) for back :  $"
        
Deposit6 db 0dh , 0ah, "=====================================$"
INFO db 0dh , 0ah,     "|KEYS         DEPOSIT AMOUNT        |$"
Deposit1 db 0dh , 0ah, "|(1)              RM 100            |$"
Deposit2 db 0dh , 0ah, "|(2)              RM 200            |$"
Deposit3 db 0dh , 0ah, "|(3)              RM 400            |$" 
Deposit4 db 0dh , 0ah, "|(4)              RM 1000           |$" 
Deposit5 db 0dh , 0ah, "=====================================$"  

Withdrawal6 db 0dh , 0ah, "==================================$"
INFOW db 0dh , 0ah,       "|KEYS       WITHDRAWAL AMOUNT    |$"
Withdrawal1 db 0dh , 0ah, "|(1)              RM 100         |$" 
Withdrawal2 db 0dh , 0ah, "|(2)              RM 200         |$" 
Withdrawal3 db 0dh , 0ah, "|(3)              RM 400         |$" 
Withdrawal4 db 0dh , 0ah, "|(4)              RM 1000        |$"
Withdrawal5 db 0dh , 0ah, "==================================$"  
  
descThatAll db 0dh , 0ah, "Is that all? (Y)/(N):  $"   
errorYOrNOnly db 0dh , 0ah, "INVALID INPUT.(Y) for yes and (N) for no ONLY!! $"  
withdrawalComfirmationMSG  db 0dh , 0ah, "Are you sure you want to withdraw RM $" 
questionMark db "? : ","$"                                                        

descTotalSum db 0dh,0ah,         "============ Summary of Accounts ============$"
descAmountAfterYear db 0dh,0ah,  "      Amount after a year (10%) :  RM $"
descCurrentAmount db 0dh,0ah,    "      Current Amount in Account :  RM $"
descAmountInInterest db 0dh,0ah, "      Amount in interest  (10%) :  RM $"    
endTotalSum  db 0dh,0ah,         "========= End of Summary of Accounts ========$"

descDAmount db 0dh,0ah, "Deposited amount  :  $"
descWAmount db 0dh,0ah, "Withdrawal amount :  $" 
 
deposited100 db 0dh,0ah, "Successfully deposited RM 100  $"
deposited200 db 0dh,0ah, "Successfully deposited RM 200  $" 
deposited400 db 0dh,0ah, "Successfully deposited RM 400  $"  
deposited1000 db 0dh,0ah, "Successfully deposited RM 1000  $"  

withdrawal100 db 0dh,0ah, "Successfully withdrawed RM 100  $"
withdrawal200 db 0dh,0ah, "Successfully withdrawed RM 200  $" 
withdrawal400 db 0dh,0ah, "Successfully withdrawed RM 400  $"  
withdrawal1000 db 0dh,0ah, "Successfully withdrawed RM 1000  $"

withdrawAmount dw 0
enteredDWAmount dw 0  
accountCurrent dw 0
amountInInterest dw 0 
amountAfterOneYear dw 0
inputForThatAll db ?        
currentlyDOrW dw ?    ;0 for deposit section, 1 for withdrawal section

ErrorMsg db 0dh , 0ah,"Invalid input. Please Choose Again! $"
withdrawErrorMSG db 0dh , 0ah,"Not enough deposits in account $"
zeroMSG db "0$"
xyz dw 0
pressYorN  db 0dh , 0ah,"Press (Y) for yes (N) for no. $" 
.CODE
   
macro printString str 
    lea dx, str
    mov ah, 09h
    ; mov dx, offset str 
    int 21h 
endm

jmp start  

proc accountStatus 
    
    
    printString descTotalSum            ; "=========== Summary of Accounts ===========$" 
    printString newline               ; Choose for account details  
    printString MSGUSERNAME
    printString username 
    printString newline  
    printString descCurrentAmount       ;"CurrentAmount amount :  $"
    
    mov ax, accountCurrent
    call check0    
    mov ax, accountCurrent
    call printNumber 
       
    printString descAmountInInterest ;"Amount in interest (10%) :         $"  
    mov ax,accountCurrent  
    mov amountInInterest,ax
    mov ax, amountInInterest
    mov bx,10 
    xor dx,dx
    div bx
     
    mov amountInInterest,ax
    call check0
    mov ax,amountInInterest
    call printNumber 
    
    printString descAmountAfterYear     ;"Amount after a year (100%) : $"
   
    mov ax,accountCurrent
    mov bx,amountInInterest
    add ax,bx
    mov amountAfterOneYear,ax 
    mov ax, amountAfterOneYear
    call check0
    mov ax,amountAfterOneYear 
    call printNumber 
    
    mov amountInInterest,0 
    mov amountAfterOneYear,0
    mov withdrawAmount,0  
    printString newline
    printString endTotalSum
    printString newline
    jmp CHOICE
    ret
     
endp accountStatus
 
 
proc comfirmWithdrawal           ;confirm to withdraw how much money
     
     mov ax,withdrawAmount
     mov xyz,ax 
     printString NEWLINE
     printString pressYorN
goHereStart:  
     
     printString withdrawalComfirmationMSG    ;"Are you sure you wan to withdraw USD $"
     
     mov ax, xyz 
     mov withdrawAmount,ax
     mov ax, withdrawAmount
     call printNumber      
     mov withdrawAmount,0 
                                              
     printString questionMark                 ;"? : "
             
     MOV AH,1                                 ;choose yes or no
     INT 21H                                  ;no back to select withdraw amount again
     CMP AL,'n'                 
     JE  CHOICE                 
     CMP AL,'N'                 
     JE  CHOICE                 
     CMP AL,'Y'                               ;yes continue 
     JE  goHere      
     CMP AL,'y'                 
     JE  goHere
     
     printString errorYOrNOnly                ;"INVALID INPUT.(Y) for yes or (N) for no ONLY!! $"
     
     jmp goHereStart 
 
goHere:       
     ret
      
endp comfirmWithdrawal 
 
check0 proc  
    
    cmp ax,0
    jne endCheck0
    lea dx, zeroMSG
    mov ah, 09h
    ; mov dx, offset str 
    int 21h 
    
    endCheck0:
    ret  
    
check0 endp


printNumber proc                       ;change to hexa.. to a real number
    
    mov cx, 0
    mov dx, 0 

    label1: 
        cmp ax, 0 
        je print1 
        mov bx, 10 
        div bx 
        push dx 
        inc cx 
        xor dx, dx 
        jmp label1 

    print1:
        cmp cx, 0 
        je exitprint 
        pop dx 
        add dx, 48 
        mov ah, 02h 
        int 21h 
        dec cx 
        jmp print1 

    exitprint:
        ret   
        
printNumber endp
 
 
withdrawCODE proc 
    
WITHDRAWALSECTION: 
     MOV withdrawAmount,0
     
     printString Withdrawal6
     
     printString INFOW                   ;"KEYS          WITHDRAW AMOUNT   $"
              
     printString Withdrawal1             ;"1               100USD   $"                 
     printString Withdrawal2             ;"2               20USD   $"      
     printString Withdrawal3             ;"3               400USD   $" 
     printString Withdrawal4             ;"4               1000USD   $"  
     printString Withdrawal5
        
     printString QuestionW                ;"Please choose your withdraw amount or (B) for back:  $"
     
     
     MOV AH,1                    ;TAKE AN INPUT & SAVED TO AL
     INT 21H 
     
     CMP AL,49                   ;IF AL=1
     JE JumpW1
     
     CMP AL,50                   ;IF AL=2 
     JE JumpW2 
      
     CMP AL,51                   ;IF AL=3 
     JE JumpW3      
     
     CMP AL,52                   ;IF AL=4 
     JE JumpW4 
     
     CMP AL, 'B'                 ;IF E GO BACK TO CHOICE
     JE CHOICE 
     
     CMP AL, 'b'
     JE CHOICE
     
     JMP ERROR  
     
 
 ERROR:                             ;IF INVALID INPUT COME TO HERE
    
    printString ErrorMsg            ;"Invalid inpuT. Please Choose again$"
     
    JMP WITHDRAWALSECTION
    
 JumpW1:                      ;JMP HERE IF CHOOSE (1) WITHDRAW 100
    add withdrawAmount,100
    cmp accountCurrent,100
    jl withdrawNotEnough         ;JMP IF CURRENT AMOUNT LESS THAN 100    
    call comfirmWithdrawal
    sub accountCurrent, 100
         
    printString withdrawal100    ;"Successfully withdrawal 100  $"
    
    jmp sumOfW
        
 JumpW2:                      ;JMP HERE IF CHOOSE (2) WITHDRAW 200
    add withdrawAmount,200  
    cmp accountCurrent,200
    jl withdrawNotEnough         ;JMP IF CURRENT AMOUNT LESS THAN 200
    call comfirmWithdrawal  
    sub accountCurrent, 200 
    
    printString withdrawal200    ;"Successfully withdrawal 200  $"
        
    jmp sumOfW

 JumpW3:                      ;JMP HERE IF CHOOSE (3) WITHDRAW 400
     add withdrawAmount,400      
     cmp accountCurrent,400
     jl withdrawNotEnough        ;JMP IF CURRENT AMOUNT LESS THAN 400
     call comfirmWithdrawal  
     sub accountCurrent, 400
      
     printString withdrawal400   ;"Successfully withdrawal 400  $"
     
     jmp sumOfW 
     
 JumpW4:                      ;JMP HERE IF CHOOSE (4) WITHDRAW 1000
    add withdrawAmount,1000 
    cmp accountCurrent,1000
    jl withdrawNotEnough         ;JMP IF CURRENT AMOUNT LESS THAN 1000
    call comfirmWithdrawal  
    sub accountCurrent, 1000
      
    printString withdrawal1000   ;"Successfully withdrawal 1000  $"
      
    jmp sumOfW
         
withdrawNotEnough:               ;WHERE NOT ENOUGH TO WITHDRAW
printString withdrawErrorMSG     ;"Not enough deposits in account $"
jmp WITHDRAWALSECTION            ;JMP BACK TO SELECT WITHDRAW AGAIN
            
     
sumOfW:                              ;SHOW TOTAL CURRENT AMOUNT
    
    call accountStatus
   
    ret
withdrawCODE endp   


depositCODE proc             ;START TO DEPOSIT 
    
     DEPOSITSECTION:
     
     printString Deposit6
     printString INFO                 ;"KEYS          DEPOSIT AMOUNT   $"  
                
     printString Deposit1             ;"(1)               100 USD   $"    
     printString Deposit2             ;"(2)               200 USD   $"      
     printString Deposit3             ;"(3)               400 USD   $" 
     printString Deposit4             ;"(4)              1000 USD   $" 
     printString Deposit5
        
     printString QuestionD              ;"Please choose your deposit amount or (B) for back:  $"
   
     
     MOV AH,1                    ;TAKE AN INPUT & SAVED TO AL
     INT 21H 
     
     CMP AL,49                   ;IF AL=1
     JE JumpD1
     
     CMP AL,50                   ;IF AL=2 
     JE JumpD2 
      
     CMP AL,51                   ;IF AL=3 
     JE JumpD3      
     
     CMP AL,52                  ;IF AL=4 
     JE JumpD4
     
     CMP AL, 'B'                 ;IF B GO BACK TO CHOICE
     JE CHOICE 
     
     CMP AL, 'b'
     JE CHOICE 
     
     JMP ERRORD  
     
 
 ERRORD:                        ;JMP HERE IF INVALID INPUT
    
    printString ErrorMsg                ;"Invalid input. Please Choose Again! $"
    
    JMP DEPOSITSECTION           ;JMP TO CHOOSE DEPOSIT AMOUNT AGAIN
    
 JumpD1:
    add accountCurrent, 100  
    printString deposited100     ;"Successfully deposited 100  $"
    JMP ThatAllDW
        
 JumpD2:        
    add accountCurrent, 200 
    printString deposited200     ;"Successfully deposited 200  $"
    JMP ThatAllDW

 JumpD3:
    add accountCurrent, 400  
    printString deposited400     ;"Successfully deposited 400  $"
    JMP ThatAllDW   
    
 JumpD4:
    add accountCurrent, 1000  
    printString deposited1000    ;"Successfully deposited 1000  $"
    JMP ThatAllDW
            
ThatAllDW:                       ;CONFIRMATION
     LEA DX,descThatAll          ;"Is that all? $"
     MOV AH,9       
     INT 21H  
             
     MOV AH,1                    
     INT 21H                     ;(Y) GO TO SUMMARY 
     CMP AL,'y'                    
     JE  sumOfDW                   
     CMP AL,'Y'                     
     JE  sumOfDW                             
     CMP AL,'n'                  ;(N) choose another to desposit  
     JE  DEPOSITSECTION                    
     CMP AL,'N'                    
     JE  DEPOSITSECTION 
         
     printString errorYOrNOnly   ;"INVALID INPUT.(Y) for yes or (N) for no ONLY!! $"
             
     JMP THATALLDW  
     
sumOfDW:                            ;SUMMARY OF CURRENT AMOUNT
    call accountStatus
       
    ret
depositCODE endp
                                     
MAIN PROC
start:    
     mov ax, @data
     mov ds, ax       
;INTRO   
    printString INTROMSG     ;'****************************FINANCE SERVICES SYSTEM*****************************$',10,13
    printString NEWLINE
    printString INTRO        ;"WELCOME TO COPIUM BANK.THE ONLY BANK THAT OFFERS 100% ANNUAL INTEREST RATES$",10,13
    printString NEWLINE
    
     
;USERNAME START HERE

UsernameStart:
    lea si, username             ;load offset of password on si
    lea di, etrname              ;load offset of enterpassword on di
     
    printString askname          ;'Enter Username : $'
  
    
    mov cx, 7                    ;total number of chars of ur password
    
CheckName:
    mov ah, 07                   ;input from keyboard without echo
    int 21h
    
    mov [di], al                 ;store al,(input from keyboard) in [di], askpwd
    inc di
    
    mov ah, 2                    ;display al(which is what u type) on ur screen to hide password
    mov dl, al
    int 21h
    
    loop CheckName               ;loop until cx=0 
    
    lea si, username             ;load offset of password on si
    lea di, etrname               ;load offset of enterpassword on di
    
    mov cx, 7                    ;cx = 5 , number of password
    
    mov bx, 0                    ;initialize for operation
    
CompareName:
    mov bl,[si]                  ;load [si] on bl
    mov bh,[di]                  ;load [di] on bh
    
    inc si
    inc di
    
    cmp bl, bh                   ;compare bh and bl to check their equality
    jne WrongName                ;jump to zz if they are not equal
    loop CompareName             ;loop until cx=0 
    
    printString crtname          ;'Correct Username!$'
   
    printString newline
       
    jmp PasswordStart            ;go to password
    
WrongName:
    printString wrgname          ;'Wrong Username!$ '
    
    printString newline
    
    jmp UsernameStart  

;PASSWORD START HERE

PasswordStart:
    lea si, password             ;load offset of password on si
    lea di, etrpwd               ;load offset of enterpassword on di
     
    mov ah, 9h                   ;display askpwd
    lea dx, askpwd
    int 21h
    
    mov cx, 5                    ;total number of chars of ur password
    
CheckPwd:
    mov ah, 07                   ;input from keyboard without echo
    int 21h
    
    mov [di], al                 ;store al,(input from keyboard) in [di], askpwd
    inc di
    
    mov ah, 2                    ;display * on ur screen to hide password
    mov dl, '*'
    int 21h
    
    loop CheckPwd                ;loop until cx=0 
    
    lea si, password             ;load offset of password on si
    lea di, etrpwd               ;load offset of enterpassword on di
    
    mov cx, 5                    ;cx = 5 , number of password
    
    mov bx, 0                    ;initialize for operation
    
ComparePwd:
    mov bl,[si]                  ;load [si] on bl
    mov bh,[di]                  ;load [di] on bh
    
    inc si
    inc di
    
    cmp bl, bh                   ;compare bh and bl to check their equality
    jne WrongPwd                 ;jump to zz if they are not equal
    loop ComparePwd              ;loop until cx=0 
    printString crtpwd           ;'Correct Password!$'
    printString loginp           ;'*****************************SUCCESSFULLY LOGIN*******************************$'  
    
    mov ah, 9                    ;newline
    printString newline
    printString newline

    jmp CHOICE                   ;SUCCEED THEN GO TO CHOICE
    
WrongPwd: 
    printString wrgpwd               ;'Wrong Username!$ '
    printString NEWLINE

    printString loginf               ;'Login Failed! Please Try Again!$'
    printString newline
  
    jmp UsernameStart                ;JMP TO INPUT USERNAME AGAIN

CHOICE:                               
    printString NEWLINE 
    printString DWE             ;'==========PLEASE CHOOSE ONE OF IT========== $'
    printString DWEA
    printString AMG             ;'(A) FOR ACCOUNT DETAILS $'
    printString DWEA 
    printString DPT             ;'(D) FOR DEPOSIT $'
    printString DWEA
    printString WDW             ;'(W) FOR WITHDRAWAL $'
    printString DWEA
    printString EXT 
    printString DWEA 
    printString DWE             ;'(E) FOR EXIT $'
    printString NEWLINE
    printString UR_CHO          ;'INPUT (A/D/W/E): $'
                          

MOV AH, 1H                      ;INPUT FOR 2 BYTE
INT 21H    

CMP AL, 'a'                     ;IF D THEN JMP TO DEPOSIT
je callAccount

CMP AL, 'A'                     ;IF D THEN JMP TO DEPOSIT
je callAccount

jmp continueHERETHEN:

callAccount:   

   CALL accountStatus

continueHERETHEN:

CMP AL, 'd'                    ;IF D THEN JMP TO DEPOSIT
JE continueToD
CMP AL, 'D'                    ;IF D THEN JMP TO DEPOSIT
JE continueToD

CMP AL, 'w'                    ;IF W THEN JMP TO WITHDRWAL
JE continueToW
CMP AL, 'W'                    ;IF W THEN JMP TO WITHDRWAL
JE continueToW

CMP AL, 'e'                    ;IF E THEN JMP TO EXIT   
JE exit                        ;JMP TO EXIT

CMP AL, 'E'                    ;IF E THEN JMP TO EXIT   
JE exit                        ;JMP TO EXIT
JMP ERROR_CHOICE               ;JMP TO ERROR_CHOICE

ERROR_CHOICE:                  ;IF INPUT NOT IN CHOICES JMP HERE
mov ah, 9                      ;NEWLINE
lea dx, NEWLINE
int 21h

mov ah, 9                      ;DISPLAY E FOR EXIT
lea dx, WRG_CHO
int 21h 
                               ;JMP BACK TO CHOICE AGAIN
JMP CHOICE
      
continueToD:  
       call depositCODE
       jmp CHOICE  
                      
continueToW:  
       call withdrawCODE 
       jmp CHOICE

       
exit:        
        printString ThankYouMSG
       mov ah, 4ch       ;end the program
       int 21h
       
MAIN ENDP
END MAIN
