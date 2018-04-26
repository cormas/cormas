- displaying
inspect
	"Open an inspector, but previously set the default value of the parameters"
	
	self class allSpecificClassVariables
		do:
			[:att | 
			[self class perform: att asSymbol]
				on: Error
				do: [:ex | nil]].
	self class allSpecificAttributes
		do:
			[:att | 
			[self perform: att asSymbol]
				on: Error
				do: [:ex | nil]].
	self class genericEntities.
	super inspect