; Exercise 2.76. As a large system with generic operations evolves, new types of data objects or new operations may be needed. For each of the three strategies -- generic operations with explicit dispatch, data-directed style, and message-passing-style -- describe the changes that must be made to a system in order to add new types or new operations.

; generic operations with explicit dispatch
; new types: procedures for every operation need to be written for new type and all existing procedures need to be updated to dispatch to the new operation if it's the new type.
; new operations: The new generic operation must dispatch to the correct type-specific procedures.

; data-directed style
; new types: one procedure for each operation must be written and installed into the operations table
; new operations: one procedure for each data type must be written and installed

; message-passing-style
; new types: new dispatch procedure that implements all of the operations
; new operations: each dispatch procedure must be modified to deal with the new operation.


; Which organization would be most appropriate for a system in which new types must often be added? 

; Message-passing style -- only one constructor needs to be written (plus any type-specific procedures)

; Which would be most appropriate for a system in which new operations must often be added?

; Data-directed style -- procedures for each type must be written and installed in the table.