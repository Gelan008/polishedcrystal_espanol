ShamoutiHotelRestaurant_MapScriptHeader:
	def_scene_scripts
	scene_script ShamoutiHotelRestaurantTrigger0

	def_callbacks

	def_warp_events
	warp_event 16,  7, SHAMOUTI_HOTEL_1F, 4
	warp_event 17,  7, SHAMOUTI_HOTEL_1F, 4

	def_coord_events
	coord_event 16,  6, 1, ShamoutiHotelRestaurantLeavingTrigger1
	coord_event 16,  7, 1, ShamoutiHotelRestaurantLeavingTrigger2

	def_bg_events

	def_object_events
	object_event 16,  4, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiHotelRestaurantReceptionistText, -1

	object_const_def
	const SHAMOUTIHOTELRESTAURANT_RECEPTIONIST

ShamoutiHotelRestaurantTrigger0:
	sdefer ShamoutiHotelRestaurantChallengeScript
	end

ShamoutiHotelRestaurantChallengeScript:
	applyonemovement PLAYER, step_up
	opentext
	checkflag ENGINE_SHAMOUTI_RESTAURANT_CHALLENGE
	iftruefwd .AlreadyAte
	writetext .GreetingText
	special PlaceMoneyTopRight
	yesorno
	iffalsefwd .NeverMind
	checkmoney YOUR_MONEY, 5000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	setflag ENGINE_SHAMOUTI_RESTAURANT_CHALLENGE
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 5000
	special PlaceMoneyTopRight
	writetext ShamoutiHotelRestaurantReceptionistText
	waitbutton
	closetext
	applyonemovement PLAYER, step_left
	setscene $1
	end

.AlreadyAte:
	writetext .AlreadyAteText
	sjump ShamoutiHotelRestaurantLeaveScript

.NeverMind:
	writetext .NeverMindText
	sjump ShamoutiHotelRestaurantLeaveScript

.NotEnoughMoney:
	writetext .NotEnoughMoneyText
	sjump ShamoutiHotelRestaurantLeaveScript

.GreetingText:
	text "¡Te damos la"
	line "bienvenida al"
	cont "Restaurante Oasis!"

	para "Aquí disfrutarás"
	line "de la comida y de"
	cont "combates #mon."

	para "Cada día ofrecemos"
	line "un menú nuevo."

	para "El precio es de"
	line "5000¥. ¿Quieres"
	cont "entrar ahora?"
	done

.AlreadyAteText:
	text "Lo siento mucho,"
	line "pero ya has comido"
	cont "aquí hoy."

	para "Por favor, vuelve"
	line "a visitarnos"
	cont "mañana."
	done

.NeverMindText:
	text "Comprendido."
	line "¡Que tengas un"
	cont "buen día!"
	done

.NotEnoughMoneyText:
	text "Lo siento mucho,"
	line "pero no tienes"
	cont "dinero suficiente."
	done

ShamoutiHotelRestaurantLeavingTrigger2:
	applyonemovement PLAYER, step_up
ShamoutiHotelRestaurantLeavingTrigger1:
	turnobject PLAYER, UP
	turnobject SHAMOUTIHOTELRESTAURANT_RECEPTIONIST, DOWN
	opentext
	writetext .LeavingText
	yesorno
	iffalsefwd .Staying
	writetext .GoodbyeText
	sjumpfwd ShamoutiHotelRestaurantLeaveScript

.Staying:
	writetext ShamoutiHotelRestaurantReceptionistText
	waitbutton
	closetext
	applyonemovement PLAYER, step_left
	end

.LeavingText:
	text "¿Quieres marcharte"
	line "ya?"
	done

.GoodbyeText:
	text "Muchas gracias por"
	line "venir."

	para "Por favor, vuelve"
	line "a visitarnos"
	cont "mañana."
	done

ShamoutiHotelRestaurantLeaveScript:
	waitbutton
	closetext
	applyonemovement PLAYER, step_down
	special FadeOutPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	warp SHAMOUTI_HOTEL_1F, 14, 0
	end

ShamoutiHotelRestaurantReceptionistText:
	text "¡Disfruta de la"
	line "comida y del"
	cont "combate!"
	done
