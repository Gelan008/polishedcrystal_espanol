CeladonCafe_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  7, CELADON_CITY, 9
	warp_event  7,  7, CELADON_CITY, 9

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_JUMPTEXT, EatathonContestPosterText
	bg_event  7,  1, BGEVENT_JUMPTEXT, EatathonContestTrashCanText

	def_object_events
	object_event  7,  4, SPRITE_MAYLENE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MayleneScript, -1
	object_event  4,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCafeTeacher, -1
	object_event  4,  6, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher1, -1
	object_event  1,  7, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher2, -1
	object_event  1,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher3, -1
	object_event  9,  3, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ChefText_Eatathon, -1
	object_event 11,  4, SPRITE_BAKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCafeBakerText, -1

	object_const_def
	const CELADONCAFE_MAYLENE
	const CELADONCAFE_TEACHER

MayleneScript:
	showtext MayleneText1
	faceplayer
	opentext
	writetext MayleneText2
	waitbutton
	checkevent EVENT_BEAT_MAYLENE
	iftruefwd .Done
	writetext MayleneText3
	yesorno
	iffalsefwd .Refused
	writetext MayleneSeenText
	waitbutton
	closetext
	winlosstext MayleneBeatenText, 0
	setlasttalked CELADONCAFE_MAYLENE
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch
	loadtrainer MAYLENE, 1
	sjumpfwd .StartBattle
.Rematch
	loadtrainer MAYLENE, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MAYLENE
	opentext
	writetext MayleneAfterText
	waitbutton
.Done
	closetext
	turnobject CELADONCAFE_MAYLENE, RIGHT
	end

.Refused
	writetext MayleneRefusedText
	waitbutton
	closetext
	turnobject CELADONCAFE_MAYLENE, RIGHT
	end

CeladonCafeTeacher:
	checkkeyitem COIN_CASE
	iftruefwd .NoCoinCase
	showtext TeacherText_CrunchCrunch
	showtextfaceplayer TeacherText_NoCoinCase
	turnobject LAST_TALKED, LEFT
	end

.NoCoinCase:
	showtext TeacherText_KeepEating
	turnobject CELADONCAFE_TEACHER, RIGHT
	showtext TeacherText_MoreChef
	turnobject CELADONCAFE_TEACHER, LEFT
	end

CeladonCafeFisher1:
	showtext Fisher1Text_Snarfle
	showtextfaceplayer Fisher1Text_Concentration
	turnobject LAST_TALKED, LEFT
	end

CeladonCafeFisher2:
	showtext Fisher2Text_GulpChew
	showtextfaceplayer Fisher2Text_Quantity
	turnobject LAST_TALKED, RIGHT
	end

CeladonCafeFisher3:
	showtext Fisher3Text_MunchMunch
	showtextfaceplayer Fisher3Text_GoldenrodIsBest
	turnobject LAST_TALKED, RIGHT
	end

ChefText_Eatathon:
	text "¡Hola!"

	para "Celebramos un con-"
	line "curso de tragones."

	para "No podemos ser-"
	line "virte ahora. Lo"
	cont "siento."
	done

Fisher1Text_Snarfle:
	text "…Ñam, ñam…"
	done

Fisher1Text_Concentration:
	text "¡No me hables!"

	para "¡Romperás mi"
	line "concentración!"
	done

Fisher2Text_GulpChew:
	text "…Glup… Ñam…"
	done

Fisher2Text_Quantity:
	text "¡Prefiero cantidad"
	line "antes que calidad!"

	para "¡Soy feliz cuando"
	line "estoy lleno!"
	done

Fisher3Text_MunchMunch:
	text "Ñam, ñam…"
	done

Fisher3Text_GoldenrodIsBest:
	text "La comida aquí es"
	line "buena, pero Trigal"
	cont "tiene la mejor"
	cont "comida de todas."
	done

TeacherText_CrunchCrunch:
	text "Masc… Masc…"
	done

TeacherText_NoCoinCase:
	text "Aquí nadie te dará"
	line "un Monedero."

	para "Deberías buscar en"
	line "Johto."
	done

TeacherText_KeepEating:
	text "Masc… Masc…"

	para "¡Puedo seguir co-"
	line "miendo!"
	done

TeacherText_MoreChef:
	text "¡Más, chef!"
	done

MayleneText1:
	text "Brega: Ñam"
	line "ñam ñam…"
	done

MayleneText2:
	text "¡El concurso de"
	line "tragones!"

	para "Nunca soñé con al-"
	line "go tan increíble."

	para "Tras una estricta"
	line "dieta al entrenar,"
	cont "puedo comer como"
	cont "un Snorlax."

	para "Además el ganador"
	line "come gratis."

	para "¡Es un sueño he-"
	line "cho realidad!"
	done

MayleneText3:
	text "Empiezo a sentirme"
	line "llena…"

	para "Um, para descan-"
	line "sar, ¿quieres lu-"
	cont "char conmigo?"
	done

MayleneRefusedText:
	text "Ays... Vale."
	done

MayleneSeenText:
	text "¡Vale! ¡Rei!"

	para "Oh, esa es mi re-"
	line "verencia antes de"
	cont "un combate."

	para "¡Voy a darlo todo"
	line "contra ti!"
	done

MayleneBeatenText:
	text "Debo admitir la"
	line "derrota…"

	para "Eres demasiado"
	line "fuerte."
	done

MayleneAfterText:
	text "¡Gracias,"
	line "<PLAYER>!"

	para "¡Estoy lista para"
	line "seguir comiendo!"
	done

CeladonCafeBakerText:
	text "Trabajo aquí"
	line "porque puedo"

	para "comer cuando"
	line "quiera. Simple."
	done

EatathonContestPosterText:
	text "¡Concurso de tra-"
	line "gones! ¡Sin límite"
	cont "de tiempo!"

	para "¡Un combate sin"
	line "fin! ¡El más tra-"
	cont "gón se lo lleva"
	cont "todo gratis!"
	done

EatathonContestTrashCanText:
	text "La papelera está"
	line "llena de sobras…"
	done
