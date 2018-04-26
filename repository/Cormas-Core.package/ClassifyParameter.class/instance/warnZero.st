actions_buttons
warnZero
	"Warn parameters for impossible calculus"
	"zeroError = Dictionary with #probeName as key and an associated list: moyModified ; moyStandard ;  finalValue ;  currentValue "
	
	| text listInfo |
	listInfo := #('class' 'attribute' 'modifiedAverage' 'standardAverage' 'modified parameter value' 'standard parameter value').
	text := 'Some sensitivities to parameters have not been calculated because of LN(0) error ! \'
		withCRs asText emphasizeAllWith: #bold.
	self zeroError
		keysAndValuesDo:
			[:key :list | 
			text := text , 'Sensitivity of '.
			text := text , (key asString asText emphasizeAllWith: #(#italic)).
			text := text , ' for parameter '.
			text := text
				,
					(((list at: 1) name asString , '_' , (list at: 2) asString) asText
						emphasizeAllWith: #color -> ColorValue red) asText.
			text := text , ' is set to 0 because '.
			text := text
				,
					(((listInfo at: (list indexOf: 0)) asString asText emphasizeAllWith:
							#(#italic)) , ' is 0.') asText.
			text := text , '\' withCRs asText].
	^Dialog warn: text asText