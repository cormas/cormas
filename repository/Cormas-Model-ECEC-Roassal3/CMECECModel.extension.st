Extension { #name : #CMECECModel }

{ #category : #'*Cormas-Model-ECEC-Roassal3' }
CMECECModel class >> example1R3 [

	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 tmp9 |
	tmp6 := self.
	tmp6 initialize.
	tmp1 := tmp6 new.
	tmp2 := RSCanvas new.
	tmp3 := RSColorPalette sequential ylgnbu9.
	tmp7 := NSScale linear.
	tmp7 domain: { 0. 0.1. 0.2. 0.3. 0.4. 0.5. 0.6. 0.7. 1 }.
	tmp3 := tmp7 range: tmp3 range.
	tmp1
		initSimulation;
		runStep.
	tmp4 := tmp1 theVegetationUnits
		        collect: [ :arg1 | 
			        | tmp10 |
			        tmp10 := RSBox new.
			        tmp10
				        size: 25;
				        model: arg1;
				        yourself ]
		        as: RSGroup.
	tmp2 addAll: tmp4.
	tmp5 := RSPopup text: [ :arg2 | arg2 asPopupText ].
	tmp4
		@ tmp5;
		when: RSMouseLeftClick do: [ :arg3 | arg3 shape model inspect ].
	tmp8 := RSGridLayout new.
	tmp8
		gapSize: 0;
		lineItemsCount: tmp1 spaceModel column;
		on: tmp2 nodes.
	tmp2 zoomToFit.
	tmp9 := tmp2 newAnimation.
	tmp9
		repeat;
		onStepDo: [ :arg4 | 
			tmp1 runStep.
			tmp4 do: [ :arg5 | 
					arg5 color: (tmp3 scale: arg5 model biomass / 10.0) ] ].
	tmp2
		addInteraction: RSCanvasController new;
		open
]
