MagnetTunnelInside_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, MagnetTunnelInsideTileCallback

	def_warp_events
	warp_event  5, 19, MAGNET_TUNNEL_WEST, 1
	warp_event 43,  3, MAGNET_TUNNEL_EAST, 1
	warp_event 27,  3, MAGNET_TUNNEL_INSIDE, 4
	warp_event 27, 31, MAGNET_TUNNEL_INSIDE, 3
	warp_event 34,  5, MAGNET_TUNNEL_INSIDE, 6
	warp_event 34, 33, MAGNET_TUNNEL_INSIDE, 5

	def_coord_events

	def_bg_events
	bg_event  6, 10, BGEVENT_UP, MagnetTunnelInsideMachine1
	bg_event  7, 10, BGEVENT_UP, MagnetTunnelInsideMachine1
	bg_event 22, 21, BGEVENT_UP, MagnetTunnelInsideMachine2
	bg_event 23, 21, BGEVENT_UP, MagnetTunnelInsideMachine2
	bg_event 20,  8, BGEVENT_UP, MagnetTunnelInsideMachine3
	bg_event 21,  8, BGEVENT_UP, MagnetTunnelInsideMachine3
	bg_event 34,  8, BGEVENT_UP, MagnetTunnelInsideMachine4
	bg_event 35,  8, BGEVENT_UP, MagnetTunnelInsideMachine4
	bg_event 38, 30, BGEVENT_ITEM + METAL_POWDER, EVENT_MAGNET_TUNNEL_HIDDEN_METAL_POWDER

	def_object_events
	object_event  3, 10, SPRITE_N64, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GRAY, OBJECTTYPE_COMMAND, jumptext, MagnetTunnelInsideLodestoneText, EVENT_MAGNET_TUNNEL_LODESTONE_1
	object_event 20, 23, SPRITE_N64, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GRAY, OBJECTTYPE_COMMAND, jumptext, MagnetTunnelInsideLodestoneText, EVENT_MAGNET_TUNNEL_LODESTONE_2
	object_event 20,  5, SPRITE_N64, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GRAY, OBJECTTYPE_COMMAND, jumptext, MagnetTunnelInsideLodestoneText, EVENT_MAGNET_TUNNEL_LODESTONE_3
	object_event 35,  5, SPRITE_N64, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GRAY, OBJECTTYPE_COMMAND, jumptext, MagnetTunnelInsideLodestoneText, EVENT_MAGNET_TUNNEL_LODESTONE_4
	object_event 11, 20, SPRITE_ENGINEER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MagnetTunnelInsideEngineerText1, -1
	object_event  8, 13, SPRITE_ENGINEER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MagnetTunnelInsideEngineerText2, -1
	object_event 32, 21, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MagnetTunnelInsideScientistText, -1
	object_event 22,  8, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerEngineerGraden, -1
	object_event 31, 12, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerEngineerGustav, -1
	object_event 24, 23, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerNicolas, -1
	tmhmball_event 19, 21, TM_GYRO_BALL, EVENT_MAGNET_TUNNEL_TM_GYRO_BALL

	object_const_def
	const MAGNETTUNNELINSIDE_STONE_1
	const MAGNETTUNNELINSIDE_STONE_2
	const MAGNETTUNNELINSIDE_STONE_3
	const MAGNETTUNNELINSIDE_STONE_4

MagnetTunnelInsideTileCallback:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_1
	iffalsefwd .NoMachine1
	changeblock 6, 10, $6b
	changeblock 6, 8, $6d
.NoMachine1
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_2
	iffalsefwd .NoMachine2
	changeblock 22, 20, $66
.NoMachine2
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_3
	iffalsefwd .NoMachine3
	changeblock 20, 8, $6b
	changeblock 20, 6, $6f
.NoMachine3
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_IN_PIT
	iffalsefwd .NoPit
	changeblock 34, 8, $70
	changeblock 34, 4, $68
	endcallback
.NoPit
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_4
	iffalsefwd .NoMachine4
	changeblock 34, 8, $36
	changeblock 34, 6, $35
.NoMachine4
	endcallback

MagnetTunnelInsideMachine1:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_1
	iftrue_jumptextfaceplayer MagnetTunnelInsideMachineText3
	opentext
	writetext MagnetTunnelInsideMachineText1
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	changeblock 6, 10, $6b
	refreshmap
	writetext MagnetTunnelInsideMachineText2
	waitbutton
	closetext
	playsound SFX_THUNDERSHOCK
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_1, .StoneMovement
	playsound SFX_THUNDERSHOCK
	earthquake 15
	playsound SFX_STRENGTH
	changeblock 6, 8, $6d
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_1
	end

