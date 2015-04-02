sensitivity
sensitivityOfProbe: aProbeName toParameter: aCAV standardAverage: moyStandard
	"formule: Sensib (prob.j) = ln(moy(prob_j.modif)) - ln (moy(prob_j.standard)) / ln (j.modif) - ln(J.stand).
aProbeName = <Symbol>"
	
	| moyModified sensitivity data |
	data := self fileFormat value = #excel
		ifFalse:
			[self
				getDataModifiedBy:
					aCAV classNameAsString , '_' , aCAV attributeAsString
				ofProbe: aProbeName]
		ifTrue:
			[self
				getExcelDataModifiedBy:
					aCAV classNameAsString , '_' , aCAV attributeAsString
				ofProbe: aProbeName].
	moyModified := Cormas averageOf: data.	"store information for impossible calculus"
	aCAV finalValue = aCAV currentValue ifTrue: [^0].
	(moyModified * moyStandard * aCAV finalValue * aCAV currentValue <= 0
		or:
			[(moyModified * moyStandard * aCAV finalValue * aCAV currentValue) ln = 0])
		ifTrue:
			[| aList |
			aList := List
				with: aCAV targetClass
				with: aCAV targetAttribute.
			aList
				add: moyModified;
				add: moyStandard;
				add: aCAV finalValue;
				add: aCAV currentValue.
			self zeroError at: aProbeName put: aList.
			^0].	"Sensitivity calculus"
	sensitivity := (moyModified abs ln - moyStandard abs ln)
		/ (aCAV finalValue abs ln - aCAV currentValue abs ln).
	^sensitivity abs