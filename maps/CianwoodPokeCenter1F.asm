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

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Chuck!"

	para "Chuck is said to"
	line "really like sweet"
	cont "desserts."

	para "However, he has"
	line "also been seen"

	para "training under a"
	line "heavy waterfall"
	cont "to work them off."
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
	line "del Gimnasio de"
	cont "aquí son todos"
	cont "unos machotes."

	para "Si me acerco por"
	line "allí, ¡podrían ir"
	cont "a por mí!"

	para "Un consejo: el"
	line "Líder de Gimnasio"
	cont "usa el tipo Lucha."

	para "Confúndelo con"
	line "#mon Psíquicos."

	para "Derrótalos antes"
	line "de que usen su"
	cont "fuerza física."
	
	para "¿Y las rocas del"
	line "medio del Gim.?"

	para "Si no las mueves"
	line "bien, no llegarás"
	cont "hasta el Líder."

	para "Si te atascas,"
	line "sal un momento."
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
	text "¡<PLAYER>! ¡Has"
	line "ganado! ¡Lo supe"
	cont "con solo mirarte!"
	done

CianwoodPokeCenter1FLassText:
	text "¿Conociste al"
	line "#maníaco?"

	para "Siempre presume"
	line "de sus #mon"
	cont "raros."
	done

CianwoodPokeCenter1FSuperNerdText:
	text "Me encanta lucir a"
	line "los #mon que he"
	cont "criado. ¿Y a ti?"

	para "¡Voy a luchar en"
	line "muchos combates y"
	cont "presumir de mis"
	cont "#mon!"
	done

CianwoodPokeCenter1FRichBoyText:
	text "No hay Tienda"
	line "#mon aquí,"

	para "así que traemos"
	line "los productos del"
	cont "otro lado del mar."
	done