.StoneMovement:
	fix_facing
	slow_slide_step_up
	slow_slide_step_right
	slow_slide_step_right
	slow_slide_step_right
	remove_fixed_facing
	step_end

MagnetTunnelInsideMachine2:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_2
	iftrue_jumptextfaceplayer MagnetTunnelInsideMachineText3
	opentext
	writetext MagnetTunnelInsideMachineText1
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	changeblock 22, 20, $67
	refreshmap
	writetext MagnetTunnelInsideMachineText2
	waitbutton
	closetext
	playsound SFX_THUNDERSHOCK
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_2, .StoneMovement
	playsound SFX_THUNDERSHOCK
	earthquake 15
	playsound SFX_STRENGTH
	changeblock 22, 20, $66
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_2
	end

.StoneMovement:
	fix_facing
	slow_slide_step_up
	slow_slide_step_up
	slow_slide_step_up
	slow_slide_step_right
	slow_slide_step_right
	remove_fixed_facing
	step_end

MagnetTunnelInsideMachine3:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_3
	iftrue_jumptextfaceplayer MagnetTunnelInsideMachineText3
	opentext
	writetext MagnetTunnelInsideMachineText1
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	changeblock 20, 8, $6b
	refreshmap
	writetext MagnetTunnelInsideMachineText2
	waitbutton
	closetext
	playsound SFX_THUNDERSHOCK
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_3, .StoneMovement
	playsound SFX_THUNDERSHOCK
	earthquake 15
	playsound SFX_STRENGTH
	changeblock 20, 6, $6f
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_3
	end

.StoneMovement:
	fix_facing
	slow_slide_step_down
	slow_slide_step_down
	remove_fixed_facing
	step_end

MagnetTunnelInsideMachine4:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_4
	iftruefwd .MachineOn
	opentext
	writetext MagnetTunnelInsideMachineText1
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	changeblock 34, 8, $36
	refreshmap
	writetext MagnetTunnelInsideMachineText2
	waitbutton
	closetext
	playsound SFX_THUNDERSHOCK
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_4, .StoneMovement1
	playsound SFX_THUNDERSHOCK
	earthquake 15
	playsound SFX_STRENGTH
	changeblock 34, 6, $35
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_4
	scall MagnetTunnelAlarmSounds
	showemote EMOTE_QUESTION, PLAYER, 15
	showtext MagnetTunnelInsideMachineText4
	end

.StoneMovement1:
	fix_facing
	slow_slide_step_down
	slow_slide_step_down
	slow_slide_step_left
	remove_fixed_facing
	step_end

.MachineOn:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_IN_PIT
	iftrue_jumptext MagnetTunnelInsideMachineText7
	scall MagnetTunnelAlarmSounds
	opentext
	writetext MagnetTunnelInsideMachineText5
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	writetext MagnetTunnelInsideMachineText6
	waitbutton
	closetext
	changeblock 34, 8, $70
	changeblock 34, 6, $34
	refreshmap
	moveobject MAGNETTUNNELINSIDE_STONE_4, 34, 7
	appear MAGNETTUNNELINSIDE_STONE_4
	playsound SFX_EMBER
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_4, .StoneMovement2
	playsound SFX_STRENGTH
	earthquake 15
	changeblock 34, 4, $68
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_4
	setevent EVENT_MAGNET_TUNNEL_LODESTONE_IN_PIT
	end

.StoneMovement2:
	fix_facing
	slide_step_up
	slide_step_up
	remove_fixed_facing
	step_end

MagnetTunnelAlarmSounds:
	waitsfx
	special SaveMusic
	playmusic MUSIC_NONE
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	waitsfx
	special RestoreMusic
	end

MagnetTunnelInsideMachineText1:
	text "La máquina está"
	line "apagada."

	para "¿Encenderla?"
	done

MagnetTunnelInsideMachineText2:
	text "¡Bip! La máquina"
	line "se ha encendido."
	done

MagnetTunnelInsideMachineText3:
	text "La máquina fun-"
	line "ciona sin prob-"
	cont "lemas."
	done

