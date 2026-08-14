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
	text "Rangi: Espero que"
	line "estés disfrutando"

	para "tu viaje por"
	line "este juego."

	para "Tuvimos problemas"
	line "para meter todos"
	cont "los datos en él."

	para "¡Apenas había es-"
	line "pacio suficiente"
	cont "para mi sprite!"
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
	text "Luna: Cuando hi-"
	line "ciste un Intercam-"
	cont "bio Prodigioso"

	para "con alguien de"
	line "otra región por"

	para "primera vez,"
	line "¿no te impresio-"
	cont "naste?"

	para "¡Yo construí el"
	line "sistema original"
	cont "aquí, en Trigal!"
	done

LunaComputerScript:
	jumpthistext

	text "Una pantalla lle-"
	line "na de notas den-"
	cont "sas, mapas de lu-"

	para "gares desconoci-"
	line "dos y una imagen"

	para "de Johto cubierto"
	line "de nieve."
	done

AdminFredrikText:
	text "Fredrik: El PC de"
	line "Bill es de código"
	cont "abierto, así que"

	para "pude reescribir"
	line "por completo y"

	para "mejorar su base"
	line "de datos."
	done

FredrikComputerScript:
	jumpthistext

	text "Hay una docena de"
	line "ventanas abiertas"
	cont "a la vez,"

	para "cada una relacio-"
	line "nada con su fun-"
	cont "ción."
	done

AdminEmiText:
	text "Emi: ¿Has visto"
	line "los Datos de"
	cont "tus #mon?"

	para "¡Vengo de visita"
	line "desde la región"
	cont "Beria"

	para "para traer in-"
	line "terfaces así"
	cont "a Johto!"

	para "¡Ven a saludar si"
	line "alguna vez estás"
	cont "en Pueblo Amatis-"
	cont "ta!"
	done

EmiComputerScript:
	jumpthistext

	text "Un montón de có-"
	line "digo está cubierto"
	cont "por una partida"
	cont "del Solitario."
	done

AdminAizawaText:
	text "Aizawa: Diálogos,"
	line "diseños de mapa,"

	para "sprites de per-"
	line "sonajes, equipos"
	cont "de entrenador…"

	para "¡Game Freak en"
	line "Kanto tiene suerte"

	para "de tener a toda"
	line "una empresa para"
	cont "hacer esto!"
	done

AizawaComputerScript:
	jumpthistext

	text "Un programa llama-"
	line "do Polished Map++"
	cont "muestra una isla"

	para "tropical dibuja-"
	line "da a medias."
	done

AdminVulcanText:
	text "Vulcan: ¿Qué tal"
	line "el tiempo?"

	para "No es sólo por ha-"
	line "blar… ¡De hecho"
	cont "yo lo implemen-"
	cont "té!"

	para "Pensábamos que"
	line "no se podía"
	cont "hacer…"

	para "¡Y me demostré a"
	line "mí mismo lo"
	cont "contrario!"
	done

VulcanComputerScript:
	jumpthistext

	text "En la pantalla se"
	line "muestra un mapa"
	cont "meteorológico."

	para "Muestra que llue-"
	line "ve en Johto."
	done

AdminSourText:
	text "Sour: ¿Te gustan"
	line "las animaciones"

	para "de los movimien-"
	line "tos en combate?"

	para "¡Me encanta hacer"
	line "que usar cada"
	cont "movimiento sea"
	cont "una delicia!"
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

	text "Un Meowth tra-"
	line "vieso está te-"
	cont "cleando con sus"
	cont "patas."
	done

AdminMeowthText:
	text "Eldred: ¡Miaou!"
	done
