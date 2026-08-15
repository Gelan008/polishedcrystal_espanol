AbilityDescriptions:
	table_width 2
	dw NoAbilityDescription
	dw StenchDescription
	dw DrizzleDescription
	dw SpeedBoostDescription
	dw BattleArmorDescription
	dw SturdyDescription
	dw DampDescription
	dw LimberDescription
	dw SandVeilDescription
	dw StaticDescription
	dw VoltAbsorbDescription
	dw WaterAbsorbDescription
	dw ObliviousDescription
	dw CloudNineDescription
	dw CompoundEyesDescription
	dw InsomniaDescription
	dw ImmunityDescription
	dw FlashFireDescription
	dw ShieldDustDescription
	dw OwnTempoDescription
	dw SuctionCupsDescription
	dw IntimidateDescription
	dw ShadowTagDescription
	dw LevitateDescription
	dw EffectSporeDescription
	dw SynchronizeDescription
	dw ClearBodyDescription
	dw NaturalCureDescription
	dw LightningRodDescription
	dw SereneGraceDescription
	dw SwiftSwimDescription
	dw ChlorophyllDescription
	dw IlluminateDescription
	dw TraceDescription
	dw HugePowerDescription
	dw PoisonPointDescription
	dw InnerFocusDescription
	dw MagmaArmorDescription
	dw WaterVeilDescription
	dw MagnetPullDescription
	dw SoundproofDescription
	dw RainDishDescription
	dw SandStreamDescription
	dw PressureDescription
	dw ThickFatDescription
	dw EarlyBirdDescription
	dw FlameBodyDescription
	dw RunAwayDescription
	dw KeenEyeDescription
	dw HyperCutterDescription
	dw PickupDescription
	dw HustleDescription
	dw CuteCharmDescription
	dw StickyHoldDescription
	dw ShedSkinDescription
	dw GutsDescription
	dw MarvelScaleDescription
	dw LiquidOozeDescription
	dw OvergrowDescription
	dw BlazeDescription
	dw TorrentDescription
	dw SwarmDescription
	dw RockHeadDescription
	dw DroughtDescription
	dw ArenaTrapDescription
	dw VitalSpiritDescription
	dw WhiteSmokeDescription
	dw ShellArmorDescription
	dw TangledFeetDescription
	dw MotorDriveDescription
	dw RivalryDescription
	dw SteadfastDescription
	dw SnowCloakDescription
	dw GluttonyDescription
	dw AngerPointDescription
	dw UnburdenDescription
	dw DrySkinDescription
	dw DownloadDescription
	dw IronFistDescription
	dw PoisonHealDescription
	dw AdaptabilityDescription
	dw SkillLinkDescription
	dw HydrationDescription
	dw SolarPowerDescription
	dw QuickFeetDescription
	dw SniperDescription
	dw MagicGuardDescription
	dw NoGuardDescription
	dw TechnicianDescription
	dw LeafGuardDescription
	dw MoldBreakerDescription
	dw SuperLuckDescription
	dw AftermathDescription
	dw AnticipationDescription
	dw ForewarnDescription
	dw UnawareDescription
	dw TintedLensDescription
	dw FilterDescription
	dw ScrappyDescription
	dw IceBodyDescription
	dw SolidRockDescription
	dw SnowWarningDescription
	dw HoneyGatherDescription
	dw FriskDescription
	dw RecklessDescription
	dw BadDreamsDescription
	dw PickpocketDescription
	dw SheerForceDescription
	dw ContraryDescription
	dw UnnerveDescription
	dw DefiantDescription
	dw CursedBodyDescription
	dw WeakArmorDescription
	dw LightMetalDescription
	dw MultiscaleDescription
	dw HarvestDescription
	dw MoodyDescription
	dw OvercoatDescription
	dw PoisonTouchDescription
	dw RegeneratorDescription
	dw BigPecksDescription
	dw SandRushDescription
	dw WonderSkinDescription
	dw AnalyticDescription
	dw ImposterDescription
	dw InfiltratorDescription
	dw MoxieDescription
	dw JustifiedDescription
	dw RattledDescription
	dw MagicBounceDescription
	dw SapSipperDescription
	dw PranksterDescription
	dw SandForceDescription
	dw IronBarbsDescription
	dw FurCoatDescription
	dw BulletproofDescription
	dw CompetitiveDescription
	dw MegaLauncherDescription
	dw ToughClawsDescription
	dw PixilateDescription
	dw ParentalBondDescription
	dw BerserkDescription
	dw SlushRushDescription
	dw GalvanizeDescription
	dw CorrosionDescription
	dw FluffyDescription
	dw TanglingHairDescription
	dw ScreenCleanerDescription
	dw SteelySpiritDescription
	dw PerishBodyDescription
	dw GorillaTacticsDescription
	dw NeutralizingGasDescription
	dw PastelVeilDescription
	dw QuickDrawDescription
	dw WindRiderDescription
	dw CudChewDescription
	dw SharpnessDescription
	dw ArmorTailDescription
	dw MindsEyeDescription
	dw MegaSolDescription
	assert_table_length NUM_ABILITIES

