- deprecated
distC: aSpatialEntity
	"DEPRECATED. You shouldn't use this method: the result depend of the size of the displayed grid ! If you modify the size of the windows, the result will change !!  :o(
So, be carefull. You should rather use 'distCell: aSpatialEntity' .
returns a distance in cells, between the sender and aSpatialEntity."
	
	^self distCenter: aSpatialEntity