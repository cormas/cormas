version
adjustChartsTo2002
	
	| oldCharts oldProbes source index startIndex endIndex entityName probeName |
	oldCharts := (self cormasModelClass organization listAtCategoryNamed:
			#graphiques) asOrderedCollection
		select:
			[:n | 
			n asString last ~= $:
				and:
					[n size <= 4
						or:
							[(n
								findString: 'Data'
								startingAt: n size - 4) = 0]]].
	oldCharts := oldCharts collect: [:oc | oc asString].
	oldProbes := oldCharts collect: [:x | x asString , 'Data'].
	oldProbes
		with: oldCharts
		do:
			[:op :oc | 
			source := (self cormasModelClass compiledMethodAt: op asSymbol) getSource.
			index := source findString: '^#' startingAt: 1.
			index = 0
				ifTrue:
					[self cormasModelClass
						compile:
							(source
								copyReplaceFrom: 1
								to: op asString size
								with: oc asString)
						classified: 'probes'
						notifying: nil]
				ifFalse:
					[startIndex := index + 4.
					endIndex := (source
						nextIndexOf: Character space
						from: startIndex
						to: source size) - 1.
					entityName := (source copyFrom: startIndex to: endIndex) asSymbol.
					probeName := (source
						copyFrom: endIndex + 3
						to: source size - 1) asSymbol.
					(self cormasModelClass environment at: entityName) organization
						classify: probeName under: #probes]].
	self cormasModelClass removeCategory: 'graphiques'.
	oldCharts
		do:
			[:oc | 
			(self cormasModelClass instVarNames includes: oc)
				ifTrue: [self cormasModelClass removeInstVarName: oc]]