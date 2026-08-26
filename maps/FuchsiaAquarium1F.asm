FuchsiaAquarium1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, FuchsiaAquariumCheckIfWeekend

	def_warp_events
	warp_event  6,  9, FUCHSIA_CITY, 12
	warp_event  7,  9, FUCHSIA_CITY, 13
	warp_event 10,  2, FUCHSIA_AQUARIUM_2F, 1

	def_coord_events

	def_bg_events
	bg_event  1,  5, BGEVENT_READ, FuchsiaAquarium1FGoldeenOrQwilfishSign
	bg_event  2,  5, BGEVENT_READ, FuchsiaAquarium1FMagikarpSign
	bg_event 13,  5, BGEVENT_READ, FuchsiaAquarium1FCorsolaSign
	bg_event 15,  5, BGEVENT_READ, FuchsiaAquarium1FTentacoolOrHorseaSign
	bg_event 16,  5, BGEVENT_READ, FuchsiaAquarium1FChinchouSign
	bg_event  8,  3, BGEVENT_JUMPTEXT, FuchsiaAquarium1FLaprasStatueSignText
	bg_event  5,  2, BGEVENT_JUMPTEXT, FuchsiaAquarium1FPoster1Text
	bg_event  6,  2, BGEVENT_JUMPTEXT, FuchsiaAquarium1FPoster2Text

	def_object_events
	object_event  1,  4, SPRITE_AQUARIUM_MON, SPRITEMOVEDATA_AQUARIUM_TOP, 0, GOLDEEN, -1, PAL_NPC_AQUA_RED, OBJECTTYPE_DONOTHING, NO_FORM, DoNothingScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  1,  4, SPRITE_AQUARIUM_MON, SPRITEMOVEDATA_AQUARIUM_TOP, 0, QWILFISH, -1, PAL_NPC_AQUA_PURPLE, OBJECTTYPE_DONOTHING, HISUIAN_FORM, DoNothingScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	object_event  2,  4, SPRITE_AQUARIUM_MON, SPRITEMOVEDATA_ADMIN_MEOWTH, 0, MAGIKARP, -1, PAL_NPC_AQUA_RED, OBJECTTYPE_DONOTHING, NO_FORM, DoNothingScript, -1
	object_event 13,  4, SPRITE_AQUARIUM_MON, SPRITEMOVEDATA_AQUARIUM_BOTTOM, 0, CORSOLA, -1, PAL_NPC_AQUA_RED, OBJECTTYPE_DONOTHING, NO_FORM, DoNothingScript, -1
	object_event 15,  4, SPRITE_AQUARIUM_MON, SPRITEMOVEDATA_AQUARIUM_TOP, 0, TENTACOOL, -1, PAL_NPC_AQUA_BLUE, OBJECTTYPE_DONOTHING, NO_FORM, DoNothingScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event 15,  4, SPRITE_AQUARIUM_MON, SPRITEMOVEDATA_AQUARIUM_TOP, 0, HORSEA, -1, PAL_NPC_AQUA_BLUE, OBJECTTYPE_DONOTHING, NO_FORM, DoNothingScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	object_event 16,  4, SPRITE_AQUARIUM_MON, SPRITEMOVEDATA_AQUARIUM_BOTTOM, 0, CHINCHOU, -1, PAL_NPC_AQUA_BLUE, OBJECTTYPE_DONOTHING, NO_FORM, DoNothingScript, -1
	object_event  3, 9, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaAquarium1FReceptionistText, -1
	object_event  1, 9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaAquarium1FOfficerText, -1
	object_event  9,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaAquarium1FCuteGirlText, -1
	object_event  4, 4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_DARK_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaAquarium1FSchoolboyText, -1
	object_event  13, 9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaAquarium1FFisherText, -1
	object_event  14, 9, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_ORANGE, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaAquarium1FAromaLadyText, -1

FuchsiaAquariumCheckIfWeekend:
	readvar VAR_WEEKDAY
	ifequalfwd SATURDAY, .weekend
	ifequalfwd SUNDAY, .weekend
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	endcallback

.weekend
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endcallback

FuchsiaAquarium1FGoldeenOrQwilfishSign:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd .weekend
	showtext .GoldeenText
	reanchormap
	pokepic GOLDEEN
	cry GOLDEEN
	waitbutton
	closepokepic
	setmonval GOLDEEN
	special SpecialSeenMon
	end

.weekend:
	showtext .QwilfishText
	reanchormap
	pokepic QWILFISH, HISUIAN_FORM
	cry QWILFISH, HISUIAN_FORM
	waitbutton
	closepokepic
	setmonval QWILFISH, HISUIAN_FORM
	special SpecialSeenMon
	end

