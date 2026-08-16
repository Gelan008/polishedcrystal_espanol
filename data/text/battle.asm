BattleText::

LinkBattleErrorText::
	text "Ha habido un error"
	line "de conexión."

	para "El juego se va a"
	line "reiniciar."
	prompt

BattleText_PlayerPickedUpPayDayMoney:
	text "¡<PLAYER> recogió"
	line "¥"
	text_decimal wPayDayMoney, 3, 6
	text "!"
	prompt

WildPokemonAppearedText:
	text "¡Un "
	stop_compressing_text ; fallthrough
LegendaryAppearedText:
	text_ram wEnemyMonNickname
	line "salvaje apareció!"
	prompt

GhostAppearedText:
	text "¡Un fantasma"
	line "apareció!"
	prompt

SilphScopeRevealText:
	text "¡Scope Silph 2"
	line "reveló al"
	cont "fantasma!"
	prompt

HookedPokemonAttackedText:
	text "¡El "
	text_ram wEnemyMonNickname
	line "pescado atacó!"
	prompt

PokemonFellFromTreeText:
	text "¡"
	text_ram wEnemyMonNickname
	text " cayó"
	line "del árbol!"
	prompt

WantsToBattleText::
	text "¡<ENEMY>"
	line "quiere luchar!"
	prompt

WantToBattleText::
	text "¡<ENEMY>"
	line "quieren luchar!"
	prompt

BattleText_WildFled:
	text "Wild "
	stop_compressing_text ; fallthrough
BattleText_LegendaryFled:
	text_ram wEnemyMonNickname
	line "fled!"
	prompt

BattleText_EnemyFled:
	text "The foe "
	text_ram wEnemyMonNickname
	line "fled!"
	prompt

BattleText_EnemyCantEscape:
	text "¡<USER>"
	line "no puede escapar!"
	prompt

if DEF(DEBUG)
DealtXDamageText:
	text "Dealt "
	text_decimal wCurDamage, 2, 5
	text " dmg"
	line "before roll."
	prompt
endc

HurtByPoisonText:
	text "¡El veneno resta"
	line "salud a"
	cont "<USER>!"
	done

HurtByBurnText:
	text "¡La quemadura"
	line "hiere a"
	cont "<USER>!"
	done

LeechSeedSapsText:
	text "¡Drenadoras quita"
	line "salud a" 
	cont "<USER>!"
	prompt

HurtByCurseText:
	text "¡<USER>"
	line "sufre la"
	cont "maldición!"
	prompt

SandstormHitsText:
	text "¡La arena daña"
	line "a <USER>!"
	prompt

HailHitsText:
	text "¡El granizo daña"
	line "a <USER>!"
	prompt

PerishCountText:
	text "¡La cuenta de"
	line "<USER>"
	cont "cae a "
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

BattleText_UserLostSomeOfItsHP:
	text "¡<USER>"
	line "perdió algo de"
	cont "PS!"
	prompt

BattleText_PickedUpItem:
	text "¡<USER>"
	line "recogió"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_UserRecoveredWithItem:
	text "<USER>"
	line "se recuperó con"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserAteItem:
	text "¡<USER>"
	line "comió"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserHurtByItem:
	text "¡<USER>"
	line "sufrió daño por"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserItemLetItMoveFirst::
	text "¡"
	text_ram wStringBuffer1
	text " de"
	line "<USER> le"
	cont "hizo atacar antes!"
	prompt

BattleText_UserRecoveredPPUsing:
	text "¡<USER>"
	line "restauró PP de"
	cont ""
	text_ram wStringBuffer2
	text " usando"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BrokeLightScreenText:
	text "¡<USER>"
	line "rompió la Pantalla"
	cont "Luz del objetivo!"
	prompt

BrokeReflectText:
	text "¡<USER>"
	line "rompió Reflejo"
	cont "del objetivo!"
	prompt

BattleText_ItemLowered:
	text "¡"
	text_ram wStringBuffer1
	line "bajó"
	cont ""
	text_ram wStringBuffer2
	text " de"
	cont "<USER>!"
	prompt

BattleText_ItemHarshlyLowered:
	text "¡"
	text_ram wStringBuffer1
	line "bajó mucho"
	cont ""
	text_ram wStringBuffer2
	text " de"
	cont "<USER>!"
	prompt

BattleText_ItemSeverelyLowered:
	text "¡"
	text_ram wStringBuffer1
	line "bajó muchísimo"
	cont ""
	text_ram wStringBuffer2
	text " de"
	cont "<USER>!"
	prompt

BattleText_ItemRaised:
	text "¡"
	text_ram wStringBuffer1
	line "subió"
	cont ""
	text_ram wStringBuffer2
	text " de"
	cont "<USER>!"
	prompt

BattleText_ItemSharplyRaised:
	text "¡"
	text_ram wStringBuffer1
	line "subió mucho"
	cont ""
	text_ram wStringBuffer2
	text " de"
	cont "<USER>!"
	prompt

BattleText_ItemDrasticallyRaised:
	text "¡"
	text_ram wStringBuffer1
	line "subió muchísimo"
	cont ""
	text_ram wStringBuffer2
	text " de"
	cont "<USER>!"
	prompt

BattleText_ItemRaisedCrit:
	text "¡<USER>"
	line "usó "
	text_ram wStringBuffer1
	cont "para motivarse!"
	prompt

