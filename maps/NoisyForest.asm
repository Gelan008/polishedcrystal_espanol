NoisyForest_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  4, ROCKY_BEACH, 2
	warp_event  6,  5, ROCKY_BEACH, 3
	warp_event 35, 28, SHAMOUTI_SHRINE_RUINS, 1
	warp_event 35, 29, SHAMOUTI_SHRINE_RUINS, 2

	def_coord_events

	def_bg_events
	bg_event 15,  9, BGEVENT_JUMPTEXT, NoisyForestSignpostText
	bg_event 25, 31, BGEVENT_JUMPTEXT, NoisyForestSignpostText
	bg_event 32,  2, BGEVENT_ITEM + ULTRA_BALL, EVENT_NOISY_FOREST_HIDDEN_ULTRA_BALL
	bg_event 34, 18, BGEVENT_ITEM + TINYMUSHROOM, EVENT_NOISY_FOREST_HIDDEN_TINYMUSHROOM
	bg_event  7, 29, BGEVENT_ITEM + FULL_RESTORE, EVENT_NOISY_FOREST_HIDDEN_FULL_RESTORE

	def_object_events
	object_event 19, 36, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TOLD_ABOUT_PIKABLU
	object_event 24, 31, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MARILL, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, NoisyForestPikabluScript, EVENT_NOISY_FOREST_PIKABLU
	object_event 10, 15, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBird_keeperTrent, -1
	object_event 20,  4, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBug_maniacPierre, -1
	object_event  4, 27, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBug_maniacDylan, -1
	object_event 31, 17, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGuitaristfJaclyn, -1
	object_event 12, 30, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGuitaristmEzekiel, -1
	object_event 20, 34, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerLester, -1
	object_event 13,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, (1 << MORN) | (1 << DAY), PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, NoisyForestTeacherText, -1
	object_event 40, 15, SPRITE_CHILD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, NoisyForestChildText, -1
	itemball_event 41,  2, BALMMUSHROOM, 1, EVENT_NOISY_FOREST_BALMMUSHROOM
	itemball_event 16, 28, MULCH, 1, EVENT_NOISY_FOREST_MULCH
	tmhmball_event 20, 20, TM_DRAIN_PUNCH, EVENT_NOISY_FOREST_TM_DRAIN_PUNCH
	cuttree_event 40, 12, EVENT_NOISY_FOREST_CUT_TREE_1
	cuttree_event 12, 21, EVENT_NOISY_FOREST_CUT_TREE_2

	object_const_def
	const NOISYFOREST_WILHOMENA
	const NOISYFOREST_PIKABLU

GenericTrainerBug_maniacPierre:
	generictrainer BUG_MANIAC, PIERRE, EVENT_BEAT_BUG_MANIAC_PIERRE, .SeenText, .BeatenText

	text "Bzzz… Bzzz…"

	para "Ese zumbido se me"
	line "ha metido en la"
	cont "cabeza…"
	done

.SeenText:
	text "A mis #mon les"
	line "encanta este"
	cont "bosque."

	para "¡Aquí no paran"
	line "de zumbar!"
	done

.BeatenText:
	text "¡Bzzz! ¡He"
	line "perdido!"
	done

GenericTrainerBug_maniacDylan:
	generictrainer BUG_MANIAC, DYLAN, EVENT_BEAT_BUG_MANIAC_DYLAN, .SeenText, .BeatenText

	text "El zumbido de este"
	line "bosque tiene algo"

	para "que vuelve locos a"
	line "los bichos."
	done

.SeenText:
	text "¡Nunca había visto"
	line "a mis bichos tan"
	cont "felices!"
	done

.BeatenText:
	text "¡Vaya, con lo fe-"
	line "lices que estaban!"
	done

GenericTrainerGuitaristfJaclyn:
	generictrainer GUITARISTF, JACLYN, EVENT_BEAT_GUITARISTF_JACLYN, .SeenText, .BeatenText

	text "¡Espera! ¡No he"
	line "terminado aún de"
	cont "cantar!"
	done

