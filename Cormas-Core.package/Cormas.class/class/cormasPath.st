paths
cormasPath
	"Returns a Filename corresponding to the path of Cormas directory.
	Ex: a FATFilename('d:\vw7nc\cormas')"
	
	^ObjectMemory imageDirectory	"JFL : the following old code needs a dev image :
		^SourceFileManager default targetFile logicalName asFilename directory"