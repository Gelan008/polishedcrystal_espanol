SnowtopMountainInside_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SnowtopMountainInsideFixFacing

	def_warp_events
	warp_event  9, 29, RUGGED_ROAD_NORTH, 1
	warp_event 27, 29, SNOWTOP_MOUNTAIN_OUTSIDE, 1
	warp_event 26,  4, HIDDEN_CAVE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 26,  3, BGEVENT_JUMPSTD, cavegrotto, HIDDENGROTTO_SNOWTOP_MOUNTAIN_INSIDE
	bg_event  6, 22, BGEVENT_ITEM + ZINC, EVENT_SNOWTOP_MOUNTAIN_INSIDE_HIDDEN_ZINC

	def_object_events
	object_event 28, 14, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_AZURE, OBJECTTYPE_SCRIPT, 0, KimonoGirlAmiScript, -1
	object_event  5, 20, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SnowtopMountainInsideSkierScript, -1
	itemball_event  8,  8, ETHER, 1, EVENT_SNOWTOP_MOUNTAIN_INSIDE_ETHER
	itemball_event 16,  9, HEAVY_BOOTS, 1, EVENT_SNOWTOP_MOUNTAIN_INSIDE_HEAVY_BOOTS
	itemball_event 31, 17, COVERT_CLOAK, 1, EVENT_SNOWTOP_MOUNTAIN_INSIDE_COVERT_CLOAK

	object_const_def
	const SNOWTOPMOUNTAININSIDE_KIMONO_GIRL

SnowtopMountainInsideFixFacing:
	callasm .FixFacing
	endcallback

.FixFacing:
	ld hl, wPrevWarp
	ld a, [hli]
	dec a ; warp #1 of SNOWTOP_MOUNTAIN_OUTSIDE comes here
	ret nz
	assert wPrevWarp + 1 == wPrevMapGroup
	ld a, [hli]
	cp GROUP_SNOWTOP_MOUNTAIN_OUTSIDE
	ret nz
	assert wPrevMapGroup + 1 == wPrevMapNumber
	ld a, [hl]
	cp MAP_SNOWTOP_MOUNTAIN_OUTSIDE
	ret nz
	ld a, [wPlayerSpriteSetupFlags]
	or (1 << 5) | UP
	ld [wPlayerSpriteSetupFlags], a
	ret

KimonoGirlAmiScript:
	checkevent EVENT_GOT_PP_MAX_FROM_KIMONO_GIRL_AMI
	iftrue_jumptextfaceplayer .OutroText
	faceplayer
	checkevent EVENT_BEAT_KIMONO_GIRL_AMI
	iftruefwd .Beaten
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse_jumptext .IntroText
	showtext .SeenText
	winlosstext .BeatenText, 0
	setlasttalked SNOWTOPMOUNTAININSIDE_KIMONO_GIRL
	loadtrainerwithpal KIMONO_GIRL, AMI, TRAINERPAL_AMI
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KIMONO_GIRL_AMI
.Beaten:
	opentext
	writetext .AfterText
	promptbutton
	verbosegiveitem PP_MAX
	iffalse_endtext
	setevent EVENT_GOT_PP_MAX_FROM_KIMONO_GIRL_AMI
	jumpthisopenedtext

.OutroText:
	text "Mis primas y yo"
	line "bailamos en Ciudad"
	cont "Iris, pero tam-"

	para "bién se nos conoce"
	line "por viajar."
	done

.IntroText:
	text "Soy una Chica del"
	line "Kimono."

	para "¿No has conocido a"
	line "mis cinco primas"

	para "bailarinas en Ciu-"
	line "dad Iris?"

	para "Avísame si las ves."
	done

.SeenText:
	text "Si me pusiera a"
	line "bailar aquí, mis"

	para "sandalias resba-"
	line "larían o se que-"
	cont "darían pegadas al"
	cont "hielo."

	para "¡Por tanto, mejor"
	line "luchemos!"
	done

.BeatenText:
	text "Oh, eres temi-"
	line "ble…"
	done

.AfterText:
	text "Eres un Entrenador"
	line "muy equilibrado."

	para "¡Por favor, haz"
	line "buen uso de este"
	cont "objeto!"
	done

SnowtopMountainInsideSkierScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_ICY_WIND_INTRO
	iftruefwd SnowtopMountainInsideTutorIcyWindScript
	writetext SnowtopMountainInsideSkierText
	waitbutton
	setevent EVENT_LISTENED_TO_ICY_WIND_INTRO
SnowtopMountainInsideTutorIcyWindScript:
	writetext Text_SnowtopMountainInsideTutorIcyWind
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_SnowtopMountainInsideTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval ICY_WIND
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_SnowtopMountainInsideTutorRefused

.NoSilverLeaf
	jumpthisopenedtext
text "¡Vaya! Pero no"
	line "tienes ninguna"
	cont "Hoja Plata."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Listo! ¡Ahora tu"
	line "#mon sabe"
	cont "Viento Hielo!"
	done

SnowtopMountainInsideSkierText:
	text "El viento y el"
	line "granizo del cañón"

	para "hacen daño si no"
	line "vas preparado pal"
	cont "frío glacial."

	para "¡Sería una gran"
	line "técnica para un"
	cont "#mon!"
	done

Text_SnowtopMountainInsideTutorIcyWind:
	text "Enseñaré a uno de"
	line "tus #mon a usar"

	para "Viento Hielo si"
	line "me das una Hoja"
	cont "Plata."
	done

Text_SnowtopMountainInsideTutorQuestion:
	text "¿Quieres que le"
	line "enseñe a tu #-"
	cont "mon Viento Hielo?"
	done

Text_SnowtopMountainInsideTutorRefused: ; text > text
	text "¡Brrr!…"
	done
