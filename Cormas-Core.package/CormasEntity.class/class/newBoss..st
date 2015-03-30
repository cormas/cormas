- utilities - binary storage
newBoss: attributList
	"Method only used for BOSS.
	Create a new instance of Entity."
	
	| ag |
	ag := self basicNew.
	attributList
		do:
			[:assoc | 
			ag
				update: assoc key asString
				to: assoc value].
	^ag