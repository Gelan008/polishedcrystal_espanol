DanceTheatre_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5, 15, ECRUTEAK_CITY, 8
	warp_event  6, 15, ECRUTEAK_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  5,  6, BGEVENT_UP, MapDanceTheatreSignpost1Script
	bg_event  6,  6, BGEVENT_UP, MapDanceTheatreSignpost1Script

	def_object_events
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerKimono_girlNaoko, -1
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlSayo, -1
	object_event  6,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLACK, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlZuki, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlKuni, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlMiki, -1
	object_event  7, 12, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	pokemon_event  6, 10, RHYDON, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, RhydonText, -1
	object_event 10, 12, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreCooltrainerMText, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreGrannyText, -1
	object_event  1, 10, SPRITE_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreLadyText, -1

GenericTrainerKimono_girlNaoko:
	assert !DEF(TRAINERPAL_NAOKO) ; the default TRAINERPAL_KIMONO_GIRL is hers
	generictrainer KIMONO_GIRL, NAOKO, EVENT_BEAT_KIMONO_GIRL_NAOKO, Kimono_girlNaokoSeenText, Kimono_girlNaokoBeatenText

	text "He disfrutado este"
	line "combate. Ojalá"
	cont "volvamos a vernos."
	done

GenericTrainerKimono_girlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, Kimono_girlSayoSeenText, Kimono_girlSayoBeatenText, 0, .Script, TRAINERPAL_SAYO

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "El ritmo importa"
	line "tanto al bailar"
	cont "como con #mon."
	done

GenericTrainerKimono_girlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, Kimono_girlZukiSeenText, Kimono_girlZukiBeatenText, 0, .Script, TRAINERPAL_ZUKI

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Me pongo una flor"
	line "diferente en el"
	cont "pelo cada mes."
	done

GenericTrainerKimono_girlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, Kimono_girlKuniSeenText, Kimono_girlKuniBeatenText, 0, .Script, TRAINERPAL_KUNI

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Entrené mucho y"
	line "creí que era muy"
	cont "buena entrenadora."

	para "Veo que no…"
	done

GenericTrainerKimono_girlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, Kimono_girlMikiSeenText, Kimono_girlMikiBeatenText, 0, .Script, TRAINERPAL_MIKI

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Sigo bailando"
	line "porque a la gente"
	cont "le gusta mi arte."

	para "¡Y mis #mon me"
	line "animan también!"
	done

DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	promptbutton
	checkevent EVENT_GOT_HM03_SURF
	iftrue_jumpopenedtext SurfGuyElegantKimonoGirlsText
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalsefwd .KimonoGirlsUndefeated
	writetext SurfGuyLikeADanceText
	promptbutton
	verbosegivetmhm HM_SURF
	setevent EVENT_GOT_HM03_SURF
	jumpthisopenedtext

	text "Eso es Surf."

	para "Es un movimiento"
	line "que permite a un"
	cont "#mon nadar en"
	cont "el agua."
	done

.KimonoGirlsUndefeated:
	jumpthisopenedtext

	text "¡Oye! Si vences a"
	line "todas las Chicas"
	cont "Kimono, te daré un"
	cont "bonito regalo."
	done

MapDanceTheatreSignpost1Script:
	jumpthistext

	text "Un cartel muy"
	line "elegante, lleno"
	cont "de flores."
	done

Kimono_girlNaokoSeenText:
	text "Tus #mon son"
	line "preciosos. ¿Puedo"
	cont "verlos en combate?"
	done

Kimono_girlNaokoBeatenText:
	text "Vaya, eres muy"
	line "fuerte."
	done

Kimono_girlSayoSeenText:
	text "Siempre bailo con"
	line "mis #mon."

	para "Y por supuesto,"
	line "¡también entrenan!"
	done

Kimono_girlSayoBeatenText:
	text "¡Oh, tan cerca!"
	line "Casi te gano."
	done

Kimono_girlZukiSeenText:
	text "¿A que mi broche"
	line "es bonito?"

	para "¿Oh, un combate"
	line "#mon?"
	done

Kimono_girlZukiBeatenText:
	text "No me quedan"
	line "#mon…"
	done

Kimono_girlKuniSeenText:
	text "Eres un entrenador"
	line "muy mono. ¿Quieres"
	cont "luchar?"
	done

Kimono_girlKuniBeatenText:
	text "Eres más fuerte"
	line "de lo que pareces."
	done

Kimono_girlMikiSeenText:
	text "¿Te gusta cómo"
	line "bailo? También se"
	cont "me dan bien los"
	cont "#mon."
	done

Kimono_girlMikiBeatenText:
	text "Vaya, también se"
	line "te dan bien."
	done

SurfGuyNeverLeftAScratchText:
	text "Las Chicas Kimono"
	line "bailan muy bien y"
	cont "tienen talento con"
	cont "los #mon."

	para "Siempre las reto,"
	line "¡pero nunca les he"
	cont "hecho un rasguño!"
	done

SurfGuyLikeADanceText:
	text "Verte combatir es"
	line "como ver un baile."

	para "¡Ha sido todo un"
	line "gran espectáculo!"

	para "Toma esto. ¡No te"
	line "preocupes y úsalo!"
	done

SurfGuyElegantKimonoGirlsText:
	text "Ojalá mi #mon"
	line "fuera tan elegante"
	cont "como las Chicas"
	cont "Kimono."
	done

RhydonText:
	text "Rhydon: ¡Gugooh"
	line "gugogooh!"
	done

DanceTheatreCooltrainerMText:
	text "Ese hombre va"
	line "siempre con su"
	cont "Rhydon."

	para "Dice que busca un"
	line "#mon que sepa"
	cont "hacer Surf y"
	cont "bailar."

	para "¿Querrá hacer un"
	line "baile sincronizado"
	cont "en el agua?"
	done

DanceTheatreGrannyText:
	text "Las Chicas Kimono"
	line "son muy hermosas."

	para "Pero pasan por un"
	line "entrenamiento muy"
	cont "duro."

	para "Y deben aprender"
	line "las costumbres al"
	cont "salir en público."

	para "Pero si amas algo,"
	line "todo es posible."
	done

DanceTheatreLadyText:
	text "Eevee evoluciona"
	line "en Leafeon,"
	cont "Glaceon o Sylveon,"

	para "pero no veo a"
	line "ninguno aquí."

	para "¿Estarán en otra"
	line "parte las Chicas"
	cont "que los usan?"
	done
