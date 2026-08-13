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

	text "Puedo sentirlo..."

	para "¡Tu "
	text_ram wStringBuffer3
	line "tiene un Poder"
	cont "Oculto de tipo"
	cont ""
	text_ram wStringBuffer1
	text "!"
	done

.Egg:
	jumpthisopenedtext

	text "Un Huevo aún no ha"
	line "desarrollado un"
	cont "Poder Oculto..."
	done

.Text1:
	text "...Has viajado"
	line "lejos..."

	para "He meditado"
	line "aquí. Dentro de"

	para "mí, un nuevo"
	line "poder ha"
	cont "despertado."

	para "Déjame compartir"
	line "mi poder con"
	cont "tus #mon."

	para "Toma esto, joven."
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
	text "¿Adivino el Po-"
	line "der Oculto de"
	cont "tu #mon?"
	done

.Text4:
	text "Estoy meditando..."
	done

.Text5:
	text "¿De qué #mon"
	line "adivino su"
	cont "Poder Oculto?"
	done

.Text7:
	text "...Muy bien..."
	done
