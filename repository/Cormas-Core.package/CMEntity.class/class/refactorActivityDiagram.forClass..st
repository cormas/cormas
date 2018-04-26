- activityDiagram
refactorActivityDiagram: aSelector forClass: aClass
	"compatibilit√© pour version anterieure des activityDiagrams"
	
	| metaClass source listing index activities collOfNews newActivities newColl newSource editor |
	metaClass := aClass class whichClassIncludesSelector: aSelector.
	source := (metaClass sourceCodeAt: aSelector) string.	"this old code does not work in packaged image : source := (metaClass methodSourcesAt: aSelector) source string."
	listing := Cormas
		splitString: source
		with: Character cr.
	activities := listing
		detect:
			[:t | (t indexOfSubCollection: 'virtualActivities :=' startingAt: 1) > 0]
		ifNone: [^nil].
	collOfNews := OrderedCollection new.
	index := activities indexOfSubCollection: 'add: (' startingAt: 1.
	index := 1.
	[index > 0]
		whileTrue:
			[| index1 |
			index1 := index.
			index := activities
				indexOfSubCollection: 'add: ('
				startingAt: index1 + 1.
			index > 0
				ifTrue:
					[collOfNews
						add:
							(activities
								copyFrom: index1
								to: index - 1)]
				ifFalse:
					[collOfNews
						add:
							(activities
								copyFrom: index1
								to: activities size)]].
	newColl := OrderedCollection new.
	collOfNews
		do:
			[:str | 
			| indA |
			(str indexOfSubCollection: 'ActivityFigure' startingAt: 1) > 0
				ifTrue:
					[indA := str indexOfSubCollection: 'instVarAt: 15 put: nil; ' startingAt: 1.
					newColl
						add:
							(str
								changeFrom: indA
								to: indA + 'instVarAt: 15 put: nil; ' size - 1
								with: '').
					indA := newColl last indexOfSubCollection: 'instVarAt: 16 put:'
						startingAt: 1.
					newColl
						at: newColl size
						put:
							(newColl last
								changeFrom: indA
								to: indA + 'instVarAt: 16 put:' size - 1
								with: 'instVarAt: 14 put:')]
				ifFalse:
					[(str indexOfSubCollection: 'DiamondFigure' startingAt: 1) > 0
						ifTrue:
							[indA := str indexOfSubCollection: 'instVarAt: 16 put:' startingAt: 1.
							newColl
								add:
									(str
										changeFrom: indA
										to: indA + 'instVarAt: 16 put:' size - 1
										with: 'instVarAt: 15 put:')]
						ifFalse: [newColl add: str]]].
	newActivities := ''.
	newColl do: [:str | newActivities := newActivities , str].
	listing
		at:
			(listing
				indexOf:
					(listing
						detect:
							[:t | (t indexOfSubCollection: 'virtualActivities :=' startingAt: 1) > 0]))
		put: newActivities.
	newSource := ''.
	listing
		do:
			[:str | 
			newSource := newSource , str ,
					'
'].
	metaClass compile: newSource classified: '+ activityDiagram' notifying:
			nil.	"on modifie les couleurs"
	editor := aClass perform: aSelector.
	editor open.
	editor drawing components
		do: [:fig | fig isLineFigure ifFalse: [fig defaultAttributes]].
	editor closeRequest.
	editor
		compileForClass: aClass
		selector: (aClass instanceSelectorFrom: aSelector)