BattleText_MegaSolCharged:
	text "¡<USER>"
	line "se cargó!"
	prompt

BattleText_UserChargedWithItem:
	text "¡<USER>"
	line "se cargó usando"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UsersFutureSightMissed:
; used when Future Sight can't hit anything because there was
; no target (so <TARGET> is undefined)
	text "¡Premonición"
	line "impactó!"

	para "¡Pero falló!"
	prompt

BattleText_TargetWasHitByFutureSight:
	text "¡<TARGET>"
	line "recibió"
	cont "Premonición!"
	prompt

BattleText_MistFaded:
	text "¡La neblina del"
	line "equipo "
	text_ram wStringBuffer1
	cont "se disipó!"
	prompt

BattleText_SafeguardFaded:
	text "¡Velo Sagrado del"
	line "equipo "
	text_ram wStringBuffer1
	cont "se disipó!"
	prompt

BattleText_LightScreenFell:
	text "¡Pantalla Luz"
	line "del equipo "
	text_ram wStringBuffer1
	cont "se disipó!"
	prompt

BattleText_ReflectFaded:
	text "Reflejo del"
	line "equipo "
	text_ram wStringBuffer1
	cont "se disipó!"
	prompt

BattleText_TheRainStopped:
	text "La lluvia paró."
	prompt

BattleText_TheSunlightFaded:
	text "El sol"
	line "se ocultó."
	prompt

BattleText_TheSandstormSubsided:
	text "La tormenta de"
	line "arena amainó."
	prompt

BattleText_TheHailStopped:
	text "El granizo paró."
	prompt

BattleText_EnemyPkmnFainted:
	text "¡"
	text_ram wEnemyMonNickname
	line "enemigo"
	cont "se debilitó!"
	prompt

GotMoneyForWinningText:
	text "¡<PLAYER> ganó"
	line "¥"
	text_decimal wBattleReward, 3, 6
	text "!"
	prompt

BattleText_EnemyWasDefeated:
	text "¡<PLAYER> venció"
	line "a <ENEMY>!"
	prompt

BattleText_EnemyWereDefeated:
	text "¡<PLAYER> venció"
	line "a <ENEMY>!"
	prompt

TiedAgainstText:
	text "¡Empate contra"
	line "<ENEMY>!"
	prompt

SentSomeToMomText:
	text "¡<PLAYER> ganó"
	line "¥"
	text_decimal wBattleReward, 3, 6
	text "!"
	cont "Envió parte a mamá"
	prompt

SentHalfToMomText:
	text "¡Envió la mitad"
	line "a Mamá!"
	prompt

SentAllToMomText:
	text "¡Envió el dinero"
	line "a Mamá!"
	prompt

BattleText_PkmnFainted:
	text "¡"
	text_ram wBattleMonNickname
	line "se debilitó!"
	prompt

BattleText_UseNextMon:
	text "¿Usar el siguiente"
	line "#mon?"
	done

LostAgainstText:
	text "¡Perdiste contra"
	line "<ENEMY>!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "va a sacar a"
	cont ""
	text_ram wEnemyMonNickname
	text "."

	para "¿Quieres cambiar"
	line "de #mon?"
	done

BattleText_EnemyAreAboutToUseWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "van a sacar a"
	cont ""
	text_ram wEnemyMonNickname
	text "."

	para "¿Quieres cambiar"
	line "de #mon?"
	done

BattleText_EnemyIsAboutToSwitchWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "va a cambiar de"
	cont "#mon."

	para "¿Quieres cambiar"
	line "de #mon?"
	done

BattleText_EnemyAreAboutToSwitchWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "van a cambiar de"
	cont "#mon."

	para "¿Quieres cambiar"
	line "de #mon?"
	done

BattleText_EnemySentOut:
	text "¡<ENEMY>"
	line "envió a"
	cont ""
	text_ram wEnemyMonNickname
	text "!"
	done

BattleText_TheresNoWillToBattle:
	text "¡No hay ganas de"
	line "luchar!"
	prompt

BattleText_AnEGGCantBattle:
	text "¡Un Huevo no"
	line "puede luchar!"
	prompt

BattleText_CantEscape:
	text "¡No puedes huir!"
	prompt

BattleText_AskForfeitTrainerBattle:
	text "¿Seguro que te"
	line "quieres rendir?"
	done

BattleText_GotAwaySafely:
	text "¡Escapaste sin"
	line "problemas!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "¡<USER>"
	line "huyó usando"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserHurtBySpikes:
	text "¡Las Púas hieren"
	line "a <USER>!"
	prompt

RecoveredUsingText:
	text "¡<USER>"
	line "se curó usando"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

AirBalloonPoppedText:
	text "¡El Globo Helio"
	line "de <TARGET>"
	cont "explotó!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text "¡"
	text_ram wStringBuffer1
	line "de <USER>"
	cont "se activó!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "No puedes usar"
	line "objetos aquí."
	prompt

BattleText_PkmnIsAlreadyOut:
	text "¡"
	text_ram wBattleMonNickname
	line "ya está luchando!"
	prompt

BattleText_PkmnCantBeRecalled:
	text "¡"
	text_ram wBattleMonNickname
	line "no puede volver!"
	prompt

BattleText_PkmnCantBeRecalledAbility:
	text "¡"
	text_ram wStringBuffer1
	line "de "
	text_ram wEnemyMonNickname
	cont "impide escapar!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "¡No quedan PP para"
	line "este movimiento!"
	prompt

