- binary storage
newBoss: attributList
	"Method only used for BOSS.
	Create a new instance of Entity."
	
	| cm |
	cm := self basicNew.
	attributList
		do:
			[:assoc | 
			cm
				update: assoc key asString
				to: assoc value].
	^cm