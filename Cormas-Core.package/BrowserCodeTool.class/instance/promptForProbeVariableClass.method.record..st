probes
promptForProbeVariableClass: aClass method: probedMethod record: probeRecord
	"Prompts the user to select a probe and returns an Association where the key is the probe
	and the value is the conditional flag."
	
	| legalTempNames legalTemps ivarNames dialog aBuilder ivar tmpVar windoe wVar varType |
	windoe := self interfaceWindow.
	wVar := ValueHolder newString.
	legalTemps := OrderedCollection new.
	(probedMethod variableMapAt: probeRecord blockMethodIndex) temps
		do:
			[:var | 
			(var key first == $.
				or: [legalTemps contains: [:lvar | lvar key = var key]])
				ifFalse: [legalTemps add: var]].
	legalTempNames := legalTemps collect: [:ac | ac key].
	ivarNames := aClass allInstVarNames.
	dialog := SimpleDialog new.
	dialog initializeBuilderFor: windoe.
	aBuilder := dialog builder.
	aBuilder
		aspectAt: #TOS
		put:
			[varType := #tos.
			wVar value: 'Top of Stack'].
	aBuilder
		aspectAt: #iVar
		put:
			[ivar := (Menu labelArray: ivarNames values: ivarNames) startUp.
			ivar ~~ 0
				ifTrue:
					[wVar value: ivar.
					varType := #inst]].
	aBuilder
		aspectAt: #tVar
		put:
			[tmpVar := (Menu labelArray: legalTempNames values: legalTemps) startUp.
			tmpVar ~~ 0
				ifTrue:
					[wVar value: tmpVar key.
					varType := #tmp]].
	aBuilder aspectAt: #wVar put: wVar.
	dialog builder add: (UISpecification from: self class watchVarSpec).
	dialog initializeWindowFor: windoe.
	ivarNames isEmpty ifTrue: [(aBuilder componentAt: #IvarSwitch) disable].
	legalTemps isEmpty ifTrue: [(aBuilder componentAt: #TempSwitch) disable].
	dialog preOpen.
	dialog builder
		openDialogWithExtent: dialog builder window displayBox extent.
	dialog accept value ifFalse: [^nil].
	varType == nil ifTrue: [^nil].
	varType == #tos ifTrue: [^DisplayTOSProbe new].
	varType == #inst
		ifTrue:
			[^DisplayInstanceVarProbe
				name: ivar
				index: (ivarNames indexOf: ivar)].
	^DisplayMethodVarProbe slot: tmpVar