BattleText_ItemOnlyAllowsMove: ; choice items
	text "¡"
	text_ram wStringBuffer1
	line "solo permite usar"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_MonCanOnlyUseMove:
	text "¡<USER> solo"
	line "puede usar"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_ItemPreventsStatusMoves: ; assault vest
	text "¡"
	text_ram wStringBuffer1
	line "impide el uso de"
	cont "movs. de estado!"
	prompt

BattleText_TheMoveIsDisabled:
	text "¡El movimiento"
	line "está anulado!"
	prompt

BattleText_PkmnHasNoMovesLeft:
	text "¡"
	text_ram wBattleMonNickname
	line "no tiene ataques!"
	done

BattleText_UserEncoreEnded:
	text "¡Otra vez de"
	line "<USER> acabó!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text "¡"
	text_ram wStringBuffer1
	text " subió"
	line "al nivel "
	text_decimal wCurPartyLevel, 1, 3
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_end

BattleText_WildPkmnIsEating:
	text "¡El "
	text_ram wEnemyMonNickname
	line "salvaje come!"
	prompt

BattleText_WildPkmnIsAngry:
	text "¡El "
	text_ram wEnemyMonNickname
	line "salvaje se enfadó!"
	prompt

BattleText_ThrewRock:
	text "<PLAYER> lanzó una"
	line "Roca."
	prompt

BattleText_ThrewBait:
	text "<PLAYER> lanzó"
	line "Cebo."
	prompt

FastAsleepText:
	text "¡<USER>"
	line "está dormido!"
	done

WokeUpText:
	text "¡<USER>"
	line "se despertó!"
	prompt

WasFrozenText:
	text "¡<TARGET>"
	line "se congeló!"
	prompt

FrozenSolidText:
	text "¡<USER>"
	line "está congelado!"
	done

FlinchedText:
	text "¡<USER>"
	line "retrocedió!"
	prompt

MustRechargeText:
	text "¡<USER>"
	line "debe recargar!"
	prompt

DisabledNoMoreText:
	text "¡<USER> ya no"
	line "está anulado!"
	prompt

IsConfusedText:
	text "¡<USER>"
	line "está confuso!"
	prompt

HurtItselfText:
	text "¡Tan confuso que"
	line "se hirió a sí"
	cont "mismo!"
	prompt

ConfusedNoMoreText:
	text "¡<USER> ya no"
	line "está confuso!"
	prompt

BecameConfusedText:
	text "¡<TARGET>"
	line "se confundió!"
	prompt

BecameConfusedDueToFatigueText:
	text "¡<TARGET>"
	line "se confundió"
	cont "por el cansancio!"
	prompt

AlreadyConfusedText:
	text "¡<TARGET> ya"
	line "está confuso!"
	prompt

BattleText_UsersHurtByStringBuffer1:
	text "¡"
	text_ram wStringBuffer1
	line "hiere a"
	cont "<USER>!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "¡<USER>"
	line "fue liberado de"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

WhirlpoolTrapText:
	text "¡<TARGET>"
	line "quedó atrapado!"
	prompt

FireSpinTrapText:
	text "¡<TARGET>"
	line "quedó atrapado!"
	prompt

WrappedByText:
	text "¡<TARGET>"
	line "fue atrapado por"
	cont "<USER>!"
	prompt

HungOnText:
	text "¡<TARGET>"
	line "aguantó con"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

EnduredText:
	text "¡<TARGET>"
	line "resistió el golpe!"
	prompt

InLoveWithText:
	text "¡<USER>"
	line "se enamoró de"
	cont "<TARGET>!"
	prompt

InfatuationText:
	text "¡El enamoramiento"
	line "impide a <USER>"
	cont "atacar!"
	prompt

NoLongerInfatuatedText:
	text "¡<USER> ya"
	line "no está"
	cont "enamorado!"
	prompt

ObliviousPreventedDestinyKnot:
	text "¡"
	text_ram wStringBuffer1
	line "de <USER>"
	cont "impide a"
	cont ""
	text_ram wStringBuffer2
	cont "enamorarlo!"
	prompt

DestinyKnotInfatuatedUser:
	text "¡"
	text_ram wStringBuffer1
	line "de <TARGET>"
	cont "enamoró a"

	para "<USER>!"
	prompt

DisabledMoveText:
	text "¡"
	text_ram wStringBuffer1
	line "de <USER>"
	cont "está anulado!"
	prompt

UsedMoveText:
	text "<USER>"
	line "usó "
	text_ram wStringBuffer2
	text "!"
	done

UsedMoveInsteadText:
	text "<USER>"
	line "usó en su lugar"
	cont ""
	text_ram wStringBuffer2
	text "!"
	done

LoafingAroundText:
	text "¡"
	text_ram wBattleMonNickname
	line "está"
	cont "holgazaneando!"
	prompt

BeganToNapText:
	text "¡"
	text_ram wBattleMonNickname
	line "se echó"
	cont "a dormir!"
	prompt

WontObeyText:
	text "¡"
	text_ram wBattleMonNickname
	line "no obedece!"
	prompt

TurnedAwayText:
	text "¡"
	text_ram wBattleMonNickname
	line "se dio"
	cont "la vuelta!"
	prompt

