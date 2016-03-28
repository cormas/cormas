[![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=CORMAS)](https://ci.inria.fr/pharo-contribution/job/CORMAS/)

This is an ongoing effort to port CORMAS to Pharo ecosystem: http://www.pharo.org/
Current stable version of CORMAS is based on VisualWorks 7.6 and can be found on: http://cormas.cirad.fr/indexeng.htm

:bangbang: Current active development repository is located at **[SmalltalkHub](http://www.smalltalkhub.com/#!/~SergeStinckwich/CORMAS)**

Some documentation (to be cleaned and reorganized) about Cormas is available on the Wiki here: 
https://github.com/cormas/documentation

All issues about the current and ongoing port are here: https://github.com/cormas/cormas/issues

## How to install Cormas 0.17
* Download a Spur VM: https://ci.inria.fr/pharo/view/5.0-VM-Spur/job/PharoVM-spur32/
* Download the last dev MOOSE 6.0 on INRIA's CI server: https://ci.inria.fr/moose/job/moose-6.0/
* Load Cormas: Open MOOSE 6.0 image with the Spur VM then right-click anywhere to open the main menu. Choose Playground to execute script. Paste the script below in Playground, select all then right-click and choose Do it to execute this.

```Smalltalk
Gofer new
   url: 'http://smalltalkhub.com/mc/SergeStinckwich/CORMAS/main';
   configurationOf: 'Cormas';
   loadVersion: '0.17'.
```

If you want to install the development version:
```Smalltalk
Gofer new
   url: 'http://smalltalkhub.com/mc/SergeStinckwich/CORMAS/main';
   configurationOf: 'Cormas';
   loadDevelopment.
```

All packages load into the Cormas-* package names.

## Licence
Cormas is licensed under MIT. See : http://opensource.org/licenses/MIT

## How to contribute to CORMAS

We welcome submissions! A google group exists for this project at http://groups.google.com/group/cormas-dev
