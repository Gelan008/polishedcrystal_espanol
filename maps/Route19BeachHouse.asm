Route19BeachHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_19, 2
	warp_event  3,  7, ROUTE_19, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19BeachHouseVictorScript, -1
	object_event  6,  4, SPRITE_SURFING_PIKACHU, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route19BeachHouseSurfingPikachuScript, -1

	object_const_def
	const ROUTE19BEACHHOUSE_VICTOR

Route19BeachHouseVictorScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_VICTOR
	iftruefwd .AfterScript
	writetext .GreetingText
	waitbutton
	special CheckForSurfingPikachu
	iffalsefwd .NoPikachu
	writetext .ChallengeText
	yesorno
	iffalsefwd .NoBattle
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE19BEACHHOUSE_VICTOR
	loadtrainer VICTOR, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_VICTOR
	opentext
.AfterScript:
	jumpopenedtext .AfterText

.NoPikachu:
	jumpopenedtext .NoPikachuText

.NoBattle:
	jumpopenedtext .NoBattleText

.GreetingText:
	text "¡Hola, colega! Mi"
	line "nombre es Víctor."

	para "Me encanta hacer"
	line "Surf, ¡y a Puka"
	cont "también!"

	para "¡Es mi Pikachu!"
	done

.ChallengeText:
	text "¡Uau!"

	para "¡Tu Pikachu sabe"
	line "hacer Surf! Así"
	cont "que no estoy solo…"

	para "¡Te has ganado el"
	line "derecho a combatir"
	cont "contra Puka y"
	cont "contra mí!"

	para "¿Aceptas el reto?"
	done

.SeenText:
	text "¡El mar nos une a"
	line "los surfistas!"
	cont "¡Vamos allá!"
	done

.BeatenText:
	text "¡Sabía que serías"
	line "capaz!"
	done

.AfterText:
	text "Oí que en Johto"
	line "algunos Pikachu"
	cont "aprendieron a"
	cont "surfear solos."

	para "Tal vez el mío"
	line "venga de allí."

	para "Hallé a Puka en la"
	line "orilla hace años y"
	cont "desde entonces"
	cont "estamos muy unidos"
	done

.NoPikachuText:
	text "You can do it,"
	line "too!"

	para "Go out there and"
	line "find a Surfing"
	cont "Pikachu!"

	para "Show me that you"
	line "love Surfing too!"
	done

.NoBattleText:
	text "Vaya, hombre. ¡Ven"
	line "a surfear cuando"
	cont "quieras, colega!"
	done

Route19BeachHouseSurfingPikachuScript:
	faceplayer
	showcrytext .Text, PIKACHU
	end

.Text:
	text "Puka: ¡Pi-kaaa!"
	done