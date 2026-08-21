GoldenrodPokecomCenterOffice_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  8, GOLDENROD_POKECOM_CENTER_1F, 3
	warp_event  1,  8, GOLDENROD_POKECOM_CENTER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  2, BGEVENT_UP, RangiComputerScript
	bg_event  6,  2, BGEVENT_UP, LunaComputerScript
	bg_event  9,  2, BGEVENT_UP, FredrikComputerScript
	bg_event 12,  2, BGEVENT_UP, EmiComputerScript
	bg_event  6,  5, BGEVENT_UP, AizawaComputerScript
	bg_event  9,  5, BGEVENT_UP, VulcanComputerScript
	bg_event 12,  5, BGEVENT_UP, SourComputerScript

	def_object_events
	object_event  4,  4, SPRITE_SCIENTIST_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_RANGI, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminRangiText, -1
	object_event  7,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminLunaText, -1
	object_event 10,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminFredrikText, -1
	object_event 13,  3, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_EMI, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminEmiText, -1
	object_event  7,  6, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminAizawaText, -1
	object_event 10,  6, SPRITE_PI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_AZURE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminVulcanText, -1
	object_event 13,  6, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminSourText, -1
	object_event  4,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_ADMIN_MEOWTH, 0, MEOWTH, -1, PAL_MON_BROWN, OBJECTTYPE_SCRIPT, NO_FORM, AdminEldredScript, -1

AdminRangiText:
	text "Rangi: ¡Espero que"
	line "estés disfrutando"
	cont "del juego!"

	para "Nos costó meter"
	line "todos los datos."

	para "¡Casi no queda"
	line "sitio libre para"
	cont "mi sprite!"
	done

RangiComputerScript:
	jumpthistext

	text "Optimizando…"
	line "parpadea en la"
	cont "pantalla."

	para "Parece que va a"
	line "tardar un rato."
	done

AdminLunaText:
	text "Luna: Al hacer un"
	line "Intercambio"
	cont "Prodigioso con"
	cont "otra región,"

	para "¿no te dio una"
	line "gran emoción?"

	para "¡Yo creé todo el"
	line "sistema original"
	cont "aquí en Trigal!"
	done

LunaComputerScript:
	jumpthistext

	text "La pantalla tiene"
	line "muchas notas,"
	cont "mapas de sitios"
	cont "desconocidos…"

	para "¡Y una foto de"
	line "Johto nevado!"
	done

AdminFredrikText:
	text "Fredrik: El PC de"
	line "Bill es abierto,"
	cont "así que pude"
	cont "reescribir y"
	cont "mejorar su base"
	cont "de datos."
	done

FredrikComputerScript:
	jumpthistext

	text "Hay diez ventanas"
	line "abiertas a la vez,"
	cont "cada una con su"
	cont "propia función."
	done

AdminEmiText:
	text "Emi: ¿Viste los"
	line "Datos #mon?"

	para "¡Vengo desde la"
	line "región Beria para"
	cont "traer estas"
	cont "pantallas a Johto!"

	para "¡Salúdame si vas"
	line "a Pueblo Amatista!"
	done

EmiComputerScript:
	jumpthistext

	text "El código fuente"
	line "está tapado por el"
	cont "juego Solitario."
	done

AdminAizawaText:
	text "Aizawa: Mapas,"
	line "diálogos, sprites,"
	cont "entrenadores…"

	para "¡Qué suerte tiene"
	line "Game Freak en"
	cont "Kanto al tener una"
	cont "empresa para esto!"
	done

AizawaComputerScript:
	jumpthistext

	text "El Polished Map++"
	line "muestra una isla"
	cont "tropical dibujada"
	cont "a medias."
	done

AdminVulcanText:
	text "Vulcan: ¿Qué tal"
	line "el clima?"

	para "No es por hablar…"
	line "¡Fui yo quien lo"
	cont "implementó!"

	para "Creían que era"
	line "imposible, ¡y les"
	cont "demostré que no!"
	done

VulcanComputerScript:
	jumpthistext

	text "En la pantalla se"
	line "ve un mapa"
	cont "meteorológico."

	para "Muestra lluvia en"
	line "todo Johto."
	done

AdminSourText:
	text "Sour: ¿Te gustan"
	line "las animaciones de"
	cont "ataque en combate?"

	para "¡Me encanta lograr"
	line "que cada ataque"
	cont "se vea genial!"
	done

SourComputerScript:
	jumpthistext

	text "Hay una graciosa"
	line "imagen de un"
	cont "hombre con forma"
	cont "de huevo y bigote."
	done

AdminEldredScript:
	opentext
	writetext AdminMeowthText
	cry MEOWTH
	promptbutton
	jumpthisopenedtext

	text "Un Meowth travieso"
	line "teclea con sus"
	cont "patas."
	done

AdminMeowthText:
	text "Eldred: ¡Miaou!"
	done
