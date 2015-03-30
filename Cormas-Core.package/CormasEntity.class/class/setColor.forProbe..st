- probes
setColor: aColorValue forProbe: aSymbol
	"creates a color mathod at class level, such as :
colorOfProbe_aSymbol
	^ ColorValue yellow"
	
	self class
		compile:
			('colorOfProbe_' , aSymbol asString , '\  ^ ' , aColorValue printString)
				withCRs
		classified: '- probes'
		notifying: nil