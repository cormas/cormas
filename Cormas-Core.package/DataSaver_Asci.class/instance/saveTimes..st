+ save
saveTimes: aCollection
	"Create a file in the current model 'data' directory and writes in it a tupple separated by aChar.
	ex: self initFile: 'aFile.txt' dataCollection: #('time' '0' '1' ...)  "
	
	aCollection addFirst: 'time'.
	self
		initFile: self filename
		dataCollection: aCollection