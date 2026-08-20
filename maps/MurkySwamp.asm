MurkySwamp_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7, 35, STORMY_BEACH, 1
	warp_event  8, 35, STORMY_BEACH, 2
	warp_event 36,  5, UNION_CAVE_B1F_SOUTH, 3

	def_coord_events

	def_bg_events
	bg_event 20, 10, BGEVENT_ITEM + MULCH, EVENT_MURKY_SWAMP_HIDDEN_MULCH
	bg_event  2, 30, BGEVENT_ITEM + X_SP_DEF, EVENT_MURKY_SWAMP_HIDDEN_X_SP_DEF
	bg_event  5, 23, BGEVENT_ITEM + BIG_MUSHROOM, EVENT_MURKY_SWAMP_HIDDEN_BIG_MUSHROOM
	bg_event 40, 33, BGEVENT_ITEM + TINYMUSHROOM, EVENT_MURKY_SWAMP_HIDDEN_TINYMUSHROOM

	def_object_events
	object_event  6,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, URSALUNA, -1, PAL_MON_RED, OBJECTTYPE_SCRIPT, URSALUNA_BLOODMOON_FORM, MurkySwampBloodmoonUrsaluna, EVENT_MURKY_SWAMP_BLOODMOON_URSALUNA
	object_event 40, 26, SPRITE_CHERYL, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, MurkySwampCherylScript, EVENT_MURKY_SWAMP_CHERYL
	object_event 17, 31, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MurkySwampNurseBeatriceScript, -1
	object_event 22, 20, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBug_catcherOscar, -1
	object_event 25, 33, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassAbigail, -1
	object_event  8, 13, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacEnzo, -1
	object_event 37, 17, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHex_maniacMatilda, -1
	object_event  6, 22, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerFirebreatherOleg, -1
	object_event  4, 33, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MurkySwampPokemaniacText, -1
	itemball_event 22, 13, FULL_HEAL, 1, EVENT_MURKY_SWAMP_FULL_HEAL
	itemball_event 14,  9, BIG_MUSHROOM, 1, EVENT_MURKY_SWAMP_BIG_MUSHROOM
	itemball_event 43, 23, TOXIC_ORB, 1, EVENT_MURKY_SWAMP_TOXIC_ORB
	itemball_event 14, 34, MULCH, 1, EVENT_MURKY_SWAMP_MULCH
	cuttree_event  2, 14, EVENT_MURKY_SWAMP_CUT_TREE_1
	cuttree_event  6, 19, EVENT_MURKY_SWAMP_CUT_TREE_2

	object_const_def
	const MURKYSWAMP_BLOODMOON_URSALUNA
	const MURKYSWAMP_CHERYL
	const MURKYSWAMP_NURSE

MurkySwampCherylScript:
	faceplayer
	checkevent EVENT_BEAT_CHERYL
	iftruefwd .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked MURKYSWAMP_CHERYL
	loadtrainer CHERYL, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHERYL
.Beaten
	opentext
	writetext .ItemText
	promptbutton
	verbosegiveitem POWER_WEIGHT
	iffalse_endtext
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear MURKYSWAMP_CHERYL
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_CHERYL
	end

.ChallengeText:
	text "Hola, me llamo"
	line "Malta."
	cont "¿Y tú eres…?"

	para "Vale, conque te"
	line "llamas <PLAYER>."

	para "¡Me alegro de"
	line "conocerte!"

	para "Me dan miedo los"
	line "fantasmas de este"
	cont "pantano…"

	para "¿Un combate para"
	line "ahuyentarlos?"
	done

.YesText:
	text "Debo advertirte"
	line "de que mis #mon"
	cont "son alborotadores."
	done

.NoText:
	text "Vaya, y mis"
	line "#mon que tenían"
	cont "tantas ganas de"
	cont "luchar…"
	done

.BeatenText:
	text "Lograr equilibrio"
	line "entre el ataque y"
	cont "la defensa…"

	para "No es nada fácil."
	done

.ItemText:
	text "¡Muchas gracias,"
	line "<PLAYER>!"

	para "Ahora cruzaré este"
	line "pantano con calma."

	para "Me recuerda a un"
	line "bosque muy lejano…"

	para "¡Toma esto como"
	line "agradecimiento!"
	cont "¡Acéptalo!"
	done

.GoodbyeText:
	text "Voy a la Torre"
	line "Batalla, en Ciudad"
	cont "Olivo."

	para "¿Has oído hablar"
	line "de ella?"

	para "¡Ojalá volvamos a"
	line "vernos allí!"

	para "¡Hasta luego!"
	done

