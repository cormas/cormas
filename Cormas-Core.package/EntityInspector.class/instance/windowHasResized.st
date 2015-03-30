private-resize dataset
windowHasResized
	"A method to resize the columns when size of the window changed"
	
	| aDatasetobject columnWidth ratio |
	((self wrapperAt: #Dataset1) isNil not
		and:
			[(builder window width - self previousWidth) abs / self previousWidth >
					0.03])
		ifTrue:
			[aDatasetobject := self widgetAt: #Dataset1.
			aDatasetobject dropEdit.	"width change ratio ; 20 pixels being the width of the icon colum area on the right side of the window"
			ratio := (builder window width - 20) / (self previousWidth - 20).	"for each colum calculates its width relatively to its previous width and assign the new value
	Before that we check if the new width is not elow the minimum width, if yes we perform another resizing algo"
			((aDatasetobject columnDescriptors at: 1) width * ratio) asFloat
				asInteger < 130
				ifTrue:
					[(aDatasetobject columnDescriptors at: 1) width: 130.
					(aDatasetobject columnDescriptors at: 2)
						width: builder window width - 20 - 130]
				ifFalse:
					[((aDatasetobject columnDescriptors at: 2) width * ratio) asFloat asInteger
						< 45
						ifTrue:
							[(aDatasetobject columnDescriptors at: 2) width: 45.
							(aDatasetobject columnDescriptors at: 1)
								width: builder window width - 20 - 45]
						ifFalse:
							[1
								to: aDatasetobject numberOfColumns
								do:
									[:i | 
									columnWidth := ((aDatasetobject columnDescriptors at: i) width * ratio)
										asFloat asInteger.
									(aDatasetobject columnDescriptors at: i) width: columnWidth]]].	"refresh display"
			aDatasetobject computeStarts.
			aDatasetobject invalidateRectangle: aDatasetobject bounds.	"refresh ratioCoumn value"
			self ratioColumns
				value:
					((aDatasetobject columnDescriptors at: 1) width
						/
							((aDatasetobject columnDescriptors at: 1) width
								+ (aDatasetobject columnDescriptors at: 2) width)) asFloat + 0.01.	"update previousWidth"
			self previousWidth: builder window width]