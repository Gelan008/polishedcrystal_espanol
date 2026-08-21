ItemPocketNames:
	table_width 1
	dr .Item
	dr .Medicine
	dr .Ball
	dr .TM ; impossible
	dr .Berry
	dr .Key ; impossible
	assert_table_length NUM_POCKETS

.Item:
	db "Mochila@"
.Medicine:
	db "Botq@"
.Ball:
	db "Poke Balls@"
.TM:
	db "MTs y MOs@"
.Berry:
	db "Bayas@"
.Key:
	db "Obj. Clave@"