MurkySwampNurseBeatriceScript:
	faceplayer
	checkevent EVENT_BEAT_NURSE_BEATRICE
	iftruefwd .Beaten
	showtext .SeenText
	winlosstext .BeatenText, 0
	setlasttalked MURKYSWAMP_NURSE
	loadtrainer NURSE, BEATRICE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_NURSE_BEATRICE
.Beaten
	showtext .AfterText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	jumpthistext

	text "¡Ya estoy mejor!"
	done

.SeenText:
	text "¡Soy Enfermera!"

	para "¡Vénceme y curaré"
	line "a tus #mon!"
	done

.BeatenText:
	text "Pero antes tendré"
	line "que curar a mis"
	cont "propios #mon…"
	done

.AfterText:
	text "Hacer que los"
	line "#mon se sientan"
	cont "mejor…" 
	
	para "¡Por eso vine"
	line "hasta aquí!"
	done

MurkySwampBloodmoonUrsaluna:
	faceplayer
	opentext
	writetext BloodmoonUrsalunaText
	cry URSALUNA
	pause 15
	closetext
	loadwildmon URSALUNA, URSALUNA_BLOODMOON_FORM, 60
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .GotLevel
	loadwildmon URSALUNA, URSALUNA_BLOODMOON_FORM, 30
.GotLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_NEVER_SHINY
	startbattle
	disappear MURKYSWAMP_BLOODMOON_URSALUNA
	setevent EVENT_MURKY_SWAMP_BLOODMOON_URSALUNA
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .end
	setflag ENGINE_PLAYER_CAUGHT_BLOODMOON_URSALUNA
.end
	end

BloodmoonUrsalunaText:
	text "¡Ua-gaaah!"
	done

GenericTrainerBug_catcherOscar:
	generictrainer BUG_CATCHER, OSCAR, EVENT_BEAT_BUG_CATCHER_OSCAR, .SeenText, .BeatenText

	text "¡Vine a buscar"
	line "bichos!"

	para "¡Nadie me avisó de"
	line "los fantasmas!"
	done

.SeenText:
	text "¡F-f-f-fantasma!"
	done

.BeatenText:
	text "¡Sacadme de aquí!"
	done

GenericTrainerHex_maniacMatilda:
	generictrainer HEX_MANIAC, MATILDA, EVENT_BEAT_HEX_MANIAC_MATILDA, .SeenText, .BeatenText

	text "Entre los árboles"
	line "vagaré sin fin,"

	para "perder el juicio"
	line "y mi alma al fin."
	done

.SeenText:
	text "En la penumbra,"
	line "honda y sin par,"

	para "el sueño eterno"
	line "te voy a dar."
	done

.BeatenText:
	text "Uf, uf, uf, uf…"
	done

GenericTrainerFirebreatherOleg:
	generictrainer FIREBREATHER, OLEG, EVENT_BEAT_FIREBREATHER_OLEG, .SeenText, .BeatenText

	text "Hace frío y está"
	line "oscuro sin fuego…"
	done

.SeenText:
	text "Quiero encender un"
	line "fuego… pero ¿y si"
	cont "arde el gas del"
	cont "pantano y explota?"

	para "¡Es demasiado"
	line "arriesgado!"
	done

.BeatenText:
	text "¡Arriesgué y"
	line "perdí!"
	done

GenericTrainerLassAbigail:
	generictrainer LASS, ABIGAIL, EVENT_BEAT_LASS_ABIGAIL, .SeenText, .BeatenText

	text "Dicen que se ve un"
	line "extraño orbe rojo,"
	cont "brillante como una"
	cont "luna carmesí."

	para "¡Suena aterrador!"
	done

.SeenText:
	text "A la gente le da"
	line "miedo adentrarse"
	cont "en el pantano."
	done

.BeatenText:
	text "¡Iiiik!"
	done

GenericTrainerPokemaniacEnzo:
	generictrainer POKEMANIAC, ENZO, EVENT_BEAT_POKEMANIAC_ENZO, .SeenText, .BeatenText

	text "No creo que Gastly"
	line "emita esa luz roja"
	cont "que yo vi."

	para "¿Qué podrá ser?"
	done

.SeenText
	text "¡Vi una rara luz"
	line "roja entre árboles"
	cont "mientras buscaba"
	cont "#mon raros!"
	done

.BeatenText
	text "No tienes nada que"
	line "temer."
	done

MurkySwampPokemaniacText:
	text "Cerca de la costa,"
	line "la tierra siempre"
	cont "está empapada."

	para "¡Pero los #mon"
	line "raros hacen que"
	cont "valga la pena!"
	done
