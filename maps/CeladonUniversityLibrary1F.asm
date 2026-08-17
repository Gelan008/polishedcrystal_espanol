CeladonUniversityLibrary1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6, 11, CELADON_UNIVERSITY_1F, 4
	warp_event  7, 11, CELADON_UNIVERSITY_1F, 4
	warp_event  7,  0, CELADON_UNIVERSITY_LIBRARY_2F, 1

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FSignpost1Text
	bg_event 10,  0, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FSignpost2Text
	bg_event  0,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf1Text
	bg_event  1,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf2Text
	bg_event  2,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf3Text
	bg_event  3,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf4Text
	bg_event  4,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf5Text
	bg_event  5,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf6Text
	bg_event  0,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf7Text
	bg_event  1,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf8Text
	bg_event  2,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf9Text
	bg_event  3,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf10Text
	bg_event  4,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf11Text
	bg_event  5,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf12Text

	def_object_events
	object_event  6,  3, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FLadyText, -1
	object_event 11,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FGentlemanText, -1
	object_event  0,  5, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FCooltrainerfText, -1
	object_event  9,  5, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonUniversityLibrary1FGameboyKidScript, -1
	object_event  3,  8, SPRITE_MATRON, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FPokefan_fText, -1
	object_event 11,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CeladonUniversityLibrary1FCooltrainermScript, -1
	object_event  2, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FTeacherText, -1
	object_event 10,  7, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CeladonUniversityLibrary1FBookText, -1

CeladonUniversityLibrary1FLadyText:
	text "La biblioteca está"
	line "en el campus,"
	cont "pero está abierta"
	cont "a todo el mundo."

	para "¿No es genial?"
	done

CeladonUniversityLibrary1FGentlemanText:
	text "¡Shh! ¿No ves que"
	line "estoy leyendo?"
	done

CeladonUniversityLibrary1FCooltrainerfText:
	text "El Prof. Oak solía"
	line "enseñar aquí, así"

	para "que la biblioteca"
	line "tiene todos sus"
	cont "artículos."

	para "¡Me los he leído"
	line "de cabo a rabo!"
	done

CeladonUniversityLibrary1FGameboyKidScript:
	showtextfaceplayer .Text
	turnobject LAST_TALKED, DOWN
	end

.Text:
	text "Mi #dex tiene"
	line "una mejora."

	para "¡Juego al Tetris!"
	done

CeladonUniversityLibrary1FPokefan_fText:
	text "Tenemos acuerdo"
	line "de préstamo con la"
	cont "Biblioteca Canal"
	cont "en Sinnoh."
	done

CeladonUniversityLibrary1FCooltrainermScript:
	checkevent EVENT_GOT_FOCUS_BAND_IN_UNIVERSITY
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem FOCUS_BAND
	iffalse_endtext
	setevent EVENT_GOT_FOCUS_BAND_IN_UNIVERSITY
	jumpopenedtext .Text2

.Text1:
	text "Pronto tengo un"
	line "examen importante,"
	cont "así que me quedaré"
	cont "aquí un buen rato."

	para "Solo tengo que"
	line "aguantar un poco."

	para "Esto es lo que me"
	line "ayuda."
	done

.Text2:
	text "Si quieres que tus"
	line "#mon aguanten,"
	cont "dales una"
	cont "Cinta Focus."
	done

CeladonUniversityLibrary1FTeacherText:
	text "Soy la encargada"
	line "de la biblioteca."

	para "Si necesitas algo,"
	line "dímelo."

	para "En voz baja, eso"
	line "sí. ¡Esto ES una"
	cont "biblioteca!"
	done

CeladonUniversityLibrary1FBookText:
	text "Es un libro de"
	line "arreglos florales."

	para "Hay un Sunflora en"
	line "la portada."
	done

CeladonUniversityLibrary1FSignpost1Text:
	text "Por favor, no"
	line "molestar a los"

	para "estudiantes que"
	line "estén leyendo."
	done

CeladonUniversityLibrary1FSignpost2Text:
	text "Por favor, no"
	line "traer comida ni"

	para "bebida a la"
	line "biblioteca."
	done

CeladonUniversityLibrary1FBookshelf1Text:
	text "¿Eh? Alguien dejó"
	line "una vieja foto en"
	cont "este libro."

	para "Erika y un señor"
	line "muy amable posan"
	cont "junto a un Oddish."
	done

CeladonUniversityLibrary1FBookshelf2Text:
	text "Es un álbum con un"
	line "montón de fotos de"
	cont "#mon."

	para "En la portada pone"
	line "“El portfolio de"
	cont "Todd Snap”."
	done

CeladonUniversityLibrary1FBookshelf3Text:
	text "Es un libro sobre"
	line "un hombre que"
	cont "enseñó a sus"
	cont "#mon a tocar"
	cont "música."

	para "¡Parecen los"
	line "mejores amigos!"
	done

CeladonUniversityLibrary1FBookshelf4Text:
	text "Es un libro sobre"
	line "los palíndromos"
	cont "de #mon."

	para "Hay un Eevee y"
	line "un Girafarig"
	cont "en la portada."
	done

CeladonUniversityLibrary1FBookshelf5Text:
	text "Trata de #mon"
	line "de juguete que"
	cont "cobran vida al ser"
	cont "girados con una"
	cont "Llave Milagrosa."

	para "Son muy monos."
	done

CeladonUniversityLibrary1FBookshelf6Text:
	text "Es un libro de una"
	line "marioneta #mon"
	cont "que no puede decir"
	cont "mentiras."

	para "En la portada pone"
	line "“Pinpokéo”."
	done

CeladonUniversityLibrary1FBookshelf7Text:
	text "Es un lib…"
	line "espera…"

	para "¡Es un videojuego!"

	para "Luce en la portada"
	line "un gran pinball de"
	cont "#mon."
	done

CeladonUniversityLibrary1FBookshelf8Text:
	text "Es un libro de un"
	line "Gurú Pescador con"
	cont "consejos para"
	cont "pescadores."

	para "En la portada pone"
	line "“Cañas y Rarezas”."
	done

CeladonUniversityLibrary1FBookshelf9Text:
	text "Es un manual que"
	line "explica el Juego"
	cont "de Cartas"
	cont "Coleccionables."
	done

CeladonUniversityLibrary1FBookshelf10Text:
	text "¡Es un libro de"
	line "recetas temáticas"
	cont "de #mon!"

	para "Gelatina de"
	line "Jigglypuff, Salsa"
	cont "de Charmander,"
	cont "Snacks Munchlax…"
	done

CeladonUniversityLibrary1FBookshelf11Text:
	text "Es una guía para"
	line "mezclar Pokos."

	para "Un Criador #mon"
	line "famoso está en la"
	cont "portada."
	done

CeladonUniversityLibrary1FBookshelf12Text:
	text "“La vida secreta"
	line "de la risa” por"
	cont "Joe King."
	cont "¡De chiste!"
	done
