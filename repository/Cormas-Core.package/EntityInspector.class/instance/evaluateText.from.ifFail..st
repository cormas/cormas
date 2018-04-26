doIt/accept/explain
evaluateText: aText from: aController ifFail: failBlock
	"The user wishes to evaluate expressions in the value part of an inspector.
	Do so in the context of the inspector's variables.  Evaluate failBlock
	if the evaluation does not work."
	
	^Cursor execute
		showWhile:
			[self doItReceiver entity class evaluatorClass new
				evaluate: aText
				in: nil
				allowReceiver: true
				receiver: self doItReceiver entity
				environment: self doItReceiver entity class environment
				notifying: aController
				ifFail: failBlock]