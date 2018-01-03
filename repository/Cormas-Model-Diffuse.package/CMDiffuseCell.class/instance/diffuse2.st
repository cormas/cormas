control
diffuse2
	"Diffusion of hormons around the cell.
Each neighbours will receive a quantity equals to
diffusionRate is the % of hormon I will give to my neigbourhood"

	| qtyToGiveToEachCell |
	self qty > 0
		ifTrue: [ qtyToGiveToEachCell := self qty * CMDiffuseCell diffusionRate / self neighbourhood size.
			self neighbourhood do: [ :c | c lostOrReceivedQty: c lostOrReceivedQty + qtyToGiveToEachCell ].
			self lostOrReceivedQty: self lostOrReceivedQty - (self qty * CMDiffuseCell diffusionRate) ]