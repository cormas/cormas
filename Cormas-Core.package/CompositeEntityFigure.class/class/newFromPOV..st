new
newFromPOV: aComposedPOV
	
	| inst |
	inst := self newFrom: aComposedPOV components.
	inst delimitors add: aComposedPOV outline.
	inst delimitors addAll: aComposedPOV internalLines.
	^inst