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
	line "combate. Me gus-"
	cont "taría volver a"
	cont "verte."
	done

GenericTrainerKimono_girlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, Kimono_girlSayoSeenText, Kimono_girlSayoBeatenText, 0, .Script, TRAINERPAL_SAYO

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "El ritmo es impor-"
	line "tante tanto al"

	para "bailar como con"
	line "los #mon."
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

	text "Entrené mucho, así"
	line "que pensaba que"

	para "era buena entre-"
	line "nadora. Supongo"
	cont "que no."
	done

GenericTrainerKimono_girlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, Kimono_girlMikiSeenText, Kimono_girlMikiBeatenText, 0, .Script, TRAINERPAL_MIKI

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Puedo seguir bai-"
	line "lando porque hay"

	para "gente que dis-"
	line "fruta de lo que"
	cont "hago."

	para "Mis #mon tam-"
	line "bién me animan."
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

	text "¡Oye! Si puedes"
	line "derrotar a todas"

	para "las Chicas Kimono,"
	line "te daré un regalo."
	done

MapDanceTheatreSignpost1Script:
	jumpthistext

	text "Es un cartel ele-"
	line "gante decorado"
	cont "con flores."
	done

Kimono_girlNaokoSeenText:
	text "Tienes unos #"
	line "mon preciosos."
	cont "¿Puedo verlos en"
	cont "combate?"
	done

Kimono_girlNaokoBeatenText:
	text "Vaya, eres muy"
	line "fuerte."
	done

Kimono_girlSayoSeenText:
	text "Siempre bailo con"
	line "mis #mon."

	para "Por supuesto, tam-"
	line "bién los entreno."
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
	line "#mon..."
	done

Kimono_girlKuniSeenText:
	text "Oh, eres un entre-"
	line "nador muy mono."
	cont "¿Quieres luchar?"
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
	line "no solo son buenas"

	para "bailarinas, tam-"
	line "bién tienen ta-"
	cont "lento para los"
	cont "#mon."

	para "Siempre las de-"
	line "safío, pero ni si-"

	para "quiera les he"
	line "hecho un rasguño..."
	done

SurfGuyLikeADanceText:
	text "Tu forma de com-"
	line "batir es como ver"
	cont "un baile."

	para "¡Fue todo un es-"
	line "pectáculo de ver!"

	para "Quiero que tengas"
	line "esto. No te preo-"
	cont "cupes, ¡tómalo!"
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
	text "Ese hombre siem-"
	line "pre está con su"
	cont "Rhydon."

	para "Dice que quiere un"
	line "#mon que sepa"
	cont "hacer Surf y"
	cont "bailar."

	para "¿Está intentando"
	line "crear un #mon"
	cont "de natación"
	cont "sincronizada?"
	done

DanceTheatreGrannyText:
	text "Las Chicas Kimono"
	line "son muy hermosas..."

	para "Pero tienen que"
	line "pasar por un"
	cont "duro entrenamien-"
	cont "to."

	para "Y deben aprender"
	line "a seguir las"

	para "costumbres antes"
	line "de aparecer en"
	cont "público."

	para "Pero si amas algo,"
	line "todo es posible."
	done

DanceTheatreLadyText:
	text "Eevee puede evo-"
	line "lucionar en Lea-"
	cont "feon, Glaceon o"
	cont "Sylveon,"

	para "pero no veo a ningu-"
	line "no aquí."

	para "Me pregunto si las"
	line "Chicas Kimono que"

	para "los usan estarán"
	line "en otra parte."
	done