NoAbilityDescription:
	text "Habilidades"
	next "anuladas."
	done

StenchDescription:
	text "Puede hacer que"
	next "el rival retroceda."
	done

DrizzleDescription:
	text "Invoca la lluvia"
	next "al entrar a luchar."
	done

SpeedBoostDescription:
	text "Sube la Velocidad"
	next "gradualmente."
	done

BattleArmorDescription:
ShellArmorDescription:
	text "Protege de los"
	next "golpes críticos."
	done

SturdyDescription:
	text "Evita caer debili-"
	next "-tado de un golpe."
	done

DampDescription:
	text "Evita movimientos"
	next "de autodestrucción."
	done

LimberDescription:
	text "Protege contra"
	next "la parálisis."
	done

SandVeilDescription:
	text "Sube la evasión"
	next "en tormenta arena."
	done

StaticDescription:
	text "El contacto puede"
	next "causar parálisis."
	done

VoltAbsorbDescription:
	text "Cura PS al recibir"
	next "ataques Eléctricos."
	done

WaterAbsorbDescription:
	text "Cura PS al recibir"
	next "ataques de Agua."
	done

ObliviousDescription:
	text "Evita que caiga"
	next "en enamoramiento."
	done

CloudNineDescription:
	text "Anula los efectos"
	next "del clima."
	done

CompoundEyesDescription:
	text "Aumenta precisión"
	next "del #mon."
	done

InsomniaDescription:
VitalSpiritDescription:
	text "Evita caer"
	next "dormido."
	done

ImmunityDescription:
PastelVeilDescription:
	text "Evita caer"
	next "envenenado."
	done

FlashFireDescription:
	text "Potencia el Fuego"
	next "si recibe ese tipo."
	done

ShieldDustDescription:
	text "Bloquea efectos"
	next "secundarios."
	done

OwnTempoDescription:
	text "Evita caer en"
	next "confusión."
	done

SuctionCupsDescription:
	text "Evita los cambios"
	next "forzados."
	done

IntimidateDescription:
	text "Baja el Ataque"
	next "del rival."
	done

ShadowTagDescription:
	text "Evita que el"
	next "rival escape."
	done

LevitateDescription:
	text "Otorga inmunidad"
	next "a ataques Tierra."
	done

EffectSporeDescription:
	text "El contacto causa"
	next "Par, Env o Dor."
	done

SynchronizeDescription:
	text "Pasa Env, Par"
	next "o Que al rival."
	done

ClearBodyDescription:
WhiteSmokeDescription:
	text "Evita que el rival"
	next "baje las caract."
	done

NaturalCureDescription:
	text "Cura problemas de"
	next "estado al cambiar."
	done

LightningRodDescription:
	text "Ataques Eléctricos"
	next "suben At.Esp."
	done

