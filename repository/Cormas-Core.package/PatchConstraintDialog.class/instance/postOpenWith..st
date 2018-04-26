interface opening
postOpenWith: aBuilder
	"set operators choices"
	
	| aList |
	aList := List withAll: #(#= #> #>= #< #<=).
	att1OpeChoices value: aList.
	att2OpeChoices value: aList.	"set menu for selecting patch attributes"
	aList := List new.
	aList
		addAll:
			(DefaultAttributesSetter attributsFromClass: self cells first class) sorted.
	att1Choices value: aList.
	att2Choices value: aList