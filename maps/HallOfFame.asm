HallOfFame_MapScriptHeader:
	def_scene_scripts
	scene_script HallOfFameEnterScene, SCENE_HALLOFFAME_ENTER
	scene_const SCENE_HALLOFFAME_NOOP

	def_callbacks

	def_warp_events
	warp_event  4, 13, LANCES_ROOM, 3
	warp_event  5, 13, LANCES_ROOM, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 12, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1

	object_const_def
	const HALLOFFAME_LANCE

HallOfFameEnterScene:
	sdefer .Script
	end

.Script:
	follow HALLOFFAME_LANCE, PLAYER
	applymovement HALLOFFAME_LANCE, .WalkUpMovement
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext .LanceText1
	waitbutton
	readvar VAR_BADGES
	ifequalfwd 16, .CheckGoldTrophy
	checkevent EVENT_DECO_SILVER_TROPHY
	iftruefwd .NoTrophy
	sjumpfwd .SilverTrophy
.CheckGoldTrophy
	checkevent EVENT_DECO_GOLD_TROPHY
	iftruefwd .NoTrophy
	sjumpfwd .GoldTrophy
.SilverTrophy
	writetext .LanceTrophyText
	waitbutton
	setevent EVENT_DECO_SILVER_TROPHY
	writetext .SilverTrophyText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext .SilverTrophySentText
	waitbutton
	sjumpfwd .NoTrophy
.GoldTrophy
	writetext .LanceTrophyText
	waitbutton
	setevent EVENT_DECO_GOLD_TROPHY
	writetext .GoldTrophyText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext .GoldTrophySentText
	waitbutton
.NoTrophy
	writetext .LanceText2
	waitbutton
	closetext
	turnobject HALLOFFAME_LANCE, UP
	applyonemovement PLAYER, slow_step_up
	setscene SCENE_HALLOFFAME_NOOP
	pause 15
	setval 2 ; Machine is in the Hall of Fame
	special HealMachineAnim
	readvar VAR_BADGES
	ifless 16, .NotATrueRematch
	setevent EVENT_BEAT_ELITE_FOUR_AGAIN
.NotATrueRematch
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_RIVAL_SPROUT_TOWER
	setevent EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	clearevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	special RespawnOneOffs
	setmapscene SPROUT_TOWER_3F, SCENE_SPROUTTOWER3F_NOOP
	special HealParty
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftruefwd .SkipPhoneCall
	specialphonecall SPECIALCALL_SSTICKET
	setevent EVENT_BATTLE_TOWER_OPEN
	clearevent EVENT_BATTLE_TOWER_CLOSED
.SkipPhoneCall:
	blackoutmod NEW_BARK_TOWN
	halloffame
	end

.WalkUpMovement:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	turn_head_left
	step_end

.LanceText1:
	text "Lance: Ha pasado"
	line "mucho tiempo desde"
	cont "la última vez que"
	cont "estuve aquí."

	para "Aquí es donde hon-"
	line "ramos a los Cam-"
	cont "peones de la Liga"
	cont "para siempre."

	para "Sus valientes"
	line "#mon también"
	cont "son inmortaliza-"
	cont "dos."
	done

.LanceTrophyText:
	text "Toma esto como re-"
	line "cuerdo de lo que"

	para "has logrado aquí"
	line "hoy."
	done

.LanceText2:
	text "Hoy aquí hemos"
	line "presenciado el as-"
	cont "censo de un nuevo"

	para "Campeón de la"
	line "Liga: un entre-"
	cont "nador que siente"

	para "compasión y con-"
	line "fianza hacia todos"
	cont "los #mon."

	para "Un entrenador que"
	line "ha triunfado gra-"
	cont "cias a la perse-"

	para "verancia y a la"
	line "determinación."

	para "¡El nuevo Campeón"
	line "de la Liga que"

	para "tiene madera de"
	line "grandeza!"

	para "<PLAYER>, permi-"
	line "te que te regis-"
	cont "tre a ti y a tus"

	para "compañeros como"
	line "Campeones."
	done

.GoldTrophyText:
	text "<PLAYER> recibe"
	line "Trofeo Oro."
	done

.GoldTrophySentText:
	text "El Trofeo Oro"
	line "se ha enviado a"
	cont "casa."
	done

.SilverTrophyText:
	text "<PLAYER> recibe"
	line "Trofeo Plata."
	done

.SilverTrophySentText:
	text "El Trofeo Plata"
	line "se ha enviado a"
	cont "casa."
	done
