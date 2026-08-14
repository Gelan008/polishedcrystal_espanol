OlivineGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuyScript, -1
	object_event  3, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, OlivineGymGentlemanPreston, EVENT_OLIVINE_GYM_JASMINE
	object_event  6,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, OlivineGymLassConnie, EVENT_OLIVINE_GYM_JASMINE

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftruefwd .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	givebadge MINERALBADGE, JOHTO_REGION
	clearevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setmapscene ROUTE_42, SCENE_ROUTE42_LYRA
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue_jumpopenedtext Jasmine_GoodLuck
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegivetmhm TM_IRON_TAIL
	setevent EVENT_GOT_TM23_IRON_TAIL
	jumpthisopenedtext

	text "…Podrías usar"
	line "esa MT para ense-"
	cont "ñar Cola Férrea."
	done

OlivineGymGuyScript:
	checkevent EVENT_BEAT_JASMINE
	iftrue_jumptextfaceplayer OlivineGymGuyWinText
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse_jumptextfaceplayer OlivineGymGuyPreText
	jumpthistextfaceplayer

	text "Yasmina usa el"
	line "recién descubierto"
	cont "tipo Acero."

	para "No sé gran cosa"
	line "sobre él."
	done

OlivineGymLassConnie:
	trainer 0, 0, EVENT_SPOKE_TO_LASS_CONNIE, .SeenText, 0, 0, .Script

.Script:
	endifjustbattled
	checkevent EVENT_BEAT_JASMINE
	iftrue_jumptextfaceplayer .AfterText
	jumpthistextfaceplayer

.SeenText:
	text "Je, je… Ya sé de"
	line "lo que eres capaz"

	para "por lo que hiciste"
	line "en el Faro."

	para "¡Es hora de que se"
	line "lo demuestres a"
	cont "Yasmina!"

	para "¡Buena suerte!"
	done

.AfterText:
	text "Eres increíble…"
	line "Deberías apuntar"

	para "aún más alto con"
	line "ese potencial."

	para "¿Has estado en"
	line "Pueblo Caoba?"
	done

OlivineGymGentlemanPreston:
	trainer 0, 0, EVENT_SPOKE_TO_GENTLEMAN_PRESTON, .SeenText, 0, 0, .Script

.Script:
	endifjustbattled
	checkevent EVENT_BEAT_JASMINE
	iftrue_jumptextfaceplayer .AfterText
	jumpthistextfaceplayer

.SeenText:
	text "Sabía que ven-"
	line "drías aquí."

	para "Gracias por ayudar"
	line "a la Líder de"
	cont "Gimnasio,"

	para "pero un combate es"
	line "asunto aparte."

	para "¡A por todas!"
	done

.AfterText:
	text "¡Impresionante!"
	line "Deberías ganar más"

	para "Medallas con tanta"
	line "habilidad."
	done

OlivineGymStatue:
	gettrainername JASMINE, 1, STRING_BUFFER_4
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftruefwd .Returned
	jumpstd gymstatue0
.Returned
	checkflag ENGINE_MINERALBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten
	readvar VAR_BADGES
	ifgreater 13, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

Jasmine_SteelTypeIntro:
	text "…Gracias por tu"
	line "ayuda en el Faro…"

	para "Pero esto es dis-"
	line "tinto. Permíteme"
	cont "presentarme."

	para "Soy Yasmina, Líder"
	line "de Gimnasio. Uso"
	cont "el tipo Acero."

	para "…¿Conoces el"
	line "tipo Acero?"

	para "Son muy duros,"
	line "fríos, afilados y"
	cont "muy fuertes."

	para "…Mmm… ¿Podemos"
	line "empezar?"
	done

Jasmine_BetterTrainer:
	text "…Eres mejor"
	line "entrenador que yo,"

	para "tanto en habilidad"
	line "como en bondad."

	para "Siguiendo las nor-"
	line "mas de la Liga, te"
	cont "hago entrega de"
	cont "esta Medalla."
	done

Jasmine_BadgeSpeech:
	text "Con esa Medalla,"
	line "los #mon hasta"

	para "el <LV>70, incluso"
	line "intercambiados,"

	para "te obedecerán sin"
	line "protestar."

	para "…Mmm… Por favor,"
	line "toma esto también…"
	done

Jasmine_GoodLuck:
	text "Mmm… No sé cómo"
	line "decir esto, pero…"
	cont "buena suerte…"
	done

OlivineGymGuyWinText:
	text "¡Ha sido aluci-"
	line "nante!"

	para "El tipo Acero,"
	line "¿eh?"

	para "¡Ha sido un en-"
	line "cuentro en la ter-"
	cont "cera fase!"
	done

OlivineGymGuyPreText:
	text "Yasmina, la Líder"
	line "de Gimnasio, está"
	cont "en el Faro."

	para "Ha estado cuidando"
	line "a un #mon"
	cont "enfermo."

	para "Un buen entrenador"
	line "también debe tener"
	cont "compasión."
	done
