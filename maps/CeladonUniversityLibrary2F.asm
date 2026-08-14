CeladonUniversityLibrary2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  0, CELADON_UNIVERSITY_LIBRARY_1F, 3

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FSignpost1Text
	bg_event 10,  0, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FSignpost2Text
	bg_event  0,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf1Text
	bg_event  1,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf2Text
	bg_event  2,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf3Text
	bg_event  3,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf4Text
	bg_event  4,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf5Text
	bg_event  5,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf6Text
	bg_event  8,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf7Text
	bg_event  9,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf8Text
	bg_event 10,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf9Text
	bg_event 11,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf10Text
	bg_event 12,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf11Text
	bg_event 13,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf12Text
	bg_event  6,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf13Text
	bg_event  7,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf14Text
	bg_event  8,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf15Text
	bg_event  9,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf16Text
	bg_event 10,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf17Text
	bg_event 11,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf18Text
	bg_event 12,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf19Text
	bg_event 13,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf20Text
	bg_event  1,  6, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer1
	bg_event  3,  6, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer2
	bg_event  1,  8, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer3
	bg_event  3,  8, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer1
	bg_event  1, 10, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer1
	bg_event  3, 10, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer4

	def_object_events
	object_event  3,  4, SPRITE_COSPLAYER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FCosplayerText, -1
	object_event 11,  5, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FLassText, -1
	object_event  0,  9, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityLibrary2FArtistScript, -1
	object_event  2, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FSuper_nerdText, -1
	object_event  8, 11, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FCooltrainerfText, -1
	object_event 11, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FYoungsterText, -1
	itemball_event  0,  1, TIMER_BALL, 1, EVENT_CELADON_UNIVERSITY_LIBRARY_2F_TIMER_BALL

CeladonUniversityLibrary2FCosplayerText:
	text "¡Es genial estar"
	line "en la ciudad!"

	para "Puedo usar mi cos-"
	line "play en público y"

	para "¡la gente ni si-"
	line "quiera pestañea!"
	done

CeladonUniversityLibrary2FLassText:
	text "Nunca juzgues un"
	line "libro por su por-"
	cont "tada."

	para "A veces incluso el"
	line "exterior más soso"

	para "puede ocultar las"
	line "mejores historias."
	done

CeladonUniversityLibrary2FArtistScript:
	showtext .Text1
	showtextfaceplayer .Text2
	turnobject LAST_TALKED, RIGHT
	end

.Text1:
	text "“Yasmina miró fi-"
	line "jamente los ojos"
	cont "marrones de"
	cont "Erika…”"
	done

.Text2:
	text "¿Eh? ¡Vete!"

	para "¡Es de mala edu-"
	line "cación leer por"
	cont "encima del hombro!"
	done

CeladonUniversityLibrary2FSuper_nerdText:
	text "¡El comando"
	line "“net send” mos-"

	para "trará un mensaje"
	line "en la pantalla del"
	cont "resto de ordena-"
	cont "dores!"

	para "Mmm, qué enviar…"

	para "“¡Pizza gratis en"
	line "la oficina del"
	cont "Prof. Westwood!”"

	para "Jejeje."
	done

CeladonUniversityLibrary2FCooltrainerfText:
	text "Este es mi libro."
	line "¡Y pienso LEERLO!"
	done

CeladonUniversityLibrary2FYoungsterText:
	text "Estoy leyendo so-"
	line "bre un #mon le-"
	cont "gendario"

	para "con el poder de"
	line "distorsionar el"
	cont "espacio."

	para "Da bastante"
	line "miedo…"
	done

CeladonUniversityLibrary2FBookshelf1Text:
	text "Es un libro que"
	line "contiene #mon"

	para "de un alfabeto"
	line "antiguo."

	para "Si tienes uno de"
	line "cada tipo, pueden"
	cont "conceder deseos."
	done

CeladonUniversityLibrary2FBookshelf2Text:
	text "Este libro se cae"
	line "a trozos."

	para "El título ya no"
	line "puede leerse,"

	para "pero hay una ima-"
	line "gen de un #mon"

	para "llevando una pesa-"
	line "da armadura."
	done

CeladonUniversityLibrary2FBookshelf3Text:
	text "Es un libro con un"
	line "candado gigante en"
	cont "la portada."

	para "Mejor lo dejas"
	line "tranquilo."
	done

CeladonUniversityLibrary2FBookshelf4Text:
	text "¡Este libro está"
	line "escrito en un"
	cont "idioma extranjero!"

	para "Mejor lo devuelvo"
	line "a su sitio…"
	done

