ElevatorFloorNames:
	table_width 1
	dr .B4F
	dr .B3F
	dr .B2F
	dr .B1F
	dr ._1F
	dr ._2F
	dr ._3F
	dr ._4F
	dr ._5F
	dr ._6F
	dr ._7F
	dr ._8F
	dr ._9F
	dr ._10F
	dr ._11F
	dr .Roof
	assert_table_length NUM_FLOORS

.B4F:  db "S4@"
.B3F:  db "S3@"
.B2F:  db "S2@"
.B1F:  db "S1@"
._1F:  db "P1@"
._2F:  db "P2@"
._3F:  db "P3@"
._4F:  db "P4@"
._5F:  db "P5@"
._6F:  db "P6@"
._7F:  db "P7@"
._8F:  db "P8@"
._9F:  db "P9@"
._10F: db "P10@"
._11F: db "P11@"
.Roof: db "Azotea@"