SereneGraceDescription:
	text "Sube probabilidad"
	next "de efectos extra."
	done

SwiftSwimDescription:
	text "Sube la Velocidad"
	next "bajo la lluvia."
	done

ChlorophyllDescription:
	text "Sube la Velocidad"
	next "con sol radiante."
	done

IlluminateDescription:
	text "Aumenta la tasa de"
	next "#mon salvajes."
	done

TraceDescription:
	text "Copia la habilidad"
	next "del rival."
	done

HugePowerDescription:
	text "Aumenta mucho su"
	next "característica Ataque."
	done

PoisonPointDescription:
	text "El contacto puede"
	next "envenenar al rival."
	done

InnerFocusDescription:
	text "Evita que el"
	next "#mon retroceda."
	done

MagmaArmorDescription:
	text "Evita caer"
	next "congelado."
	done

WaterVeilDescription:
	text "Evita caer"
	next "quemado."
	done

MagnetPullDescription:
	text "Evita la huida de"
	next "rivales tipo Acero."
	done

SoundproofDescription:
	text "Otorga inmunidad a"
	next "ataques sonoros."
	done

RainDishDescription:
	text "Recupera PS poco a"
	next "poco con lluvia."
	done

SandStreamDescription:
	text "Invoca tormenta"
	next "arena al entrar."
	done

PressureDescription:
	text "Aumenta el uso de"
	next "PP del rival."
	done

ThickFatDescription:
	text "Sube resistencia a"
	next "Fuego y Hielo."
	done

EarlyBirdDescription:
	text "Se despierta muy"
	next "rápido del sueño."
	done

FlameBodyDescription:
	text "El contacto puede"
	next "quemar al rival."
	done

RunAwayDescription:
	text "Asegura la huida"
	next "de #mon salvajes."
	done

KeenEyeDescription:
	text "Evita que el rival"
	next "baje la precisión."
	done

HyperCutterDescription:
	text "Evita que el rival"
	next "baje el Ataque."
	done

PickupDescription:
	text "El #mon puede"
	next "recoger objetos."
	done

HustleDescription:
	text "Sube Ataque, pero"
	next "baja precisión."
	done

CuteCharmDescription:
	text "El contacto puede"
	next "causar enamoramiento."
	done

StickyHoldDescription:
	text "Evita el robo de"
	next "sus objetos."
	done

ShedSkinDescription:
	text "Puede curar sus"
	next "problemas de estado."
	done

GutsDescription:
	text "Sube el Ataque si"
	next "sufre un estado."
	done

MarvelScaleDescription:
	text "Sube la Defensa si"
	next "sufre un estado."
	done

LiquidOozeDescription:
	text "Daña a rivales que"
	next "absorban sus PS."
	done

OvergrowDescription:
	text "Potencia Planta"
	next "en un apuro."
	done

BlazeDescription:
	text "Potencia Fuego"
	next "en un apuro."
	done

TorrentDescription:
	text "Potencia Agua"
	next "en un apuro."
	done

SwarmDescription:
	text "Potencia Bicho"
	next "en un apuro."
	done

RockHeadDescription:
	text "Evita el daño de"
	next "reculada."
	done

DroughtDescription:
	text "Invoca sol al"
	next "entrar a luchar."
	done

ArenaTrapDescription:
	text "Evita que el rival"
	next "pueda huir."
	done

TangledFeetDescription:
	text "Sube la evasión si"
	next "está confundido."
	done

MotorDriveDescription:
	text "Ataques Eléctricos"
	next "suben Velocidad."
	done

RivalryDescription:
	text "Más daño a rivales"
	next "de igual género."
	done

SteadfastDescription:
	text "Sube Velocidad al"
	next "retroceder."
	done

SnowCloakDescription:
	text "Sube la evasión en"
	next "las granizadas."
	done

GluttonyDescription:
	text "Adelanta el uso de"
	next "las Baya equipadas."
	done

AngerPointDescription:
	text "Maximiza Ataque al"
	next "recibir un crítico."
	done

