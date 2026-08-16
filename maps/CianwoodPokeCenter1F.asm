CianwoodPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, CIANWOOD_CITY, 3
	warp_event  6,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalChuckScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  6,  3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuyScript, -1
	object_event  1,  5, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodPokeCenter1FLassText, -1
	object_event  9,  7, SPRITE_JUGGLER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodPokeCenter1FSuperNerdText, -1
	object_event 11,  5, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodPokeCenter1FRichBoyText, -1

PokemonJournalChuckScript:
	setflag ENGINE_READ_CHUCK_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Edición especial:"
	line "¡Líder Aníbal!"

	para "Se dice que a"
	line "Aníbal le encantan"
	cont "los postres"
	cont "dulces."

	para "Sin embargo,"
	line "también se le ha"

	para "visto entrenando"
	line "bajo una pesada"
	cont "cascada para ba-"
	cont "jarlos."
	done

CianwoodGymGuyScript:
	checkevent EVENT_GOT_HM04_STRENGTH
	iffalsefwd .no_strength
	checkevent EVENT_BEAT_CHUCK
	iftrue_jumptextfaceplayer .WinText
	jumptextfaceplayer .Text

.no_strength
	faceplayer
	opentext
	writetext .Text
	waitbutton
	writetext .StrengthText1
	promptbutton
	verbosegivetmhm HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
	writetext .StrengthText2
	waitendtext

.Text:
	text "Los entrenadores"
	line "del Gimnasio #"
	cont "mon de aquí son"
	cont "unos machitos."

	para "Si me quedo por"
	line "aquí, podrían ir"
	cont "a por mí."

	para "Aquí tienes un"
	line "consejo: el Líder"

	para "del Gimnasio usa"
	line "el tipo Lucha."

	para "Así que deberías"
	line "confundirlo con"
	cont "#mon Psíquicos."

	para "Acaba con sus"
	line "#mon antes de"
	cont "que puedan usar"
	cont "su fuerza física."
	
	para "¿Y esas rocas"
	line "en el medio del"
	cont "Gimnasio?"

	para "Si no las mueves"
	line "correctamente,"

	para "no llegarás al"
	line "Líder."

	para "Si te quedas"
	line "atrapado, sal"
	cont "fuera."
	done

.StrengthText1:
	text "¿No puedes"
	line "apartar las rocas?"

	para "¡Toma, usa esto"
	line "y enseña Fuerza"
	cont "a tus #mon!"
	done

.StrengthText2:
	text "¡Buena suerte!"
	done

.WinText:
	text "¡<PLAYER>! ¡Ga-"
	line "naste! ¡Me he dado"
	cont "cuenta con solo"
	cont "mirarte!"
	done

CianwoodPokeCenter1FLassText:
	text "¿Conociste al"
	line "#maníaco?"

	para "Siempre está pre-"
	line "sumiendo de sus"
	cont "#mon raros."
	done

CianwoodPokeCenter1FSuperNerdText:
	text "Me encanta pre-"
	line "sumir de los"

	para "#mon que he"
	line "criado. ¿A ti no?"

	para "¡Voy a meterme en"
	line "un montón de"

	para "combates y a pre-"
	line "sumir de mis"
	cont "#mon!"
	done

CianwoodPokeCenter1FRichBoyText:
	text "No hay Tienda"
	line "#mon aquí,"

	para "así que tenemos"
	line "que importar pro-"
	cont "ductos del otro"
	cont "lado del mar."
	done
