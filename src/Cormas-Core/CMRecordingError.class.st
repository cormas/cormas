"
I am raised when data cannot be recorded or read as asked: a probe that returns something else than a number, a boolean or a string, a value of another kind than the values recorded before it, a step recorded out of order, or a column that was not recorded.

## Responsibility:

- I stop the recording at the faulty value, so that wrong data never spreads into tables, charts or files.
- My message names the probe and the value, or the step, at fault.

## Collaborators:

- `CMDataTable` raises me.

## Public API and Key Messages

- `CMRecordingError signal: aString`

```smalltalk
(CMDataTable withColumns: #( #bag )) addStep: 0 values: { nil } ""raises a CMRecordingError""
```
"
Class {
	#name : 'CMRecordingError',
	#superclass : 'Error',
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}
