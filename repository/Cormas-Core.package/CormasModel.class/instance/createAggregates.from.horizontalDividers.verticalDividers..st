+ instance creation - spatial entities
createAggregates: compoundEntity from: baseEntity horizontalDividers: xRatio verticalDividers: yRatio
	"Purpose: Creates (xRatio x yRatio) rectangular aggregates by dividing the grid by yRatio columns and xRatio lines. The aggregates will  occupy the whole grid. This method resets all aggregates 'compoundEntity' and rebuids them. 
Arguments: baseEntity = a subClass of  <SpatialEntity> 
	compoundEntity = a subClass of  <SpatialEntitySet>
Example: self createAggregates: SquareArea from: Cell horizontalDividers: 5 verticalDividers: 4 --> for a spatial grid of 41 * 41, it will create 20 aggregates: 5 along the horizontal direction and in 4 along the vertical direction"
	
	^self spaceModel setAggregates: compoundEntity from: baseEntity
		horizontalDividers: xRatio verticalDividers: yRatio