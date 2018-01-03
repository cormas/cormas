control
diffuse
	"Diffusion of hormons around the cell.
Each neighbours will receive a quantity equals to qty*diffusionRate/connexity.
diffusionRate is the % of hormon I should give to my neigbourhood.
If I am at the edge, I will give less hormons"

	| qtyToGiveToEachCell qtyGiven |
	self qty > 0
		ifTrue: [ qtyToGiveToEachCell := self qty * CMDiffuseCell diffusionRate / self connexity.
			qtyGiven := 0.
			self neighbourhood
				do: [ :c | 
					qtyGiven := qtyGiven + qtyToGiveToEachCell.
					c lostOrReceivedQty: c lostOrReceivedQty + qtyToGiveToEachCell ].
			self lostOrReceivedQty: self lostOrReceivedQty - qtyGiven ]