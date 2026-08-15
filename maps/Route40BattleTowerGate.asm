Route40BattleTowerGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, BATTLE_TOWER_OUTSIDE, 1
	warp_event  5,  0, BATTLE_TOWER_OUTSIDE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route40BattleTowerGateOfficer, EVENT_BATTLE_TOWER_CLOSED
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateRockerScript, -1
	object_event  7,  5, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateTwinScript, -1

Route40BattleTowerGateOfficer:
	text "¿Vas a la Torre"
	line "Batalla?"

	para "Si ganas un montón"
	line "de veces, ganarás"

	para "Puntos de Batalla"
	line "y podrás canjear-"
	cont "los por objetos."
	done

Route40BattleTowerGateRockerScript:
	checkevent EVENT_BATTLE_TOWER_OPEN
	iftrue_jumptextfaceplayer .OpenText
	jumpthistextfaceplayer

	text "¿Tú también has"
	line "venido a ver la"
	cont "Torre Batalla?"

	para "Pero me temo que"
	line "aún no se puede"
	cont "entrar."
	done

.OpenText:
	text "¡Ya han abierto la"
	line "Torre Batalla!"

	para "Quiero ir, pero"
	line "aún no he pensado"

	para "una frase chula"
	line "para cuando gane."
	done

Route40BattleTowerGateTwinScript:
	checkevent EVENT_BATTLE_TOWER_OPEN
	iftrue_jumptextfaceplayer .OpenText
	jumpthistextfaceplayer

	text "Voy a entrenar a"
	line "mis #mon para"

	para "estar a punto para"
	line "la Torre Batalla."
	done

.OpenText:
	text "Los niveles de los"
	line "#mon que quiero"

	para "usar son todos"
	line "distintos."

	para "¡Tengo que ir a"
	line "entrenarlos ya!"
	done