.SeenText:
	text "¡Que aúlle mi"
	line "guitarra!"

	para "¡Escucha mi grito!"
	done

.BeatenText:
	text "¡Giyaaaah!"
	done

GenericTrainerGuitaristmEzekiel:
	generictrainer GUITARISTM, EZEKIEL, EVENT_BEAT_GUITARISTM_EZEKIEL, .SeenText, .BeatenText

	text "Si escuchas con"
	line "atención, oirás"

	para "el ritmo del"
	line "murmullo del"
	cont "bosque."
	done

.SeenText:
	text "¿Un combate? Sí,"
	line "me apunto."
	done

.BeatenText:
	text "Vaya. Ha estado"
	line "genial."
	done

GenericTrainerHikerLester:
	generictrainer HIKER, LESTER, EVENT_BEAT_HIKER_LESTER, .SeenText, .BeatenText

	text "¿Qué pasa? ¿Un"
	line "Montañero no puede"

	para "explorar un bosque"
	line "en vez de una mon-"
	cont "taña de vez en"
	cont "cuando?"
	done

.SeenText:
	text "¡Iiii-ja!"
	done

.BeatenText:
	text "¡Gof! ¡Cof, cof!"

	para "¡Me he atragantado"
	line "de tanto gritar!"
	done

GenericTrainerBird_keeperTrent:
	generictrainer BIRD_KEEPER, TRENT, EVENT_BEAT_BIRD_KEEPER_TRENT, .SeenText, .BeatenText

	text "Madrugo cada día"
	line "para entrenar a"
	cont "mis pájaros aquí."

	para "El estruendo es"
	line "parte de nuestro"
	cont "entrenamiento."
	done

.SeenText:
	text "¡A quien madruga,"
	line "Dios le ayuda!"
	done

.BeatenText:
	text "Parece que a mí no"
	line "me ayudó…"
	done

NoisyForestTeacherText:
	text "Vengo aquí a dar"
	line "mi paseo matutino."

	para "¡Hasta llevo un"
	line "podómetro para"
	cont "contar mis pasos!"
	done

NoisyForestChildText:
	text "¡Uf! ¡Este lugar"
	line "es ensordecedor!"
	done

NoisyForestPikabluScript:
	showcrytext .PikabluText, MARILL
	appear NOISYFOREST_WILHOMENA
	applymovement NOISYFOREST_WILHOMENA, .WalkToYou
	turnobject PLAYER, DOWN
	showtext .OwnerText1
	disappear NOISYFOREST_PIKABLU
	opentext
	writetext .OwnerText2
	promptbutton
	verbosegiveitem ODD_SOUVENIR
	iffalsefwd .NoItem
	setevent EVENT_GOT_ODD_SOUVENIR_FROM_WILHOMENA
	writetext .OwnerText3
.Leave:
	waitbutton
	closetext
	applymovement NOISYFOREST_WILHOMENA, .WalkAway
	disappear NOISYFOREST_WILHOMENA
	clearevent EVENT_SHAMOUTI_ISLAND_WILHOMENA
	end

.NoItem:
	writetext .OwnerText4
	sjump .Leave

.PikabluText:
	text "Marill: Rill!"
	done

.OwnerText1:
	text "¡Encontraste a mi"
	line "Pikablu!"
	cont "¡Muchas gracias!"
	done

.OwnerText2:
	text "Deja que te dé"
	line "un detalle."
	done

.OwnerText3:
	text "¡Un recuerdo de tu"
	line "estancia en Isla"
	cont "Shamouti!"

	para "¿A que parece muy"
	line "extraño?"

	para "¡Adiós y gracias"
	line "de nuevo!"
	done

.OwnerText4:
	text "Oh, no puedes lle-"
	line "var más cosas."

	para "Búscame junto al"
	line "Centro #mon"
	cont "si lo quieres."
	done

.WalkToYou:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_end

.WalkAway:
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

NoisyForestSignpostText:
	text "Noisy Forest"
	done
