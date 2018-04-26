This class provides an interface that links to a Cormas model  (http://cormas.cirad.fr) to allow ploting histograms which bars' heights correspond to the number of occurrence in each class (classes being for example people from age 10 to 20, then from age 20 to 30 etc‚Ä¶).

To use this HistogramsInterface Class proceed as so:
- in the init method of your Cormas model write the following line ‚ÄúHistogramsInterface newWith: self‚Äù  (the line can be placed anywhere in your init method)
    *** from now on, a new interface, the ‚Äúhistograms interface‚Äù will open each time you init your model ***
- in your Cormas model class, create a new protocol named ‚Äúhistograms‚Äù
    ***in this protocol you can now add as many histograms definition you want***
- the syntax of a method defining a new histogram is as so:
     - it should return an Array instance composed of 2 OrderedCollection (or one OrderedCollection and one Array)
     - the first value of this Array is the collection of quantitative values you want to plot in the histograms (e.g. a collection of age of an agents population)
     - the second value of this Array is the classes to which you want to plot your data (e.g. to define the 3 following classes 0 to 30; 30 to 60 and 60 to 90, the value to be sent is #(0 30 90 100).  )
    ***note that 2 additional classes will be created: one for all values less than your lowest class; and a second for all values higher than your highest class****

_______________________________
creation date: 14-03-06
by: Nicolas Becu
email: becu@uni-hohenheim.de