UnburdenDescription:
	text "Sube Velocidad al"
	next "perder el objeto."
	done

DrySkinDescription:
	text "Resta PS con sol."
	next "Agua recupera PS."
	done

DownloadDescription:
	text "Ajusta crac. según"
	next "defensa del rival."
	done

IronFistDescription:
	text "Potencia los"
	next "ataques de puño."
	done

PoisonHealDescription:
	text "Recupera PS si cae"
	next "envenenado."
	done

AdaptabilityDescription:
	text "Potencia ataques"
	next "de su mismo tipo."
	done

SkillLinkDescription:
	text "Aumenta los golpes"
	next "multigolpe."
	done

HydrationDescription:
	text "Cura estados con"
	next "la lluvia."
	done

SolarPowerDescription:
	text "Sube At.Esp pero"
	next "baja PS con sol."
	done

QuickFeetDescription:
	text "Sube Velocidad si"
	next "sufre un estado."
	done

SniperDescription:
	text "Potencia aún más"
	next "los golpes críticos."
	done

MagicGuardDescription:
	text "Solo recibe daño"
	next "ataques directos."
	done

NoGuardDescription:
	text "Asegura impactos"
	next "propios y rivales."
	done

TechnicianDescription:
	text "Potencia los"
	next "ataques débiles."
	done

LeafGuardDescription:
	text "Evita problemas de"
	next "estado con sol."
	done

MoldBreakerDescription:
	text "Ataques ignoran"
	next "habilidad rival."
	done

SuperLuckDescription:
	text "Aumenta la tasa de"
	next "golpes críticos."
	done

AftermathDescription:
	text "Daña al rival al"
	next "caer debilitado."
	done

AnticipationDescription:
	text "Siente los ataques"
	next "peligrosos rivales."
	done

ForewarnDescription:
	text "Determina ataques"
	next "del rival."
	done

UnawareDescription:
	text "Ignora los cambios"
	next "de caract. rival."
	done

TintedLensDescription:
	text "Potencia ataques"
	next "poco eficaces."
	done

FilterDescription:
SolidRockDescription:
	text "Reduce daño de"
	next "ataques supereficaces."
	done

ScrappyDescription:
	text "Permite golpear a"
	next "tipos Fantasma."
	done

IceBodyDescription:
	text "Recupera PS poco a"
	next "poco con granizo."
	done

SnowWarningDescription:
	text "Invoca granizo"
	next "al entrar a luchar."
	done

HoneyGatherDescription:
	text "El #mon puede"
if DEF(FAITHFUL)
	next "recomponer Miel."
else
	next "hallar Miel Dulce."
endc
	done

FriskDescription:
	text "Identifica el"
	next "objeto del rival."
	done

RecklessDescription:
	text "Potencia ataques"
	next "con daño de reculada."
	done

BadDreamsDescription:
	text "Resta PS al rival"
	next "mientras duerme."
	done

PickpocketDescription:
	text "Roba el objeto al"
	next "recibir contacto."
	done

SheerForceDescription:
	text "Anula efectos para"
	next "aumentar el daño."
	done

ContraryDescription:
	text "Invierte los"
	next "cambios de caract."
	done

UnnerveDescription:
	text "Evita que el"
	next "enemigo coma Bayas"
	done

DefiantDescription:
	text "Sube el Ataque si"
	next "bajan caract."
	done

CursedBodyDescription:
	text "Puede anular el"
	next "ataque recibido."
	done

WeakArmorDescription:
	text "Ataque físico baja"
	next "Def. y sube Vel."
	done

LightMetalDescription:
	text "Reduce a la mitad"
	next "el peso del #mon."
	done

MultiscaleDescription:
	text "Reduce el daño si"
	next "los PS están al máx."
	done

HarvestDescription:
	text "Puede recuperar la"
	next "Baya tras usarla."
	done

MoodyDescription:
	text "Sube una caract. y"
	next "baja otra."
	done