CeladonUniversityLibrary2FBookshelf5Text:
	text "Detrás de estos"
	line "libros…"

	para "No. No hay nada"
	line "aquí."
	done

CeladonUniversityLibrary2FBookshelf6Text:
	text "Es un libro sobre"
	line "#mon que tienen"

	para "diferencias regio-"
	line "nales."

	para "Hay una imagen"
	line "de un Raichu que"
	cont "se ve un tanto"
	cont "extraño…"
	done

CeladonUniversityLibrary2FBookshelf7Text:
	text "Es un libro sobre"
	line "los Concursos"
	cont "#mon."

	para "En la portada sale"
	line "un edificio de as-"
	cont "pecto impresio-"
	cont "nante."
	done

CeladonUniversityLibrary2FBookshelf8Text:
	text "Se muestra a un"
	line "chico montando un"

	para "#mon en la"
	line "portada de este"
	cont "libro."

	para "“Cómo Entrenar A"
	line "Tu Dragonite”"
	cont "pone en negrita."
	done

CeladonUniversityLibrary2FBookshelf9Text:
	text "¡Es un libro sobre"
	line "un mundo habitado"

	para "exclusivamente por"
	line "#mon!"

	para "“Las Aventuras de"
	line "Pikachu en el"
	cont "#Parque”"

	para "está escrito en la"
	line "portada."
	done

CeladonUniversityLibrary2FBookshelf10Text:
	text "Es un libro sobre"
	line "una isla de rob-"
	cont "ots #mon gi-"
	cont "gantes."

	para "“Robótica #mon”"
	line "por Anne Droid…"
	done

CeladonUniversityLibrary2FBookshelf11Text:
	text "“Perdona y"
	line "Olvida” por Saul"
	cont "Goode."

	para "Hay un dibujo de"
	line "un hombre con una"
	cont "gran sonrisa."
	done

CeladonUniversityLibrary2FBookshelf12Text:
	text "“Ingravidez”"
	line "por Andy Gravity."
	cont "¡Suena volátil!"
	done

CeladonUniversityLibrary2FBookshelf13Text:
	text "Es un libro que"
	line "explica la biolo-"

	para "gía de los"
	line "#mon."

	para "¡Es enorme!"
	done

CeladonUniversityLibrary2FBookshelf14Text:
	text "Este libro está"
	line "cubierto de te-"
	cont "larañas."

	para "Parece que nadie"
	line "lo ha leído en"
	cont "mucho tiempo."
	done

CeladonUniversityLibrary2FBookshelf15Text:
	text "Es un libro"
	line "mostrando a un te-"
	cont "mible #mon."

	para "“Absofusión y el"
	line "Trío Tao”"

	para "está escrito con"
	line "letras gigantes."
	done

CeladonUniversityLibrary2FBookshelf16Text:
	text "“Antigua #mo-"
	line "polis: La Historia"

	para "de los #mon"
	line "Extintos”"

	para "¡Suena muy intere-"
	line "sante!"
	done

CeladonUniversityLibrary2FBookshelf17Text:
	text "Es un libro lla-"
	line "mado “Etiquetado:"

	para "El Misterio de"
	line "Sudowoodo”."
	done

CeladonUniversityLibrary2FBookshelf18Text:
	text "Es un libro sobre"
	line "un antiguo árbol"

	para "guardado por tres"
	line "titanes."

	para "Se ve casi má-"
	line "gico."
	done

CeladonUniversityLibrary2FBookshelf19Text:
	text "¡Es una copia de"
	line "la ruta original"
	cont "del Magnetotrén!"

	para "Muestra una parada"
	line "planeada en la"
	cont "Ciudad Iris."
	done

CeladonUniversityLibrary2FBookshelf20Text:
	text "Libros rojos,"
	line "libros azules,"
	cont "libros amarillos,"
	cont "libros verdes…"

	para "¡Libros de todos"
	line "los colores!"
	done

CeladonUniversityLibrary2FComputer1:
	jumpthistext

	text "Hay una pantalla"
	line "de inicio con"

	para "una imagen de un"
	line "Magikarp en el"
	cont "fondo."
	done

CeladonUniversityLibrary2FComputer2:
	jumpthistext

	text "¡Alguien olvidó"
	line "cerrar su sesión!"
	done

CeladonUniversityLibrary2FComputer3:
	jumpthistext

	text "Hay una historia"
	line "repleta de errores"
	cont "ortográficos y"
	cont "gramaticales."
	done

CeladonUniversityLibrary2FComputer4:
	jumpthistext

	text "Hay una web sobre"
	line "cómo ser un"
	cont "“l33t h4x0r”."
	done
