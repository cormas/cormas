methods
prepareTable
	
	| collecAtt aList |
	collecAtt := self listOfAttributes.
	aList := List new.
	collecAtt
		do:
			[:att | 
			aList
				add:
					(EntityInspector_AttributeItem
						for: self entity
						name: att)].
	self attribute_List list: aList