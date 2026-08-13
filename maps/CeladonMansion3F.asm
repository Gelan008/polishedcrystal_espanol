CeladonMansion3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  0, CELADON_MANSION_ROOF, 1
	warp_event  1,  0, CELADON_MANSION_2F, 2
	warp_event  6,  0, CELADON_MANSION_2F, 3
	warp_event  7,  0, CELADON_MANSION_ROOF, 2

	def_coord_events

	def_bg_events
	bg_event  5,  8, BGEVENT_UP, MapCeladonMansion3FSignpost0Script
	bg_event  4,  3, BGEVENT_UP, MapCeladonMansion3FSignpost1Script
	bg_event  1,  6, BGEVENT_UP, MapCeladonMansion3FSignpost2Script
	bg_event  1,  3, BGEVENT_UP, MapCeladonMansion3FSignpost3Script

	def_object_events
	object_event  3,  6, SPRITE_COOL_DUDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakGameDesignerScript, -1
	object_event  3,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakGraphicArtistScript, -1
	object_event  0,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, GameFreakProgrammerText, -1
	object_event  0,  4, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GameFreakCharacterDesignerText, -1

GameFreakGameDesignerScript:
	checkevent EVENT_DECO_POSTER_4
	iftrue_jumptextfaceplayer GameFreakDesignerGaveDiplomaText
	faceplayer
	opentext
	writetext GameFreakGameDesignerText
	setval16 NUM_POKEMON
	special CountCaught
	iftruefwd .CompletedPokedex
	waitendtext

.CompletedPokedex:
	promptbutton
	writetext GameFreakGameDesignerCompletedPokedexText
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	writetext GameFreakGameDesignerPauseForDiplomaText
	waitbutton
	writetext GameFreakGameDesignerGiveDiplomaText
	setevent EVENT_DECO_POSTER_4
	playsound SFX_KEY_ITEM
	waitsfx
	promptbutton
	callasm Diploma
	writetext GameFreakGameDesignerDiplomaSentText
	waitbutton
	setevent EVENT_ENABLE_DIPLOMA_PRINTING
	jumpthisopenedtext

	text "El Artista Gráfico"
	line "te imprimirá un"
	cont "Diploma."

	para "¡Deberías ir y"
	line "presumir de él!"
	done

GameFreakGraphicArtistScript:
	faceplayer
	opentext
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftruefwd .CanPrintDiploma
	writetext GameFreakGraphicArtistText
	waitendtext

.CanPrintDiploma:
	writetext GameFreakGraphicArtistPrintDiplomaText
	yesorno
	iffalsefwd .Refused
	special PrintDiploma
	closetext
	end

.Refused:
	writetext GameFreakGraphicArtistRefusedText
	waitendtext

MapCeladonMansion3FSignpost0Script:
	jumpthistext

	text "Sala de Desarrollo"
	line "de Game Freak"
	done

MapCeladonMansion3FSignpost1Script:
	jumpthistext

	text "Es un dibujo"
	line "detallado de una"
	cont "chica guapa."
	done

MapCeladonMansion3FSignpost2Script:
	opentext
	writetext CeladonMansion3FGameProgramText
	nooryes
	iffalse_endtext
	writetext CeladonMansion3FAreYouSureText
	nooryes
	iffalse_endtext
	callasm .MessWithGameProgram
	endtext

.MessWithGameProgram:
	ld a, ERR_PEBKAC
	jmp Crash

MapCeladonMansion3FSignpost3Script:
	jumpthistext

	text "Está repleto de"
	line "material de refe-"
	cont "rencia. Hay hasta"
	cont "un # Muñeco."
	done

GameFreakGameDesignerText:
	text "¿En serio?"

	para "¡Soy el Diseñador"
	line "del Juego!"

	para "Completar la"
	line "#dex es"
	cont "difícil, ¡Pero no"
	cont "te rindas!"
	done

GameFreakGameDesignerCompletedPokedexText:
	text "¡Guau! ¡Excelente!"
	line "¡Completaste tu"
	cont "#dex!"

	para "¡Felicidades!"
	done

GameFreakGameDesignerPauseForDiplomaText:
	text "Para reconocer tu"
	line "logro..."
	cont "¡aquí tienes!"

	para "¡Un reluciente y"
	line "nuevo Diploma!"
	done

GameFreakGameDesignerGiveDiplomaText:
	text "¡<PLAYER> recibió el"
	line "Diploma!"
	done

GameFreakGameDesignerDiplomaSentText:
	text "El Diploma"
	line "fue a casa."
	done


GameFreakDesignerGaveDiplomaText:
	text "¡Felicidades"
	line "por completar"
	cont "tu #dex!"

	para "¡Deberías presumir"
	line "de ese Diploma!"
	done

GameFreakGraphicArtistText:
	text "Soy el Artista"
	line "Gráfico."

	para "¡Yo te dibujé!"
	done

GameFreakGraphicArtistPrintDiplomaText:
	text "Soy el Artista"
	line "Gráfico."

	para "Oh, ¿completaste"
	line "tu #dex?"

	para "¿Quieres que im-"
	line "prima tu Diploma?"
	done

GameFreakGraphicArtistRefusedText:
	text "Avísame si quieres"
	line "que imprima tu"
	cont "Diploma."
	done

GameFreakProgrammerText:
	text "¿Quién, yo? Soy"
	line "el Programador."

	para "¡Usa la Red de"
	line "Intercambio Pro-"
	cont "digioso!"
	done

GameFreakCharacterDesignerText:
	text "¿No es adorable"
	line "Lira?"

	para "Yasmina también"
	line "es bonita."

	para "Oh, ¡me encantan!"
	done



CeladonMansion3FGameProgramText:
	text "Es el código del"
	line "juego. ¡Modificar-"

	para "lo podría causar"
	line "un error!"

	para "¿Quieres modificar-"
	line "lo de todos modos?"
	done

CeladonMansion3FAreYouSureText:
	text "¿Seguro?"
	line "¡Podría crashear!"
	done
