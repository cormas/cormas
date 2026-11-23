"
I am a chart showing one probe against another, as points.

## Responsibility:

- I show the points of a probe on y against a probe on x, either once per recorded step or once per instance of a class at the shown step.
- I refuse to mix both: points over time and points of the instances at one step do not share an x axis.
- I draw values that are not numbers on x, such as the values of a parameter of a sensitivity analysis, on a categorical axis.

## Collaborators:

- `CMPointSeries`: each of my series, naming the two probes and the objects they are measured on.
- `CMSimulation`: the recorded data tables my points are drawn from.
- `CMSeriesData`: the points to draw, at each step a point or the points of all the instances.

## Public API and Key Messages

- `pointsX:y:` shows one point per recorded step, of the model in a model chart or of the instance in an entity chart.
- `pointsX:y:ofAll:` shows one point per instance of a class, at the shown step.
- `add:` adds a `CMPointSeries` to choose its label or color.
- Shared with every chart: `title:`, `xTitle:`, `yTitle:`, `hideLegend`.

The question a chart answers goes in the comment of its `<chart>` method:

```
RMModel>>chartEnergyAgainstAge
	""Do older rabbits have more energy?""
	<chart>
	^ CMScatterplot new
		  title: 'Energy and age';
		  pointsX: #age y: #energy ofAll: RMRabbit;
		  xTitle: 'Age';
		  yTitle: 'Energy';
		  yourself
```

### Implementation Points

- I show a single step as soon as one of my series shows all the instances of a class, and the chart view then offers its step slider.
"
Class {
	#name : 'CMScatterplot',
	#superclass : 'CMChart',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'accessing' }
CMScatterplot >> add: aChartSeries [
	"Points over time and points of the instances of a class at one step do not share an x axis"

	(series notEmpty and: [
		 self isSingleStep ~= aChartSeries showsAllInstances ]) ifTrue: [
			self error:
				'A scatterplot shows either points over time, or the points of the instances of a class at one step, not both' ].
	super add: aChartSeries
]

{ #category : 'accessing' }
CMScatterplot >> isSingleStep [

	^ series anySatisfy: [ :each | each showsAllInstances ]
]

{ #category : 'accessing' }
CMScatterplot >> pointsX: xSelector y: ySelector [
	"Show the probe ySelector against the probe xSelector, a point per recorded step: of the model in a model chart, of the instance in an entity chart. Add a CMPointSeries to choose their label or color"

	self add: (CMPointSeries new probeX: xSelector y: ySelector)
]

{ #category : 'accessing' }
CMScatterplot >> pointsX: xSelector y: ySelector ofAll: aClass [
	"Show the probe ySelector against the probe xSelector of each instance of aClass, and of its subclasses, a point per instance at one step. Add a CMPointSeries to choose their label or color"

	self add:
		(CMPointSeries new probeX: xSelector y: ySelector ofAll: aClass)
]

{ #category : 'accessing' }
CMScatterplot >> seriesClass [

	^ CMPointSeries
]