IgnoredOrdersText:
	text "¡"
	text_ram wBattleMonNickname
	line "ignoró"
	cont "las órdenes!"
	prompt

IgnoredSleepingText:
	text "¡"
	text_ram wBattleMonNickname
	line "ignoró las"
	cont "órdenes…durmiendo!"
	prompt

NoPPLeftText:
	text "¡No quedan PP para"
	line "este movimiento!"
	prompt

HasNoPPLeftText:
	text "¡A <USER>"
	line "no le quedan PP"
	cont "para "
	text_ram wStringBuffer2
	text "!"
	prompt

WentToSleepText:
	text "¡<USER>"
	line "se durmió!"
	done

RestedText:
	text "¡<USER>"
	line "se durmió y curó"
	cont "su salud!"
	done

RegainedHealthText:
	text "¡<USER>"
	line "recuperó su salud!"
	prompt

IsHurtText:
	text "¡<USER>"
	line "está herido!"
	prompt

IsTormentedText:
	text "¡<USER>"
	line "está atormentado!"
	prompt

AttackMissedText:
	text "¡El ataque de"
	line "<USER> falló!"
	prompt

CrashedText:
	text "¡<USER>"
	line "continuó y"
	cont "se estrelló!"
	prompt

UnaffectedText:
	text "¡A <TARGET>"
	line "no le afecta!"
	prompt

DoesntAffectText:
	text "¡No afecta a"
	line "<TARGET>!"
	prompt

CriticalHitText:
	text "¡Un golpe crítico!"
	prompt

ExtremelyEffectiveText:
	text "¡Es súper"
	line "efectivo!"
	prompt

SuperEffectiveText:
	text "¡Es muy efectivo!"
	prompt

NotVeryEffectiveText:
	text "Es poco efectivo…"
	prompt

MostlyIneffectiveText:
	text "Es muy poco"
	line "efectivo…"
	prompt

TookDownWithItText:
	text "¡El vínculo de"
	line "<TARGET>"

	para "se llevó a"
	line "<USER> con él!"
	prompt

RageBuildingText:
	text "¡La furia de"
	line "<USER> crece!"
	prompt

GotAnEncoreText:
	text "¡<TARGET>"
	line "recibió Otra vez!"
	prompt

SharedPainText:
	text "¡Ambos comparten"
	line "el dolor!"
	prompt

SwappedAbilitiesText:
	text "¡Intercambiaron"
	line "las Habilidades!"
	prompt

SwappedItemsText:
	text "¡Intercambiaron"
	line "los objetos!"
	prompt

ChangeIntoTypeText:
	text "¿Cambiar al tipo"
	line "de qué movimiento?"
	prompt

InvalidTypeChangeText:
	text "¡No puedes elegir"
	line "el tipo de mov.!"
	prompt

SketchedText:
	text "¡<USER>"
	line "bocetó"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

DestinyBondEffectText:
	text "¡<USER>"
	line "intenta llevarse"
	cont "a su rival!"
	prompt

BellChimedText:
	text "¡Sonó una campana!"
	line ""
	prompt

FellAsleepText:
	text "¡<TARGET>"
	line "se durmió!"
	prompt

AlreadyAsleepText:
	text "¡<TARGET> ya"
	line "está dormido!"
	prompt

WasPoisonedText:
	text "¡<TARGET>"
	line "fue envenenado!"
	prompt

BadlyPoisonedText:
	text "¡<TARGET> fue"
	line "gravemente"
	cont "envenenado!"
	prompt

AlreadyPoisonedText:
	text "¡<TARGET> ya"
	line "está envenenado!"
	prompt

SuckedHealthText:
	text "¡Drenó salud a"
	line "<TARGET>!"
	prompt

DreamEatenText:
	text "¡Se comió el"
	line "sueño de <TARGET>!"
	prompt

WasBurnedText:
	text "¡<TARGET>"
	line "se quemó!"
	prompt

AlreadyBurnedText:
	text "¡<TARGET> ya"
	line "está quemado!"
	prompt

WontRiseAnymoreText:
	text "¡"
	text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "no subirá más!"
	prompt

WontDropAnymoreText:
	text "¡"
	text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "no bajará más!"
	prompt

StatRoseText:
	text "¡"
	text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "subió!"
	prompt

StatRoseSharplyText:
	text "¡"
	text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "subió mucho!"
	prompt

StatRoseDrasticallyText:
	text "¡"
	text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "subió muchísimo!"
	prompt

StatFellText:
	text "¡"
	text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "bajó!"
	prompt

StatHarshlyFellText:
	text "¡"
	text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "bajó mucho!"
	prompt

StatSeverelyFellText:
	text "¡"
	text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "bajó muchísimo!"
	prompt

FledFromBattleText::
	text "¡<USER>"
	line "huyó del combate!"
	prompt

FledInFearText:
	text "¡<TARGET>"
	line "huyó asustado!"
	prompt

HitNTimesText:
	text "¡"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " golpe"
	text_plural
	text "!"
	prompt

MistText:
	text "¡<USER>"
	line "está rodeado de"
	cont "neblina!"
	prompt

ProtectedByItemText:
	text "¡<TARGET> se"
	line "protege con"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

ProtectedByMistText:
	text "¡<TARGET> está"
	line "protegido por"
	cont "la neblina!"
	prompt

GettingPumpedText:
	text_pause
	text "¡<USER>"
	line "se está"
	cont "preparando!"
	prompt

