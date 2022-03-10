.orig x3000
;this stack lab computes the polish notation of a set of calls
;push_val(4) pushes the value 4 onto the stack [4]
LD R1, STACK_PTR
LD R4, DEC_4
LD R6, PUSH_VAL_PTR
JSRR R6
;push_val(3) pushes the value 3 onto the stack [4,3]
ADD R4, R4, #-1
LD R6, PUSH_VAL_PTR
JSRR R6
;push_val(2) pushes the value 2 onto the stack [4,3,2]
ADD R4, R4, #-1
LD R6, PUSH_VAL_PTR
JSRR R6
;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
LD R6, ADDR_PTR
JSRR R6

;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
LD R6, ADDR_PTR
JSRR R6
HALT

;move the top value of the stack into r4
PUSH_VAL_PTR .FILL x3400
ADDR_PTR .FILL x3800
STACK_PTR .FILL x4200
DEC_4 .FILL #4
.end





.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack
STR R4, R1, #0
ADD R1, R1, #1
RET
.end
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
ST R0, BACKUP_R0_3800
ST R3, BACKUP_R3_3800
LD R0, DEC_0
ADD R1, R1, #-1
LDR R4, R1, #0
STR R0, R1, #0
LDR R3, R1, #-1
ADD R4, R4, R3
STR R4, R1, #-1
LD R0, BACKUP_R0_3800
LD R3, BACKUP_R3_3800
RET
DEC_0 .FILL #0
BACKUP_R0_3800 .BLKW #1
BACKUP_R2_3800 .BLKW #1
BACKUP_R3_3800 .BLKW #1
.end



.orig x4200 ;;data you might need
STACK .BLKW #70
.end


