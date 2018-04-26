private-buttons list
buildButtonColumn: aBuilder
	"Add icons if the iconic palette is in use"
	
	| composite prototypeSpec |
	composite := aBuilder componentAt: #iconView.
	composite isNil ifTrue: [^self].
	composite := composite widget.
	aBuilder newComposite: composite.
	prototypeSpec := self class interfaceSpecFor: #iconPrototypeSpec.
	self populateSpec: prototypeSpec.
	aBuilder endComposite