RecoilText:
	text "¡<USER>"
	line "sufre daño por"
	cont "retroceso!"
	prompt

MadeSubstituteText:
	text "¡<USER>"
	line "creó un Sustituto!"
	prompt

HasSubstituteText:
	text "¡<USER>"
	line "tiene un"
	cont "Sustituto!"
	prompt

TooWeakSubText:
	text "¡Demasiado débil"
	line "para crear uno!"
	prompt

SubTookDamageText:
	text "¡El Sustituto"
	line "sufrió daño por"
	cont "<TARGET>!"
	prompt

SubFadedText:
	text "¡El Sustituto de"
	line "<TARGET> cayó!"
	prompt

WasSeededText:
	text "¡A <TARGET>"
	line "le infectaron!"
	prompt

EvadedText:
	text "¡<TARGET>"
	line "evitó el ataque!"
	prompt

WasDisabledText:
	text "¡Anuló "
	text_ram wStringBuffer2
	text " de"
	line "<TARGET>!"
	prompt

CoinsScatteredText:
	text "¡Monedas"
	line "esparcidas por"
	cont "todos lados!"
	prompt

TransformedTypeText:
	text "¡<USER>"
	line "pasó a ser del"
	cont "tipo "
	text_ram wStringBuffer1
	text "!"
	prompt

EliminatedStatsText:
	text "¡Los cambios en"
	line "las estadísticas"
	cont "se eliminaron!"
	prompt

TransformedText:
	text "¡<USER> se"
	line "transformó en"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

TrickRoomText:
	text "¡<USER>"
	line "retorció las"
	cont "dimensiones!"
	prompt

TrickRoomEndedText:
	text "Las dimensiones"
	line "retorcidas"

	para "volvieron a la"
	line "normalidad."
	prompt

LightScreenEffectText:
	text "¡Subió Def. Esp."
	line "de <USER>!"
	prompt

ReflectEffectText:
	text "¡Subió Defensa"
	line "de <USER>!"
	prompt

NothingHappenedText:
	text "Pero no ocurrió"
	line "nada."
	prompt

ButItFailedText:
	text "¡Pero falló!"
	prompt

DidntAffectText:
	text "¡No le afectó"
	line "a <TARGET>!"
	prompt

HPIsFullText:
	text "¡Los PS de"
	line "<USER> están"
	cont "a tope!"
	prompt

DraggedOutText:
	text "¡<USER>"
	line "salió arrastrado!"
	prompt

ParalyzedText:
	text "¡<TARGET> se"
	line "paralizó! ¡Quizás"
	cont "no pueda atacar!"
	prompt

FullyParalyzedText:
	text "¡<USER> está"
	line "paralizado!"
	done

AlreadyParalyzedText:
	text "¡<TARGET> ya"
	line "está paralizado!"
	prompt

ProtectedByText:
	text "¡<TARGET> se"
	line "protegió con"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

RegainedStatsWithItem:
	text "¡<USER>"
	line "recuperó est. con"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

CuredInfatuationWithItem:
	text "¡<USER> curó"
	line "enamoramiento con"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

CuredEncoreWithItem:
	text "¡<USER> curó"
	line "Otra vez con"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

CuredDisableWithItem:
	text "¡<USER> curó"
	line "Anulación con"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

StoleText:
	text "¡<USER>"
	line "robó "
	text_ram wStringBuffer1
	cont "a su rival!"
	prompt

KnockedOffItemText:
	text "¡<USER>"
	line "desprendió"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

CantEscapeNowText:
	text "¡<TARGET>"
	line "ya no puede huir!"
	prompt

WasDefrostedText:
	text "¡<USER>"
	line "se descongeló!"
	prompt

PutACurseText:
	text "¡<USER> bajó sus"
	line "PS y maldijo a"
	cont "<TARGET>!"
	prompt

ProtectedItselfText:
	text "¡<USER> se"
	line "ha protegido!"
	prompt

ProtectingItselfText:
	text "¡<TARGET> se"
	line "está protegiendo!"
	done

SpikesText:
	text "¡Espinas alrededor"
	line "de <TARGET>!"
	prompt

ToxicSpikesText:
	text "¡Púas Tóxicas"
	line "alrededor de"
	cont "<TARGET>!"
	prompt

IdentifiedText:
	text "¡<USER>"
	line "identificó a"
	cont "<TARGET>!"
	prompt

StartPerishSongText:
	text "Los #mon que"
	line "oigan el canto"
	cont "mueren en 3 turnos"
	prompt

StartPerishBodyText:
	text "¡Ambos #mon se"
	line "debilitarán en"
	cont "3 turnos!"
	prompt

SandstormBrewedText:
	text "¡Comenzó una"
	line "tormenta de arena!"
	prompt

HailStartedText:
	text "Empezó a granizar"
	prompt

BracedItselfText:
	text "¡<USER> se"
	line "ha preparado!"
	prompt

FellInLoveText:
	text "¡<TARGET> se"
	line "ha enamorado!"
	prompt

CoveredByVeilText:
	text "¡<USER> está"
	line "cubierto por velo!"
	prompt

SafeguardProtectText:
	text "¡<TARGET> está"
	line "protegido por"
	cont "Velo Sagrado!"
	prompt

MagnitudeText:
	text "Magnitud "
	text_decimal wTextDecimalByte, 1, 2
	text "!"
	prompt

