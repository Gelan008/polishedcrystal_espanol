PokemonLeagueGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 19,  7, ROUTE_22, 1
	warp_event 20,  7, ROUTE_22, 1
	warp_event 10, 17, ROUTE_26, 1
	warp_event 11, 17, ROUTE_26, 1
	warp_event 10,  0, ROUTE_23, 1
	warp_event 11,  0, ROUTE_23, 2
	warp_event  1,  7, ROUTE_28, 2
	warp_event  2,  7, ROUTE_28, 2

	def_coord_events
	coord_event 10, 10, 0, PokemonLeagueGateXYTriggerScript1
	coord_event 11, 10, 0, PokemonLeagueGateXYTriggerScript2

	def_bg_events

	def_object_events
	object_event  8, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateOfficerScript, -1
	object_event  7,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VictoryRoadGateLeftBlackBeltText, EVENT_OPENED_MT_SILVER
	object_event 14,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VictoryRoadGateRightBlackBeltText, EVENT_FOUGHT_SNORLAX

PokemonLeagueGateXYTriggerScript2:
	applyonemovement PLAYER, step_left
PokemonLeagueGateXYTriggerScript1:
	turnobject PLAYER, LEFT
	sjumpfwd VictoryRoadGateBadgeCheckScript

VictoryRoadGateOfficerScript:
	faceplayer
VictoryRoadGateBadgeCheckScript:
	showtext VictoryRoadGateOfficerText
	setscene $1
	end

VictoryRoadGateOfficerText:
	text "Solo pueden pasar"
	line "los entrenadores"
	cont "que hayan probado"
	cont "su gran valía."

	para "¿Afrontaste el"
	line "reto de Gimnasios"
	cont "en Johto?"

	para "Los guardias de"
	line "ahí comprobarán"
	cont "tus Medallas."

	para "Adelante, pasa."
	done

VictoryRoadGateLeftBlackBeltText:
	text "Este camino lleva"
	line "al Mt. Plateado."

	para "Allí verás #mon"
	line "tan fuertes que"
	cont "dan miedo."
	done

VictoryRoadGateRightBlackBeltText:
	text "¿Vas a la Liga"
	line "#mon, verdad?"

	para "El Alto Mando es"
	line "muy fuerte, ¡y ya"
	cont "te está esperando!"
	done
