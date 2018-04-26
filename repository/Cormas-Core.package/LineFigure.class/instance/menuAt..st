accessing
menuAt: aPoint
	
	| menu submenu selectedAnnotation |
	submenu := MenuBuilder new.
	LineAnnotation allSubclasses
		do:
			[:each | 
			| name |
			name := each name asString.
			(name
				copyFrom: (name size - 9 max: 1)
				to: name size) = 'Annotation'
				ifTrue:
					[name := name
						copyFrom: 1
						to: name size - 10].
			submenu
				add: ('Start ' , name) -> [self addAnnotation: each forStart];
				add: ('Stop ' , name) -> [self addAnnotation: each forStop]].
	selectedAnnotation := annotations
		detect: [:each | each containsPoint: aPoint]
		ifNone: [nil].
	selectedAnnotation notNil
		ifTrue:
			[submenu
				line;
				add: 'Remove annotation' -> [self removeAnnotation: selectedAnnotation]].
	menu := super menuAt: aPoint.
	menu addItem: ((MenuItem labeled: 'Annotations') submenu: submenu menu).
	^menu