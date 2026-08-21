CeladonUniversityClassroom2_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_1F, 7
	warp_event  3, 11, CELADON_UNIVERSITY_1F, 7

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2BlackboardText
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2BlackboardText
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2BlackboardText
	bg_event  6,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2Bookshelf1Text
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2Bookshelf2Text

	def_object_events
	object_event  2,  1, SPRITE_BLANCHE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2BlancheText, -1
	object_event  2,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << EVE) | (1 << NITE), PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2TeacherText, -1
	object_event  4,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2YoungsterText, -1
	object_event  2,  7, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2ChildText, -1
	object_event  5,  7, SPRITE_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2LadyText, -1
	object_event  3,  9, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonUniversityClassroom2CooltrainermScript, -1

CeladonUniversityClassroom2BlancheText:
	text "Soy Blanche."
	line "Enseño historia"
	cont "aquí."

	para "Debemos aprender"
	line "de la historia,"
	cont "o estaremos"

	para "condenados a"
	line "repetirla."
	done

CeladonUniversityClassroom2TeacherText:
	text "Me temo que"
	line "Blanche no está"
	cont "disponible."

	para "Solo da clases"
	line "por el día."
	done

CeladonUniversityClassroom2YoungsterText:
	text "¡Hojeando mis"
	line "apuntes a la"
	cont "velocidad de…"

	para "¡AY!"

	para "Me he cortado…"
	done

CeladonUniversityClassroom2ChildText:
	text "El Prof. Westwood"
	line "nos dio una clase"
	cont "sobre sus aportes"
	cont "a la #dex."

	para "¡Dicen que hacia"
	line "el final le dio"
	cont "pereza e inventó"
	cont "la mitad!"
	done

CeladonUniversityClassroom2LadyText:
	text "¿Eres de Johto?"
	line "¡Esa región tiene"
	cont "una historia"
	cont "fascinante!"
	done

CeladonUniversityClassroom2CooltrainermScript:
	showtext .Text1
	showtextfaceplayer .Text2
	turnobject LAST_TALKED, UP
	end

.Text1: ; text > text
	text "…Zzz…"
	line "Aah!"
	done

.Text2:
	text "Ejem."

	para "Perdona…"
	line "Me asustaste."

	para "Me quedé despierto"
	line "hasta tarde para"
	cont "acabar un trabajo,"
	cont "y estoy agotado."
	done

CeladonUniversityClassroom2BlackboardText:
	text "Cronología de la"
	line "historia:"

	para "Hace 400 años:"
	line "Se inventó el"
	cont "movimiento Tóxico."

	para "Hace 71 años:"
	line "Se desarrolló la"
	cont "# Ball moderna."

	para "Hace 27 años:"
	line "Primer alunizaje"
	cont "en la Luna."

	para "Hace tres años:"
	line "Se creó el primer"
	cont "#mon virtual."

	para "“Hipótesis: la"
	line "tecnología crece"
	cont "exponencialmente”"

	done

CeladonUniversityClassroom2Bookshelf1Text:
	text "Es un libro sobre"
if DEF(FAITHFUL)
	line "cómo la Torre"
	cont "Latón de Iris se"
	cont "quemó hace 150"
	cont "años."
else
	line "cómo la Torre"
	cont "Latón de Iris se"
	cont "quemó hace 150"
	cont "años."
endc
	done

CeladonUniversityClassroom2Bookshelf2Text:
	text "Es un libro de"
	line "jerga de los 80."
	cont "¡Qué fuerte!"
	done
