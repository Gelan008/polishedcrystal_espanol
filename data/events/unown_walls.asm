UnownWalls:
	db $08, $44, $04, $00, $2e, $08, $ff ; E, S, C, A, P, E
	db $26, $48, $62, $ff                ; L, U, Z
	db $00, $0c, $48, $00, $ff           ; A, G, U, A
	db $0e, $00, $06, $00, $ff           ; H, A, D, A

MenuHeaders_UnownWalls:
; ESCAPE (6 letras = 12 tiles)
	db MENU_BACKUP_TILES
	menu_coords 3, 4, 16, 9
; LUZ (3 letras = 6 tiles)
	db MENU_BACKUP_TILES
	menu_coords 6, 4, 13, 9
; AGUA (4 letras = 8 tiles)
	db MENU_BACKUP_TILES
	menu_coords 5, 4, 14, 9
; HADA (4 letras = 8 tiles)
	db MENU_BACKUP_TILES
	menu_coords 5, 4, 14, 9
