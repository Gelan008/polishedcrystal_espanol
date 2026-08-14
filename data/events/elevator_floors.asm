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
._1F:  db "1P@"
._2F:  db "2P@"
._3F:  db "3P@"
._4F:  db "4P@"
._5F:  db "5P@"
._6F:  db "6P@"
._7F:  db "7P@"
._8F:  db "8P@"
._9F:  db "9P@"
._10F: db "10P@"
._11F: db "11P@"
.Roof: db "Azotea@"
