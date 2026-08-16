ShamoutiShrineRuins_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 18, NOISY_FOREST, 3
	warp_event  2, 19, NOISY_FOREST, 4

	def_coord_events

	def_bg_events
	bg_event  7, 10, BGEVENT_ITEM + MAX_REVIVE, EVENT_SHAMOUTI_SHRINE_RUINS_HIDDEN_MAX_REVIVE

	def_object_events
	object_event  8, 11, SPRITE_LAWRENCE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ShamoutiShrineRuinsLawrenceScript, EVENT_LAWRENCE_SHAMOUTI_SHRINE_RUINS
	object_event 10, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiShrineRuinsGrampsText, -1
	object_event 14, 13, SPRITE_LADY, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiShrineRuinsLadyText, -1
	itemball_event  4, 27, RARE_CANDY, 1, EVENT_SHAMOUTI_SHRINE_RUINS_RARE_CANDY

	object_const_def
	const SHAMOUTISHRINERUINS_LAWRENCE

ShamoutiShrineRuinsLawrenceScript:
	special Special_FadeOutMusic
	pause 15
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	setlasttalked SHAMOUTISHRINERUINS_LAWRENCE
	loadtrainer LAWRENCE, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	opentext
	writetext .AfterText
	promptbutton
	verbosegivekeyitem SILVER_WING
	writetext .SilverWingText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequalfwd UP, .up
	ifequalfwd DOWN, .down
	ifequalfwd LEFT, .left
.right
	turnobject SHAMOUTISHRINERUINS_LAWRENCE, RIGHT
	sjumpfwd .continue
.up
	turnobject SHAMOUTISHRINERUINS_LAWRENCE, UP
	sjumpfwd .continue
.down
	turnobject SHAMOUTISHRINERUINS_LAWRENCE, DOWN
	sjumpfwd .continue
.left
	turnobject SHAMOUTISHRINERUINS_LAWRENCE, LEFT
.continue
	pause 40
	showtextfaceplayer .GoodbyeText
	playsound SFX_WARP_TO
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SHAMOUTISHRINERUINS_LAWRENCE
	waitsfx
	special Special_FadeInQuickly
	setevent EVENT_BEAT_LAWRENCE
	playmapmusic
	end

.SeenText:
	text "Lawrence: He via-"
	line "jado por muchas"

	para "regiones para ca-"
	line "zar a Articuno,"
	cont "Zapdos y Moltres."

	para "Sin la colección"
	line "completa, no pue-"

	para "do despertar al"
	line "guardián de los"
	cont "océanos…"

	para "¡Vas a ayudarme"
	line "a completar mi"
	cont "colección!"
	done

.BeatenText:
	text "Increíble."
	line "Has vencido a mi"

	para "colección de le-"
	line "yenda…"
	done

.AfterText:
	text "Lawrence: Para ti,"
	line "tus #mon no son"

	para "solo una colec-"
	line "ción, ¿verdad?"

	para "Los tratas casi"
	line "como a amigos."

	para "¿Será por eso por"
	line "lo que has vencido"

	para "a mis #mon"
	line "legendarios?"

	para "Bueno, creo que te"
	line "has ganado esto."
	done

.SilverWingText:
	text "Esa pluma, el Ala"
	line "Plateada, procede"

	para "del guardián de"
	line "los océanos."

	para "Su esencia debería"
	line "atraerlo, pero"

	para "solo si has domi-"
	line "nado los tres es-"

	para "pejismos alados:"
	line "las aves de fuego,"

	para "hielo y rayo."

	para "O eso dicen las"
	line "leyendas."
	done

.GoodbyeText:
	text "Mi sueño era po-"
	line "seer a ese"
	cont "#mon,"

	para "pero has demos-"
	line "trado ser digno."
	cont "Tómalo."

	para "Empezaré mi colec-"
	line "ción de nuevo."

	para "Adiós."
	done

ShamoutiShrineRuinsGrampsText:
	text "Este santuario era"
	line "magnífico cuando"
	cont "yo era un niño."

	para "Pero, por desgra-"
	line "cia, una tormenta"

	para "lo destrozó hace"
	line "muchos años."

	para "La tormenta amena-"
	line "zaba a toda la is-"
	cont "la, pero fuimos"

	para "protegidos por el"
	line "Guardián de los"
	cont "Océanos."

	para "Cada año doy las"
	line "gracias en honor"

	para "al gran #mon"
	line "que nos mantuvo a"
	cont "salvo."
	done

ShamoutiShrineRuinsLadyText:
	text "Tenía que parar en"
	line "Isla Shamouti en"

	para "mi vuelta al"
	line "mundo."

	para "Por lo visto hay"
	line "un #mon que"
	cont "habla por aquí."
	done
