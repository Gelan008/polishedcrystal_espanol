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
	line "decir eso, pero vi"
	cont "otro más grande."
	done

.Refused:
	jumpthisopenedtext

	text "Oh… ¿No tienes uno"
	line "bueno que puedas"
	cont "mostrarme?"

	para "Otra vez será."
	done

MagikarpLengthRaterText_LakeOfRageHistory:
	text "El Lago de la"
	line "Furia es un cráter"
	cont "de Gyarados."

	para "Se llenó de agua,"
	line "de lluvia y así"
	cont "se formó el lago."

	para "Eso me lo contó"
	line "el tatarabuelo de"
	cont "mi propio abuelo."

	para "Antes se pescaban"
	line "Magikarp muy"
	cont "vivaces, pero…"

	para "No entiendo qué"
	line "está pasando."
	done

MagikarpLengthRaterText_MenInBlack:
	text "El lago no está"
	line "normal desde que"
	cont "llegó esa gente"
	cont "vestida de negro."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "El lago vuelve a"
	line "la normalidad y"
	cont "han regresado los"
	cont "Magikarp."

	para "Quizá pueda lograr"
	line "mi sueño de ver el"
	cont "Magikarp más"
	cont "grande."

	para "¿Tienes Caña?"
	line "¡Ayúdame si es"
	cont "así!"
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "¡Ah, un Magikarp!"
	line "Veamos cómo es de"
	cont "grande."
	done

MagikarpLengthRaterText_Memento:
	text "¡Guau! ¡Este es"
	line "impresionante!"

	para "¡Me quito el"
	line "sombrero ante ti!"
	cont "¡Toma un recuerdo!"
	done

MagikarpLengthRaterText_Bonus:
	text "El récord es lo"
	line "más importante."

	para "¡Tómalo como un"
	line "premio extra!"
	done

MagikarpLengthRaterText_NotMagikarp:
	text "¿Qué? ¡Eso no es"
	line "un Magikarp!"
	done
