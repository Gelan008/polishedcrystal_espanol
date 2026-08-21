LakeOfRageHiddenPowerHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 1
	warp_event  3,  7, LAKE_OF_RAGE, 1

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_JUMPSTD, radio2
	bg_event  6,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  2,  3, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, HiddenPowerGuy, -1

HiddenPowerGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM10_HIDDEN_POWER
	iftruefwd .AlreadyGotItem
	writetext .Text1
	promptbutton
	verbosegivetmhm TM_HIDDEN_POWER
	setevent EVENT_GOT_TM10_HIDDEN_POWER
	writetext .Text2
	waitbutton
	sjumpfwd .CheckHiddenPower
.AlreadyGotItem:
	writetext .Text4
	waitbutton
.CheckHiddenPower
	writetext .Text3
	yesorno
	iffalse_jumpopenedtext .Text7
	writetext .Text5
	promptbutton
	special Special_HiddenPowerGuru
	iffalse_jumpopenedtext .Text4
	ifequalfwd $1, .Egg
	jumpthisopenedtext

	text "I can sense it…"

	para "Your "
	text_ram wStringBuffer3
	line "has a Hidden Power"
	cont "of "
	text_ram wStringBuffer1
	text "!"
	done

.Egg:
	jumpthisopenedtext

	text "An Egg has not yet"
	line "developed a Hidden"
	cont "Power…"
	done

.Text1:
	text "…Vienes desde muy"
	line "lejos…"

	para "He meditado aquí y"
	line "un nuevo poder ha"
	cont "despertado en mí."

	para "Compartiré este"
	line "poder con tus"
	cont "#mon."

	para "¡Toma esto, joven!"
	done

.Text2:
	text "¿Lo ves? ¡Es"
	line "Poder Oculto!"

	para "Saca el poder"
	line "de los #mon"
	cont "para atacar."

	para "Recuerda esto: su"
	line "tipo depende del"
	cont "#mon que lo"
	cont "use."
	done

.Text3:
	text "¿Quieres saber el"
	line "Poder Oculto de"
	cont "tu #mon?"
	done

.Text4:
	text "Estoy meditando…"
	done

.Text5:
	text "¿De qué #mon"
	line "quieres saber su"
	cont "Poder Oculto?"
	done

.Text7:
	text "…Muy bien…"
	done