OvercoatDescription:
	text "Protege del daño"
	next "del clima."
	done

PoisonTouchDescription:
	text "Puede envenenar"
	next "al hacer contacto."
	done

RegeneratorDescription:
	text "Recupera PS al"
	next "retirarse."
	done

BigPecksDescription:
	text "Evita que el rival"
	next "baje la Defensa."
	done

SandRushDescription:
	text "Sube Velocidad en"
	next "tormenta arena."
	done

WonderSkinDescription:
	text "Hace fallar los"
	next "ataques de estado."
	done

AnalyticDescription:
	text "Potencia el ataque"
	next "al actuar último."
	done

ImposterDescription:
	text "Se transforma en"
	next "el rival al entrar."
	done

InfiltratorDescription:
	text "Atraviesa barreras"
	next "del rival."
	done

MoxieDescription:
	text "Sube el Ataque al"
	next "debilitar rivales."
	done

JustifiedDescription:
	text "Sube At al recibir"
	next "ataques Siniestros."
	done

RattledDescription:
	text "Siniestro Fantasma"
	next "o Bicho suben Vel."
	done

MagicBounceDescription:
	text "Devuelve ataques"
	next "de estado."
	done

SapSipperDescription:
	text "Sube At al recibir"
	next "ataques Planta."
	done

PranksterDescription:
	text "Da prioridad a los"
	next "ataques de estado."
	done

SandForceDescription:
	text "Sube Roca, Tierra"
	next "y Acero en arena."
	done

IronBarbsDescription:
	text "Daña al rival que"
	next "haga contacto."
	done

FurCoatDescription:
	text "Sube mucho Defensa"
	next "ante ataques físicos."
	done

BulletproofDescription:
	text "Protege de bombas"
	next "y proyectiles."
	done

CompetitiveDescription:
	text "Sube At.Esp si"
	next "bajan caract."
	done

MegaLauncherDescription:
	text "Potencia ataques"
	next "de aura y pulso."
	done

ToughClawsDescription:
	text "Potencia ataques"
	next "de contacto."
	done

PixilateDescription:
	text "Ataques Normales"
	next "pasan a Hada."
	done

ParentalBondDescription:
	text "Padre e hijo"
	next "atacan juntos."
	done

BerserkDescription:
	text "Sube AtEsp si baja"
	next "de la mitad de PS."
	done

SlushRushDescription:
	text "Sube Velocidad en"
	next "la granizada."
	done

GalvanizeDescription:
	text "Ataques Normales"
	next "pasan a Eléctrico."
	done

CorrosionDescription:
	text "Puede envenenar a"
	next "cualquier tipo."
	done

FluffyDescription:
	text "Resiste contacto,"
	next "pero débil a Fuego."
	done

TanglingHairDescription:
	text "El contacto puede"
	next "bajar la Velocidad."
	done

GorillaTacticsDescription:
	text "Sube Ataque, pero"
	next "solo permite un mov."
	done

NeutralizingGasDescription:
	text "Suprime todas las"
	next "demás habilidades."
	done

QuickDrawDescription:
	text "Ataca primero de"
	next "vez en cuando."
	done

WindRiderDescription:
	text "Otorga inmunidad"
	next "a ataques viento."
	done

SteelySpiritDescription:
	text "Potencia ataques"
	next "de tipo Acero."
	done

PerishBodyDescription:
	text "El contacto activa"
	next "Canto Mortal."
	done

ScreenCleanerDescription:
	text "Elimina pantallas"
	next "al entrar a luchar."
	done

CudChewDescription:
	text "Reutiliza una Baya"
	next "tras comerla."
	done

SharpnessDescription:
	text "Potencia ataques"
	next "corte y corteza."
	done

ArmorTailDescription:
	text "Anula los ataques"
	next "de prioridad rival."
	done

MindsEyeDescription:
	text "Ignora evasión e"
	next "inmunidad Fantasma."
	done

MegaSolDescription:
	text "Ataca como si"
	next "hubiera sol fuerte."
	done