ReleasedByText:
	text "¡<USER> fue"
	line "liberado por"
	cont "<TARGET>!"
	prompt

ShedLeechSeedText:
	text "¡<USER> se libró"
	line "de Drenadoras!"
	prompt

BlewSpikesText:
	text "¡<USER> eliminó"
	line "las Púas!"
	prompt

BlewToxicSpikesText:
	text "¡<USER> eliminó"
	line "las Púas Tóxicas!"
	prompt

DownpourText:
	text "¡Empezó a llover!"
	prompt

SunGotBrightText:
	text "¡El sol se volvió"
	line "muy intenso!"
	prompt

BellyDrumText:
	text "¡<USER> redujo"
	line "sus PS y alzó"
	cont "su Ataque!"
	prompt

BellyDrumContraryText:
	text "¡<USER> redujo"
	line "sus PS y bajó"
	cont "su Ataque!"
	prompt

ForesawAttackText:
	text "¡<USER> previó"
	line "un ataque!"
	prompt

IgnoredOrders2Text:
	text "¡<USER>"
	line "ignoró las"
	cont "órdenes!"
	prompt

BecameHealthyText:
	text "¡<USER>"
	line "recuperó su"
	cont "salud!"
	prompt

PlayerAffectionEndureText:
	text "¡<USER>"
	line "resistió para que"

	para "<PLAYER>"
	line "no se pusiera"
	cont "triste!"
	prompt

EnemyAffectionEndureText:
	text "¡<USER>"
	line "resistió para que"

	para "<ENEMY>"
	line "no se pusiera"
	cont "triste!"
	prompt

PlayerAffectionEvasionText:
	text "¡<USER>"
	line "esquivó el ataque"

	para "al escuchar a"
	line "<PLAYER>!"
	prompt

EnemyAffectionEvasionText:
	text "¡<USER>"
	line "esquivó el ataque"

	para "al escuchar a"
	line "<ENEMY>!"
	prompt

PlayerAffectionSelfCureText:
	text "¡<USER>"
	line "se curó para que"

	para "<PLAYER>"
	line "no se preocupase!"
	prompt

EnemyAffectionSelfCureText:
	text "¡<USER>"
	line "se curó para que"

	para "<ENEMY>"
	line "no se preocupase!"
	prompt

AffectionCriticalText: ; same for both player and enemy
	text "¡<USER>"
	line "acertó un crítico,"

	para "deseando que"
	line "lo felicitasen!"
	prompt

NotifyAirBalloonText:
	text "¡<USER>"
	line "flota en el aire"
	cont "con "
	text_ram wStringBuffer1
	text "!"
	prompt

TraceActivationText:
	text "¡<USER>"
	line "rastreó"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_IntimidateResisted:
	text "¡"
	text_ram wStringBuffer1
	line "de <TARGET>"

	para "le protege de"
	line "Intimidación!"
	prompt

NotifyCloudNine:
	text "¡Se ha suprimido"
	line "el clima!"
	prompt

NotifyPressure:
	text "¡<USER> está"
	line "ejerciendo"
	cont "su presión!"
	prompt

NotifyMoldBreaker:
	text "¡<USER>"
	line "rompe el molde!"
	prompt

NotifyUnnerve:
	text "¡<TARGET> teme"
	line "comer Bayas!"
	prompt

NotifyNeutralizingGas:
	text "¡Un gas reactivo"
	line "llenó la zona!"
	prompt

FriskedItemText:
	text "¡<USER>"
	line "cacheó al rival"

	para "y encontró"
	line ""
	text_ram wStringBuffer1
	text "!"
	prompt

PickedItemText:
	text "¡<USER>"
	line "recogió"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

HarvestedItemText:
	text "¡<USER>"
	line "cosechó"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

FirePoweredUpText:
	text "¡Subió el poder"
	line "de ataques Fuego"
	cont "de <USER>!"
	prompt

AngerPointMaximizedAttackText:
	text "¡<USER>"
	line "maximizó su Ataq.!"
	prompt

CannotUseText:
	text "¡<TARGET>"
	line "no puede usar"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

ShudderedText:
; since the ability works with the opponent move data,
; it is on the opponent turn mostly
	text "¡<TARGET>"
	line "se estremeció!"
	prompt

ForewarnText:
	text "¡<TARGET>"
	line "tiene "
	text_ram wStringBuffer1
	text "!"
	prompt

BouncedBackText:
	text "¡<USER>"
	line "devolvió"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

ItemCantBeStolenText:
	text "¡El objeto de"
	line "<TARGET> no"
	cont "puede ser robado!"
	prompt

SuckedUpOozeText:
	text "¡<USER>"
	line "absorbió el"
	cont "lodo líquido!"
	prompt

BattleText_EnemyWithdrew::
	text "¡<ENEMY>"
	line "retiró a"
	cont ""
	text_ram wEnemyMonNickname
	text "!"
	prompt

BattleText_WentBackToPlayer:
	text "¡<USER> volvió"
	line "a <PLAYER>!"
	prompt

BattleText_WentBackToEnemy:
	text "¡<USER>"
	line "volvió a"
	cont "<ENEMY>!"
	prompt

ScaredText:
	text "¡<USER> teme"
	line "moverse!"
	prompt

GetOutText:
	text "Ghost: Vete…"
	line "Vete…"
	prompt

