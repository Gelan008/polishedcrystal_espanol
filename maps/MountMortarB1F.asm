MountMortarB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  3, MOUNT_MORTAR_1F_INSIDE, 5
	warp_event 19, 29, MOUNT_MORTAR_1F_OUTSIDE, 7

	def_coord_events

	def_bg_events
	bg_event  4,  6, BGEVENT_ITEM + MAX_REVIVE, EVENT_MOUNT_MORTAR_B1F_HIDDEN_MAX_REVIVE

	def_object_events
	object_event 11, 31, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortarB1FHikerScript, -1
	object_event 16,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortarB1FKiyoScript, -1
	strengthboulder_event  9, 10
	itemball_event 29, 12, HYPER_POTION, 1, EVENT_MOUNT_MORTAR_B1F_HYPER_POTION
	itemball_event  4, 16, CARBOS, 1, EVENT_MOUNT_MORTAR_B1F_CARBOS
	itemball_event 34, 24, PROTECTOR, 1, EVENT_MOUNT_MORTAR_B1F_PROTECTOR
	itemball_event 32,  3, MAX_ETHER, 1, EVENT_MOUNT_MORTAR_B1F_MAX_ETHER
	itemball_event 21, 26, PP_UP, 1, EVENT_MOUNT_MORTAR_B1F_PP_UP

MountMortarB1FHikerScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_DEFENSE_CURL_INTRO
	iftruefwd MountMortarB1FTutorDefenseCurlScript
	writetext MountMortarB1FHikerText
	waitbutton
	setevent EVENT_LISTENED_TO_DEFENSE_CURL_INTRO
MountMortarB1FTutorDefenseCurlScript:
	writetext Text_MountMortarB1FTutorDefenseCurl
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_MountMortarB1FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval DEFENSE_CURL
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Aquí me quedo"
	line "esperando."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Vaya, no tienes"
	line "ninguna Hoja"
	cont "Plata."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Listo! ¡Ahora tu"
	line "#mon sabe usar"
	cont "Rizo Defensa!"
	done

MountMortarB1FKiyoScript:
	checkevent EVENT_GOT_TYROGUE_FROM_KIYO
	iftrue_jumptextfaceplayer MountMortarB1FKiyoGotTyrogueText
	faceplayer
	checkevent EVENT_BEAT_KIYO
	iftruefwd .BeatKiyo
	showtext MountMortarB1FKiyoIntroText
	winlosstext MountMortarB1FKiyoWinText, 0
	loadtrainer KARATE_KING, KIYO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KIYO
.BeatKiyo:
	opentext
	writetext MountMortarB1FTyrogueRewardText
	promptbutton
	waitsfx
	givepoke TYROGUE, PLAIN_FORM, 10, NO_ITEM, PREMIER_BALL
	iffalse_jumpopenedtext MountMortarB1FKiyoFullPartyAndBoxText
	setevent EVENT_GOT_TYROGUE_FROM_KIYO
	jumpthisopenedtext

MountMortarB1FKiyoGotTyrogueText:
	text "Tyrogue es de tipo"
	line "Lucha."

	para "Se convertirá en"
	line "un #mon fuerte."

	para "¡Sigue trabajando"
	line "duro! Yo también"
	cont "entrenaré más."

	para "¡Hasta la vista!"
	done

MountMortarB1FHikerText:
	text "Mi #mon usó"
if DEF(FAITHFUL)
	line "Golpe Roca en una"
else
	line "Demolición en una"
endc
	cont "roca, pero no le"
	cont "hizo nada."

	para "¡Resultó ser un"
	line "Geodude que usó"
	cont "Rizo Defensa!"
	done

Text_MountMortarB1FTutorDefenseCurl:
	text "Puedo enseñar a"
	line "tu #mon a usar"
	cont "Rizo Defensa por"
	cont "una Hoja Plata."
	done

Text_MountMortarB1FTutorQuestion:
	text "¿Quieres que le"
	line "enseñe Rizo"
	cont "Defensa a tu"
	cont "#mon?"
	done

MountMortarB1FKiyoIntroText:
	text "¡Eh!"

	para "¡Soy el Rey del"
	line "Kárate!"

	para "¡Entreno solo aquí"
	line "en la oscuridad!"

	para "¡Tú!"
	line "¡Lucha conmigo!"

	para "¡Hwaaarggh!"
	done

MountMortarB1FKiyoWinText:
	text "¡Waaaarggh!"
	line "¡He perdido!"
	done

MountMortarB1FTyrogueRewardText:
	text "Estoy… destrozado…"

	para "Mi entrenamiento"
	line "aún no es"
	cont "suficiente…"

	para "Pero una derrota"
	line "es una derrota."
	cont "Lo admito."

	para "Como prueba de tu"
	line "victoria, te daré"
	cont "un raro #mon."
	done

MountMortarB1FKiyoFullPartyAndBoxText:
	text "¡No tienes sitio"
	line "ni en tu equipo"
	cont "ni en la Caja!"
	done
