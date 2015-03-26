updating
formattedNode: anRBProgramNode
	
	| formatter |
	formatter := anRBProgramNode formatterClass new.
	(self textController notNil and: [formatter respondsTo: #lineLengthLimit:])
		ifTrue:
			[formatter
				lineLengthLimit:
					self textController view bounds width
						// (self textController view graphicsContext widthOfString: 'M')].
	^formatter format: anRBProgramNode