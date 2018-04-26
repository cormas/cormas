- printing - documentation
listing: fileName
	
	| bufferText stream |
	bufferText := Text new.
	bufferText := bufferText , 'Attributs\' withCRs.
	self instVarNames
		do: [:iv | bufferText := bufferText , iv asString , '    '].
	bufferText := bufferText , '\\\Methodes' withCRs.
	self organization categories
		do:
			[:c | 
			bufferText := bufferText , '\\' , c asString , '\' withCRs.
			(self organization listAtCategoryNamed: c)
				do: [:m | bufferText := bufferText , m asString , '    ']].
	stream := fileName asFilename writeStream.
	stream nextPutAll: bufferText withCRs.
	stream close