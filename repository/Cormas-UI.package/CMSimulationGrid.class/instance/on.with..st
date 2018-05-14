instance creation
on: aModel with: cells


	self addAll: ((RTBox new color: [ :e | 
		e getColorForPov: #pov]; 
		size: 25) 
		elementsOn: cells).

	RTGridLayout new
		gapSize: 0;
		lineItemsCount: aModel spaceModel column;
		on: self elements.

	self canvas camera focusOnCenterScaled.
	
	anim := RTActiveAnimation new.
	anim intervalInMilliseconds: 0.
	anim
		blockToExecute: [ aModel runStep.
			self elements do: #updateShape ].
	
	anim inView: self.