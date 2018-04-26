private
getCellClassAttributes
	"Return a list of instance variables of the cell class that have a read and a write accessor in the #accessing protocol"
	
	| cellClass organization |
	cellClass := model class cellClass.
	organization := cellClass organization.
	cellClass instVarNames
		select:
			[:varName | 
			(organization categoryOfElement: varName asSymbol == #accessing)
				and:
					[organization categoryOfElement: (varName , ':') asSymbol == #accessing]]