MagnetTunnelInsideMachineText4:
	text "¡¿Eh?! ¡Algo"
	line "va mal!"
	done

MagnetTunnelInsideMachineText5:
	text "¡Esta máquina no"
	line "funciona bien!"

	para "Varios mensajes"
	line "de ADVERTENCIA"

	para "parpadean rápido"
	line "en la pantalla,"

	para "y huele a quema-"
	line "do en el aire."

	para "¿Pulsar botón de"
	line "apagado de emer-"
	cont "gencia?"
	done

MagnetTunnelInsideMachineText6:
	text "¡Ding! La máquina"
	line "se ha apagado."
	done

MagnetTunnelInsideMachineText7:
	text "La máquina está"
	line "rodeada por un"

	para "ligero hedor a"
	line "plástico fundi-"
	cont "do…"

	para "Parece que está"
	line "totalmente frita."
	done

MagnetTunnelInsideLodestoneText:
	text "La piedra imán es"
	line "suave y cálida."

	para "Tiene una ligera"
	line "aura estática."
	done

MagnetTunnelInsideEngineerText1:
	text "La piedra imán"
	line "emite un fuerte"
	cont "campo magnético."

	para "Tuvimos que traer"
	line "equipo especiali-"

	para "zado para acabar"
	line "el túnel en el"
	cont "plazo fijado."

	para "Nuestro equipo"
	line "estaba bajo mu-"
	cont "cha presión para"
	cont "cumplir a tiempo."
	done

MagnetTunnelInsideEngineerText2:
	text "Desde que empeza-"
	line "mos la construc-"
	cont "ción del túnel,"

	para "el número de"
	line "#mon de tipo"

	para "Eléctrico salva-"
	line "jes aquí se ha"
	cont "multiplicado por"
	cont "más de dos."
	done

MagnetTunnelInsideScientistText:
	text "Cada día llegan"
	line "más Magnemite a"
	cont "causar problemas."

	para "El capataz cree"
	line "que son atraídos"

	para "por las singula-"
	line "res propiedades"
	cont "magnéticas de la"
	cont "piedra imán."

	para "Me pregunto por"
	line "qué."
	done

GenericTrainerEngineerGraden:
	generictrainer ENGINEER, GRADEN, EVENT_BEAT_ENGINEER_GRADEN, .SeenText, .BeatenText

	text "Soy el capataz de"
	line "esta obra."

	para "Excavamos este"
	line "túnel para hacer"

	para "un camino para la"
	line "nueva vía del"
	cont "Magnetotrén, pe-"
	cont "ro…"

	para "¡Quién iba a de-"
	line "cirme que toda la"
	cont "piedra imán cau-"
	cont "saría tanto do-"
	cont "lor de cabeza!"
	done

.SeenText:
	text "¿Admirando toda"
	line "nuestra obra?"

	para "¡Jaja!"
	line "¡Admira esto!"
	done

.BeatenText:
	text "¡Jaja! Tienes"
	line "agallas. ¡Me"
	cont "gusta!"
	done

GenericTrainerEngineerGustav:
	generictrainer ENGINEER, GUSTAV, EVENT_BEAT_ENGINEER_GUSTAV, .SeenText, .BeatenText

	text "Intenté arreglar-"
	line "lo, pero no sir-"
	cont "vió de nada…"

	para "¡No consigo"
	line "averiguar qué"
	cont "pasa!"

	para "Me preocupa que"
	line "si la vuelvo a"
	cont "encender,"

	para "la máquina tenga"
	line "un cortocircuito"
	cont "y se estropee…"
	done

.SeenText:
	text "¡Atrás!"

	para "¡Esta máquina se"
	line "ha estropeado!"
	done

.BeatenText:
	text "¡Fundido! Igual"
	line "que un fusible…"
	done

GenericTrainerEngineerNicolas:
	generictrainer ENGINEER, NICOLAS, EVENT_BEAT_ENGINEER_NICOLAS, .SeenText, .BeatenText

	text "¡Estas cosas pue-"
	line "den generar"
	cont "mucho voltaje!"

	para "Al encenderlas,"
	line "crean un campo"
	cont "magnético muy"
	cont "fuerte."

	para "Así que ten cuida-"
	line "do aquí, ¿vale?"
	done

.SeenText:
	text "¡Eh! ¡Cuidado"
	line "con el equipo,"
	cont "chaval!"
	done

.BeatenText:
	text "¡Apagando!"
	done
