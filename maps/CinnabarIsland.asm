CinnabarIsland_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CinnabarIslandFlyPoint

	def_warp_events
	warp_event 11, 15, CINNABAR_POKECENTER_1F, 1
	warp_event 18,  9, CINNABAR_VOLCANO_1F, 1
	warp_event  7,  7, POKEMON_MANSION_1F, 1

	def_coord_events

	def_bg_events
	bg_event  9, 15, BGEVENT_JUMPTEXT, CinnabarIslandGymSignText
	bg_event  9, 11, BGEVENT_JUMPTEXT, CinnabarIslandSignText
	bg_event 21, 11, BGEVENT_JUMPTEXT, CinnabarIslandVolcanoWarningSignText
	bg_event 11, 12, BGEVENT_ITEM + RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

	def_object_events
	object_event 20, 14, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
	itemball_event 22,  2, MAGMARIZER, 1, EVENT_CINNABAR_ISLAND_MAGMARIZER

	object_const_def
	const CINNABARISLAND_BLUE

CinnabarIslandFlyPoint:
	setflag ENGINE_FLYPOINT_CINNABAR
	endcallback

CinnabarIslandBlue:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_BLUE_INTRO
	iftruefwd .HeardIntro
	writetext CinnabarIslandBlueText
	waitbutton
	setevent EVENT_LISTENED_TO_BLUE_INTRO
.HeardIntro
	writetext CinnabarIslandBlueBattleText
	waitbutton
	readvar VAR_BADGES
	ifgreater 14, .Ready
	jumpthisopenedtext

	text "Si quieres luchar"
	line "contra mí, mués-"

	para "trame cuántas"
	line "Medallas de Kanto"
	cont "tienes."

	para "Menos de siete…"
	line "No estás pre-"
	cont "parado."
	done

.Ready
	writetext CinnabarIslandBlueReadyText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applyonemovement CINNABARISLAND_BLUE, teleport_from
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	end

CinnabarIslandBlueText:
	text "¿Quién eres tú?"

if !DEF(DEBUG)
	para "Bueno, está claro"
	line "que eres"
	cont "entrenador…"

	para "Me llamo Azul."

	para "Fui el Campeón una"
	line "vez, aunque solo"

	para "fuera por poco"
	line "tiempo…"

	para "El entrometido de"
	line "Rojo me venció…"

	para "Como sea, ¿qué"
	line "quieres? ¿Quieres"

	para "desafiarme o"
	line "algo así?"

	para "…Odio decirlo,"
	line "pero ahora no"

	para "tengo ganas de"
	line "combatir."

	para "Echa un buen vis-"
	line "tazo a tu"
	cont "alrededor…"

	para "Un volcán entra en"
	line "erupción, y así,"

	para "sin más, un pueblo"
	line "entero desaparece."

	para "Podemos seguir"
	line "ganando y perdi-"
	cont "endo en #mon,"

	para "pero si la natu-"
	line "raleza se queja,"

	para "podemos perderlo"
	line "todo en un segundo"

	para "…"

	para "Así son las"
	line "cosas…"

	para "Pero bueno, sigo"
	line "siendo entrenador."
endc
	done

CinnabarIslandBlueBattleText:
	text "Si veo un opo-"
	line "nente fuerte, me"
	cont "entran ganas de"
	cont "luchar."
	done

CinnabarIslandBlueReadyText:
	text "Si quieres comba-"
	line "tir conmigo, ven"
	cont "al Gimnasio de"
	cont "Ciudad Verde."

	para "Allí me enfrenta-"
	line "ré a ti."
	done


CinnabarIslandGymSignText:
	text "Hay un aviso"
	line "aquí…"

	para "“El Gimnasio"
	line "Canela se ha tras-"
	cont "ladado a las Islas"
	cont "Espuma.”"

	para "-- Blaine"
	done

CinnabarIslandSignText:
	text "Isla Canela"

	para "El fiero pueblo de"
	line "los deseos"
	cont "ardientes"
	done

CinnabarIslandVolcanoWarningSignText:
	text "PRECAUCION"

	para "El Volcán de Isla"
	line "Canela está"
	cont "dormido, ¡pero"
	cont "aún activo!"

	para "¡No entres al"
	line "volcán sin forma"
	cont "de escapar!"
	done
