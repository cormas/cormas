![CORMAS Logo](http://cormas.cirad.fr/images/CormasLogoBig.png "CORMAS Logo")

# CORMAS (COmmon pool Ressources and Multi-Agent Simulations)
[![Build Status](https://travis-ci.org/cormas/cormas.svg?branch=master)](https://travis-ci.org/cormas/cormas)

This is an ongoing effort to port CORMAS to Pharo ecosystem: http://www.pharo.org/
Current stable version of CORMAS is based on VisualWorks 7.6 and can be found on: http://cormas.cirad.fr/indexeng.htm

:bangbang: Current active development repository is located at **[ss3](http://ss3.gemstone.com/ss/Cormas.html)** and will move to github soon.

Some documentation (to be cleaned and reorganized) about Cormas is available on the Wiki here: 
https://github.com/cormas/documentation

All issues about the current and ongoing port are here: https://github.com/cormas/cormas/issues

## How to install Cormas
* Download Pharo 6.1 VM depending of your platform: http://pharo.org/download
* Load Cormas: Open Pharo 6.1 image then right-click anywhere to open the main menu. Choose Playground to execute script. Paste the script below in Playground, select all then right-click and choose Do it to execute this.

```Smalltalk
Metacello new
	squeaksource3: 'Cormas';
	configuration: 'Cormas';
	version: #development;
	load.
```
All packages load into the Cormas-* package names.

## How to use Command Line interface (CLI)

You can deal with cormas/pharo through unix commande line. It work as follow : 

```
mkdir mydir
cd mydir
curl https://get.pharo.org | bash 
./pharo Pharo.image config http://ss3.gemstone.com/ss/Cormas --install=development
```

## Licence
Cormas is licensed under MIT. See : http://opensource.org/licenses/MIT

## How to contribute to CORMAS

We welcome submissions! Join us here: http://groups.google.com/group/cormas-dev
