description - primitives
listing: fileName
	"Creates a simple listing of the attributes and methods of this class into fileName"
	
	| bufferText stream |
	bufferText := Text new.
	bufferText := bufferText , '***** Attributs'' list *****\' withCRs.
	self instVarNames
		do: [:iv | bufferText := bufferText , '  -' , iv asString , '\' withCRs].
	bufferText := bufferText , '\\\***** Methodes'' list ***** ' withCRs.
	self organization categories
		do:
			[:protoc | 
			bufferText := bufferText , '\\Protocol: ' , protoc asString , '\\' withCRs.
			(self organization listAtCategoryNamed: protoc)
				do:
					[:meth | bufferText := bufferText , '  #' , meth asString , '\' withCRs]].
	stream := fileName asFilename writeStream.
	stream nextPutAll: bufferText withCRs.
	stream close