.GoldeenText:
	text "Nombre: Goldeen"

	para "Conocido como la"
	line "“Reina del Agua”"
	cont "por su cola,"

	para "que ondea como un"
	line "vestido de gala."
	done

.QwilfishText:
	text "Nombre: Qwilfish"

	para "Come minerales"
	line "tóxicos para crear"

	para "veneno en su"
	line "cuerpo y protegerse."
	done

FuchsiaAquarium1FMagikarpSign:
	showtext .MagikarpText
	reanchormap
	pokepic MAGIKARP
	cry MAGIKARP
	waitbutton
	closepokepic
	setmonval MAGIKARP
	special SpecialSeenMon
	end

.MagikarpText:
	text "Nombre: Magikarp"

	para "La leyenda dice"
	line "que si Magikarp"
	cont "remonta cascadas"

	para "evolucionará en un"
	line "fuerte Gyarados."
	done

FuchsiaAquarium1FCorsolaSign:
	showtext .CorsolaText
	reanchormap
	pokepic CORSOLA
	cry CORSOLA
	waitbutton
	closepokepic
	setmonval CORSOLA
	special SpecialSeenMon
	end

.CorsolaText:
	text "Nombre: Corsola"

	para "Muda y crece sin"
	line "cesar."

	para "La punta de su"
	line "cabeza es muy"
	cont "apreciada por su"
	cont "gran belleza."
	done

FuchsiaAquarium1FTentacoolOrHorseaSign:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd .weekend
	showtext .TentacoolText
	reanchormap
	pokepic TENTACOOL
	cry TENTACOOL
	waitbutton
	closepokepic
	setmonval TENTACOOL
	special SpecialSeenMon
	end

.weekend:
	showtext .HorseaText
	reanchormap
	pokepic HORSEA
	cry HORSEA
	waitbutton
	closepokepic
	setmonval HORSEA
	special SpecialSeenMon
	end

.TentacoolText:
	text "Nombre: Tentacool"

	para "Su cuerpo es casi"
	line "todo agua."

	para "Dispara extraños"
	line "rayos con sus ojos"
	cont "de cristal."
	done

.HorseaText:
	text "Nombre: Horsea"

	para "Anida a la sombra"
	line "de colonias de"
	cont "Corsola."
	done

FuchsiaAquarium1FChinchouSign:
	showtext .ChinchouText
	reanchormap
	pokepic CHINCHOU
	cry CHINCHOU
	waitbutton
	closepokepic
	setmonval CHINCHOU
	special SpecialSeenMon
	end

.ChinchouText:
	text "Nombre: Chinchou"

	para "Emite destellos de"
	line "luz en sus antenas"

	para "para comunicarse"
	line "con los suyos."
	done

FuchsiaAquarium1FLaprasStatueSignText:
	text "Lapras estuvo al"
	line "borde de la"
	cont "extinción."

	para "Gracias a la cría"
	line "de Silph S.A. y"

	para "a nuevas leyes de"
	line "protección, hoy"
	cont "abunda de nuevo."
	done

FuchsiaAquarium1FPoster1Text:
	text "Por favor, no"
	line "toquen el cristal."
	done

FuchsiaAquarium1FPoster2Text:
	text "Por favor, no"
	line "arrojen nada al"
	cont "interior del agua."
	done

FuchsiaAquarium1FReceptionistText:
	text "¡Te damos la"
	line "bienvenida al"
	cont "Acuario de Fucsia!"

	para "Nuestras salas han"
	line "sido financiadas"
	cont "por Silph S.A."
	done

FuchsiaAquarium1FOfficerText:
	text "Pasé de vigilar"
	line "#mon en el"
	cont "Safari a limpiar"
	cont "tanques."

	para "¡Al menos aquí hay"
	line "aire fresco!"
	done

FuchsiaAquarium1FCuteGirlText:
	text "Había un Octillery"
	line "aquí, pero salía"

	para "del tanque a ver"
	line "todo el acuario."
	done

FuchsiaAquarium1FSchoolboyText:
	text "Los científicos"
	line "creen que la vida"
	cont "nació en el mar."


	para "Llevó millones de"
	line "años evolucionar a"
	cont "tantas especies."
	done

FuchsiaAquarium1FFisherText:
	text "Aquí veo #mon"
	line "que jamás he"
	cont "podido pescar."
	done

FuchsiaAquarium1FAromaLadyText:
	text "¿No parecen joyas"
	line "vivientes?"

	para "¡Desprenden su"
	line "propio brillo!"
	done
