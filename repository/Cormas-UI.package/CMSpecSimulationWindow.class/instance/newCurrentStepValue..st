changes
newCurrentStepValue: anInteger
anInteger isInteger ifFalse: [ self halt ].
self currentStepInputText text: anInteger.