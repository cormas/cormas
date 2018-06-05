callbacks
openVizProbes
	| aModel |
	aModel := self projectManager cormasModel.
	aModel data isEmpty
		ifTrue: [ ^ self alertMessage: 'No data to visualize' ].
	CMSimpleChart openOn: aModel