CalFinalPkmnText:
CarrieFinalPkmnText:
JackyFinalPkmnText:
EunaFinalPkmnText:
	text "¡Aún me queda"
	line "un #mon!"
	prompt

FalknerFinalPkmnText:
	text "¡Por fin el viento"
	line "está a favor!"
	prompt

BugsyFinalPkmnText:
	text "Aunque sea"
	line "mi último #mon,"

	para "¡los bicho son"
	line "muy duros!"
	prompt

WhitneyFinalPkmnText:
	text "¡O-oye! ¿Solo me"
	line "queda uno? Pero…"

	para "No voy a perder,"
	line "¿me oyes?"
	prompt

MortyFinalPkmnText:
	text "¡Aún creo"
	line "que podemos!"
	prompt

ChuckFinalPkmnText:
	text "¡Aún no"
	line "hemos perdido!"
	prompt

JasmineFinalPkmnText:
	text "¡El buen acero"
	line "resiste hasta"
	cont "el final!"
	prompt

PryceFinalPkmnText:
	text "Humm… Eres un"
	line "buen Entrenador."
	prompt

ClairFinalPkmnText:
	text "¿Un último #mon?"
	line "¡Aquí es donde de"
	cont "verdad empezamos!"
	prompt

WillFinalPkmnText:
	text "¡Los psíquicos no"
	line "nos rendimos hasta"
	cont "llegar a cero!"
	prompt

KogaFinalPkmnText:
	text "¡Juajuajua!"
	line "¡Me he confiado"

	para "desde el"
	line "principio!"
	prompt

BrunoFinalPkmnText:
	text "¡Lucha tan duro"
	line "como puedas hasta"
	cont "caer!"
	prompt

KarenFinalPkmnText:
	text "¡Esto no es nada"
	line "parecido a estar"
	cont "acorralado!"
	prompt

ChampionFinalPkmnText:
	text "¡Muy bien!"
	line "¡Pensaba que esto"
	cont "nunca pasaría!"
	prompt

BrockFinalPkmnText:
	text "¡Ja ja ja!"
	line "¡Qué gracioso!"
	prompt

MistyFinalPkmnText:
	text "Hmm… Eres"
	line "bastante bueno…"
	prompt

LtSurgeFinalPkmnText:
	text "Esto no ha acabado"
	line "¡Solo acaba"
	cont "de empezar!"
	prompt

ErikaFinalPkmnText:
	text "No te contengas."
	line "¡Dame todo"
	cont "lo que tengas!"
	prompt

JanineFinalPkmnText:
	text "¡Tu técnica de"
	line "combate es genial!"
	prompt

SabrinaFinalPkmnText:
	text "¿Qué pasará"
	line "después de esto?"
	cont "Ya lo sé."
	prompt

BlaineFinalPkmnText:
	text "¡Te enseñaré el"
	line "espíritu de mi"
	cont "Gimnasio cueva!"
	prompt

BlueFinalPkmnText:
	text "Je je je…"
	line "No estás preparado"

	para "para esto. ¡Te"
	line "machacaremos!"
	prompt

RedFinalPkmnText: ; text > text
LeafFinalPkmnText:
	text "………………"
	prompt

Rival1_1FinalPkmnText:
	text "…¡Hum!"
	line "Lo haces bien para"
	cont "ser tan débil."
	prompt

Rival1_2FinalPkmnText:
	text "Hay que tener"
	line "mucho valor para"
	cont "venir aquí…"
	prompt

Rival1_3FinalPkmnText:
	text "Por pura desespe-"
	line "ración, los más"

	para "débiles a veces se"
	line "defienden bien."
	prompt

Rival1_4FinalPkmnText:
	text "¡Eh, eh!"
	line "¿Por qué tan"
	cont "serio?"
	prompt

Rival1_5FinalPkmnText:
	text "Ya veo. Parece que"
	line "no fue solo suerte"

	para "lo que te trajo"
	line "hasta aquí."
	prompt

Rival2_1FinalPkmnText:
	text "Ya veo. No viniste"
	line "a Kanto solo para"
	cont "presumir…"
	prompt

Rival2_2FinalPkmnText:
	text "¡¿Por qué?! ¡Aún"
	line "me queda uno!"
	prompt

Lyra1_1FinalPkmnText:
	text "¿Nunca has tenido"
	line "un combate #mon"
	cont "antes, verdad?"

	para "Podría explicarlo,"
	line "pero aprenderás"

	para "más con la"
	line "experiencia."

	para "¡Esfuérzate,"
	line "<PLAYER>!"
	prompt

Lyra1_2FinalPkmnText:
	text "¡Estás aprendiendo"
	line "rápido, <PLAYER>!"
	prompt

Lyra1_3FinalPkmnText:
	text "¡Vale! ¡Hora de mi"
	line "último #mon!"
	prompt

Lyra1_4FinalPkmnText:
	text "Gane o pierda,"
	line "¡ha sido un"
	cont "combate genial!"
	prompt

Lyra2_1FinalPkmnText:
	text "Me has dejado con"
	line "mi último #mon…"
	prompt

Proton1FinalPkmnText:
	text "¿En serio me ibas"
	line "a seguir hasta"
	cont "aquí?"
	prompt

Proton2FinalPkmnText:
	text "Vayamos donde"
	line "vayamos, siempre"
	cont "hay quien se queje"
	prompt

Petrel1FinalPkmnText:
	text "¿Qué? ¿Estoy"
	line "perdiendo?"
	prompt

