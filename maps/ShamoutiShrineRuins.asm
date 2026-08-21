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
	text "Lawrence: Viajé"
	line "por el mundo para"
	cont "capturar las tres"
	cont "aves legendarias."

	para "Sin la colección"
	line "completa, no podré"
	cont "despertar al gran"
	cont "dios oceánico…"

	para "¡Vas a ayudarme"
	line "a completar mi"
	cont "colección!"
	done

.BeatenText:
	text "Increíble. Has"
	line "vencido a todos"
	cont "mis legendarios…"
	done

.AfterText:
	text "Lawrence: Para ti,"
	line "tus #mon no son"
	cont "solo una simple"
	cont "colección, ¿no?"

	para "Los tratas casi"
	line "como a amigos."

	para "¿Será por eso que"
	line "has derrotado a"
	cont "mis legendarios?"

	para "Bueno, creo que te"
	line "has ganado esto."
	done

.SilverWingText:
	text "Esa pluma, el Ala"
	line "Plateada, procede"
	cont "del guardián de"
	cont "los océanos."

	para "Su esencia debería"
	line "atraerlo, mas solo"
	cont "si has dominado a"
	cont "las tres aves:"

	para "fuego, hielo y"
	line "rayo."

	para "O eso dicen las"
	line "leyendas."
	done

.GoodbyeText:
	text "Mi sueño era tener"
	line "a ese #mon,"
	cont "pero has probado"
	cont "ser más digno."

	para "Empezaré de nuevo"
	line "mi colección."

	para "Adiós."
	done

ShamoutiShrineRuinsGrampsText:
	text "Este santuario era"
	line "magnífico cuando"
	cont "yo era un niño."

	para "Por desgracia, una"
	line "tormenta enorme lo"
	cont "destrozó hace ya"
	cont "muchos años."

	para "La tormenta iba a"
	line "destruir la isla,"
	cont "pero nos protegió"
	cont "el gran Guardián."

	para "Cada año doy las"
	line "gracias en honor"
	cont "al gran #mon"
	cont "que nos salvó."
	done

ShamoutiShrineRuinsLadyText:
	text "Tenía que parar en"
	line "Isla Shamouti en"
	cont "mi viaje por todo"
	cont "el mundo."

	para "Por lo visto hay"
	line "un #mon que"
	cont "habla por aquí."
	done
