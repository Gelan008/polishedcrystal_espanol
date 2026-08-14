LakeOfRageMagikarpHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftruefwd .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftruefwd .AskedForMagikarp
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue_jumpopenedtext MagikarpLengthRaterText_MenInBlack
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	setmonval MAGIKARP
	special Special_FindThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	iffalse_jumpopenedtext MagikarpLengthRaterText_NotMagikarp
	ifequalfwd $1, .Refused
	ifequalfwd $2, .TooShort
.GetReward:
	writetext MagikarpLengthRaterText_Memento
	promptbutton
	verbosegiveitem ELIXIR
	iffalsefwd .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	jumpthisopenedtext

	text "¡Guau! ¡Este es"
	line "impresionante!"

	para "…Ojalá pudiera"
	line "decir eso, pero"

	para "he visto uno más"
	line "grande antes."
	done

.Refused:
	jumpthisopenedtext

	text "Oh… ¿Así que no"
	line "conseguiste uno"

	para "bueno para ense-"
	line "ñarme?"
	cont "A la próxima."
	done

MagikarpLengthRaterText_LakeOfRageHistory:
	text "El Lago de la Fu-"
	line "ria es un cráter"

	para "hecho por Gyarados"
	line "furiosos."

	para "El cráter se llenó"
	line "de agua de lluvia"

	para "y se formó el"
	line "lago."

	para "Esa historia me"
	line "la contó el tara-"
	cont "rabuelo de mi"
	cont "abuelo."

	para "Antes, se podían"
	line "pescar Magikarp"

	para "muy vivaces,"
	line "pero…"

	para "No entiendo qué"
	line "está pasando."
	done

MagikarpLengthRaterText_MenInBlack:
	text "El lago no ha"
	line "sido normal desde"

	para "que llegaron esos"
	line "hombres de negro."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "El lago ha vuelto"
	line "a la normalidad."

	para "Los Magikarp han"
	line "regresado."

	para "Quizá pueda cum-"
	line "plir mi sueño de"
	cont "ver el Magikarp"
	cont "más grande."

	para "¿Tienes Caña?"
	line "Si es así, ayúda-"
	cont "me."
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "¡Ah, tienes un"
	line "Magikarp! Veamos"

	para "qué tan grande es"
	line "ese pequeñín."
	done

MagikarpLengthRaterText_Memento:
	text "¡Guau! ¡Este es"
	line "impresionante!"

	para "¡Me quito el som-"
	line "brero ante ti!"

	para "¡Toma esto de re-"
	line "cuerdo!"
	done

MagikarpLengthRaterText_Bonus:
	text "El récord es lo"
	line "más importante."

	para "¡Piensa en eso co-"
	line "mo un premio ex-"
	cont "tra!"
	done

MagikarpLengthRaterText_NotMagikarp:
	text "¿Qué? ¡Eso no es"
	line "un Magikarp!"
	done
