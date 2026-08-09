Characteristics:
	table_width 2
	dw .Chara_HP0
	dw .Chara_HP1
	dw .Chara_HP2
	dw .Chara_HP3
	dw .Chara_HP4
	dw .Chara_Atk0
	dw .Chara_Atk1
	dw .Chara_Atk2
	dw .Chara_Atk3
	dw .Chara_Atk4
	dw .Chara_Def0
	dw .Chara_Def1
	dw .Chara_Def2
	dw .Chara_Def3
	dw .Chara_Def4
	dw .Chara_SAt0
	dw .Chara_SAt1
	dw .Chara_SAt2
	dw .Chara_SAt3
	dw .Chara_SAt4
	dw .Chara_SDf0
	dw .Chara_SDf1
	dw .Chara_SDf2
	dw .Chara_SDf3
	dw .Chara_SDf4
	dw .Chara_Spe0
	dw .Chara_Spe1
	dw .Chara_Spe2
	dw .Chara_Spe3
	dw .Chara_Spe4
	assert_table_length NUM_STATS * 5

.Chara_HP0:
	text  "Le encanta"
	next1 "comer"
	done
.Chara_HP1:
	text  "Duerme"
	next1 "mucha"
	next1 "siesta"
	done
.Chara_HP2:
	text  "Se duerme"
	next1 "a menudo"
	done
.Chara_HP3:
	text  "A menudo"
	next1 "lo tira"
	next1 "todo"
	done
.Chara_HP4:
	text  "Le gusta"
	next1 "relajarse"
	done

.Chara_Atk0:
	text  "Orgulloso"
	next1 "de su"
	next1 "fuerza"
	done
.Chara_Atk1:
	text  "A veces"
	next1 "se enfada"
	done
.Chara_Atk2:
	text  "Un poco"
	next1 "cascarrab-"
	next1 "ias"
	done
.Chara_Atk3:
	text  "Le gusta"
	next1 "luchar"
	done
.Chara_Atk4:
	text  "Muy"
	next1 "cascarrab-"
	next1 "ias"
	done

.Chara_Def0:
	text  "Cuerpo"
	next1 "robusto"
	done
.Chara_Def1:
	text  "Buen"
	next1 "encajador"
	done
.Chara_Def2:
	text  "Muy"
	next1 "persist-"
	next1 "ente"
	done
.Chara_Def3:
	text  "Buena"
	next1 "resisten-"
	next1 "cia"
	done
.Chara_Def4:
	text  "Gran"
	next1 "persever-"
	next1 "ancia"
	done

.Chara_SAt0:
	text  "Muy"
	next1 "curioso"
	done
.Chara_SAt1:
	text  "Es un"
	next1 "travieso"
	done
.Chara_SAt2:
	text  "Muy"
	next1 "astuto"
	done
.Chara_SAt3:
	text  "Suele"
	next1 "pensar"
	next1 "mucho"
	done
.Chara_SAt4:
	text  "Muy"
	next1 "capricho-"
	next1 "so"
	done

.Chara_SDf0:
	text  "Fuerte"
	next1 "voluntad"
	done
.Chara_SDf1:
	text  "Un poco"
	next1 "orgulloso"
	done
.Chara_SDf2:
	text  "Muy"
	next1 "rebelde"
	done
.Chara_SDf3:
	text  "Odia"
	next1 "perder"
	done
.Chara_SDf4:
	text  "Un poco"
	next1 "cabezón"
	done

.Chara_Spe0:
	text  "Le gusta"
	next1 "correr"
	done
.Chara_Spe1:
	text  "Oído"
	next1 "atento"
	done
.Chara_Spe2:
	text  "Atolondra-"
	next1 "do"
	done
.Chara_Spe3:
	text  "Un poco"
	next1 "payaso"
	done
.Chara_Spe4:
	text  "Huye"
	next1 "rápido"
	done