Petrel2FinalPkmnText:
	text "¡Eh, eres bueno!"
	prompt

Archer1FinalPkmnText:
	text "¡No podemos dejar"
	line "que nos molestes"

	para "antes de que"
	line "vuelva Giovanni!"
	prompt

Archer2FinalPkmnText:
	text "Ah, es verdad que"
	line "tienes fuerza,"
	cont "pero… ¿bastará?"
	prompt

Ariana1FinalPkmnText:
	text "¿Có… cómo…? ¡¿Por"
	line "qué tienes tanta"
	cont "fuerza?!"
	prompt

Ariana2FinalPkmnText:
	text "¡Oye! ¡¿Qué te has"
	line "creído que estás"
	cont "haciendo?!"
	prompt

Giovanni1FinalPkmnText:
	text "¡Mi #mon es"
	line "invencible!"
	prompt

Giovanni2FinalPkmnText:
	text "¡No me digas que"
	line "un crío sin expe-"

	para "riencia puede ser"
	line "tan fuerte!"
	prompt

ProfOakFinalPkmnText:
	text "¡Hm! ¡Excelente!"
	line "¡Pero aún"
	cont "no terminamos!"
	prompt

ProfElmFinalPkmnText:
	text "Ya casi"
	line "se acaba…"
	prompt

ProfIvyFinalPkmnText:
	text "¡Estoy cayendo,"
	line "pero no hundida!"
	prompt

MysticalManFinalPkmnText:
	text "¡Hora de un"
	line "regreso épico!"
	prompt

KarateKingFinalPkmnText:
	text "¡Yaaarggh!"
	prompt

PalmerFinalPkmnText:
	text "¡Bravo!"
	prompt

ThortonFinalPkmnText:
	text "¡Hala!"
	prompt

JessieJamesFinalPkmnText:
	text "¡Tenemos una gran"
	line "tradición de fra-"
	cont "casos a mantener!"
	prompt

LoreleiFinalPkmnText:
	text "¡Solo probaste"
	line "un poco de mi"
	cont "poder!"
	prompt

AgathaFinalPkmnText:
	text "¡No te creas"
	line "que ganaste, niño!"
	prompt

StevenFinalPkmnText:
	text "Sabía que ibas"
	line "a ser fuerte…"
	prompt

CynthiaFinalPkmnText:
	text "¡No dejaré que"
	line "esto acabe ya!"
	prompt

InverFinalPkmnText:
	text "¡Estás pillándole"
	line "el truco a esto!"
	prompt

CherylFinalPkmnText:
	text "No puedo seguir"
	line "curando…"
	prompt

RileyFinalPkmnText:
	text "¡Tu equipo! ¡Sien-"
	line "-to tu gran aura!"
	prompt

BuckFinalPkmnText:
	text "¡Esto! ¡Esto está"
	line "que echa humo!"
	prompt

MarleyFinalPkmnText:
	text "…Mi tiempo contigo"
	line "se está acabando."
	prompt

MiraFinalPkmnText:
	text "¡Oh, no! ¡Eres"
	line "demasiado para mí!"
	prompt

AnabelFinalPkmnText:
	text "Tu talento…"
	line "Es real."
	prompt

DarachFinalPkmnText:
	text "¡Mi último"
	line "bastión!¡Adelante!"
	prompt

CaitlinFinalPkmnText:
	text "Incluso ahora,"
	line "debo mantenerme"
	cont "serena y fría…"
	prompt

CandelaFinalPkmnText:
	text "¡Hasta el final!"
	line "¡Qué emocionante!"
	prompt

BlancheFinalPkmnText:
	text "La verdad es que"
	line "me impresionas."
	prompt

SparkFinalPkmnText:
	text "¡Eres bueno!"
	line "¡Sin duda!"
	prompt

FlanneryFinalPkmnText:
	text "Em… ¿Qué"
	line "debería hacer?"
	prompt

MayleneFinalPkmnText:
	text "¡Este no es"
	line "el fin, amigo!"
	prompt

MarlonFinalPkmnText:
	text "Oh, amigo…"

	para "Sé que casi he"
	line "acabado, ¡pero"
	cont "estoy a tope!"
	prompt

ValerieFinalPkmnText:
	text "Vaya por dios…"
	prompt

KukuiFinalPkmnText:
	text "¡Mi alma arde,"
	line "sí!"
	prompt

PiersFinalPkmnText:
	text "No hago bises,"
	line "¿lo pillas?"

	para "Ni canciones…"
	line "Ni pasos…"
	cont "¡Ni #mon!"
	prompt

LarryFinalPkmnText:
	text "Siempre doy mis"
	line "mejores resultados"

	para "en el momento"
	line "decisivo."
	prompt

BillFinalPkmnText:
	text "¡Yeehah!"
	line "¡Qué combate!"
	prompt

YellowFinalPkmnText:
	text "Mi último #mon…"
	line "¡Préstame tu"
	cont "poder!"
	prompt

WalkerFinalPkmnText:
	text "¡Aún podemos"
	line "volar!"
	prompt

ImakuniFinalPkmnText:
	text "¡Voy a huir!"
	line "…¿No puedo?"
	prompt

LawrenceFinalPkmnText:
	text "¡Inconcebible!"
	prompt

ReiFinalPkmnText:
	text "Aún no he acabado."
	prompt
