initialize-release
postBuildWith: aBuilder
	"Update the interface with the targetClass bold and orange."
	
	| txt label color emph |
	txt := targetClass name asString asText.
	color := ColorValue red.
	(targetClass inheritsFrom: CMSpatialEntity)
		ifTrue: [color := ColorValue darkGreen].
	(targetClass inheritsFrom: Agent) ifTrue: [color := ColorValue blue].
	(targetClass inheritsFrom: PassiveObject)
		ifTrue: [color := ColorValue orange].
	emph := Array
		with: #bold
		with: #color -> color.
	txt emphasizeFrom: 1 to: 30 with: emph.
	label := Label
		with: txt
		attributes: (TextAttributes styleNamed: #large).
	(aBuilder componentAt: #LabelClassName) label: label