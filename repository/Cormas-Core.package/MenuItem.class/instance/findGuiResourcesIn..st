private
findGuiResourcesIn: aResourceContainer
	
	| im labelObject menu |
	im := self realLabelImage.
	im findGuiResourcesIn: aResourceContainer.
	labelObject := self rawLabel.
	labelObject findGuiResourcesIn: aResourceContainer.
	menu := self submenu.
	menu findGuiResourcesIn: aResourceContainer