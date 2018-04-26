private
setOATfilename
	"Returns a Filename from (aStringOrFilename) located into the current model 'data' 
	directory "
	
	^filename := 'OATanalysis.' , self class extension