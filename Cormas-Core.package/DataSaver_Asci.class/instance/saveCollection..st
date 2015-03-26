+ save
saveCollection: aCollection
	"Updates a file in the current model 'data' directory and writes in it a tupple separated by aChar, at the end of the previous data.
	ex: self updateFile: 'aFile.txt' dataCollection: #(0 11 67) ."
	
	self
		updateFile: self filename
		dataCollection: aCollection