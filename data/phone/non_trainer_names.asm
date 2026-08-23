NonTrainerCallerNames:
; entries correspond to PHONECONTACT_* constants (see constants/trainer_constants.asm)
	table_width 2
	dw EmptyString
	dw .mom
	dw .bikeshop
	dw .bill
	dw .elm
	dw .lyra
	dw .buena
	assert_table_length NUM_NONTRAINER_PHONECONTACTS + 1

.mom:
	text  "Mamá:"
	done
.bill:
	text  "Bill:"
	next1 "   #Maniaco"
	done
.elm:
	text  "Prof.Elm:"
	next1 "   #mon Prof."
	done
.bikeshop:
	text  "Maravillacicleta:"
	done
.lyra:
	text  "Lira:"
	next1 "Entr. <PK><MN>"
	done
.buena:
	text  "Buena:"
	next1 "   Locutora"
	done
