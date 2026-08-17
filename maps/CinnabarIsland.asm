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

	text "Para luchar contra"
	line "mí, enséñame tus"
	cont "Medallas de Kanto."

	para "¿Menos de siete?"
	line "Aún no estás listo"
	cont "para esto."
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
	para "Bueno, se nota que"
	line "eres entrenador…"

	para "Me llamo Azul."

	para "Fui el Campeón una"
	line "vez, aunque solo"
	cont "por poco tiempo…"

	para "El entrometido de"
	line "Rojo me venció…"

	para "En fin, ¿qué pasa?"
	line "¿Quieres retarme?"

	para "…No me apetece"
	line "luchar ahora."

	para "Mira a tu"
	line "alrededor…"

	para "Un volcán entra en"
	line "erupción y un"
	cont "pueblo entero se"
	cont "esfuma sin más."

	para "Podemos ganar o"
	line "perder combates,"
	cont "pero si la propia"
	cont "naturaleza ruge,"
	cont "podemos perderlo"
	cont "todo al instante."

	para "…"

	para "Así son las cosas…"

	para "Aun así, sigo"
	line "siendo entrenador."
endc
	done

CinnabarIslandBlueBattleText:
	text "Si veo un rival"
	line "fuerte, me dan"
	cont "ganas de luchar."
	done

CinnabarIslandBlueReadyText:
	text "Si quieres luchar"
	line "conmigo, ven al"
	cont "Gimnasio Verde."

	para "¡Allí aceptaré tu"
	line "desafío!"
	done


CinnabarIslandGymSignText:
	text "Hay un aviso:"

	para "“El Gimnasio de"
	line "Canela se mudó a"
	cont "las Islas Espuma.”"

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
	line "Canela duerme,"
	cont "¡pero está activo!"

	para "¡No entres al"
	line "volcán sin forma"
	cont "de escapar!"
	done
