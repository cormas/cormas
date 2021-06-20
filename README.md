<p align="center"><img alt="CORMAS" src="assets/logos/CormasLogoBig.png" style="width: 15%; height: 15%">
<h1 align="center">CORMAS</h1>
  <p align="center">
    COmmon pool Ressources and Multi-Agent Simulations
    <br>
    <a href="https://github.com/cormas/cormas/wiki"><strong>Explore the docs »</strong></a>
    <br>
    <br>
    <a href="https://github.com/cormas/cormas/issues/new?labels=Type%3A+Defect">Report a defect</a>
    |
    <a href="https://github.com/cormas/cormas/issues/new?labels=Type%3A+Feature">Request feature</a>
  </p>
</p>

[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
![CI](https://github.com/cormas/cormas/workflows/CI/badge.svg)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/cormas/cormas/master/LICENSE)

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-13-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

# Table of Contents

- [Description](#description)
- [Installation](#installation)
  - [Standard Installation](#standard-installation)
  - [CLI Installation](#cli-installation)
  - [Troubleshooting](#troubleshooting)
- [Features](#features)
- [Documentation](#documentation)
- [Contributors](#contributors)
  - [Historical contributors](#historical-contributors)  
- [Change Log](#change-log)
- [License](./LICENSE)

# Description

This is an ongoing effort to port CORMAS to [Pharo ecosystem](http://www.pharo.org/). Current stable version of CORMAS is based on VisualWorks 7.6 and still can be found on: http://cormas.cirad.fr/indexeng.htm

Some documentation (to be cleaned and reorganized) about Cormas is available on the Wiki here:
https://github.com/cormas/documentation

If you want to contribute to CORMAS please have a look to the [contributing guide](https://github.com/cormas/cormas/blob/master/CONTRIBUTING.md).
Join us on the cormas-dev mailing-list: http://groups.google.com/group/cormas-dev

# Installation

## Standard Installation

* Download a Pharo 9.0 image+VM depending of your platform: http://pharo.org/download
* Load Cormas: Open Pharo 9.0 image then click anywhere to open the main menu. Choose Playground (Ctrl + OW or Cmd + OW) to execute the following script. Paste the script below in Playground, select all then right-click and choose Do it (Ctrl+D or Cmd+D) to execute it:

[//]: # (pi)
```smalltalk
EpMonitor disableDuring: [
	Metacello new
		onConflictUseLoaded;
		onWarningLog;
		repository: 'github://cormas/cormas/repository';
		baseline: 'Cormas';
		load ] 

```

All packages load into the Cormas-* package names.

## CLI Installation

### Using Standard Unix CLI

You can install CORMAS through Unix command line. It works as follow:

```bash
mkdir mydir; cd mydir
curl https://get.pharo.org/90+vm | bash
./pharo Pharo.image eval "EpMonitor disableDuring: [
	Metacello new
		onConflictUseLoaded;
		onWarningLog;
		repository: 'github://cormas/cormas/repository';
		baseline: 'Cormas';
		load ]. 
Smalltalk snapshot: true andQuit: true"
```

### Using PI

Make sure you have [pi](https://github.com/hernanmd/pi) installed, and then execute:

```bash
pi install Cormas
```

## Troubleshooting

There is from time to time, [loading errors with github](https://github.com/cormas/cormas/issues/101). If it happens, execute the following expression from Pharo:

```Smalltalk
| maxCount count |
maxCount := 3.
count := 1.
Transcript open.
[ count <= maxCount ] whileTrue: [ [
	^ Metacello new
		onWarningLog;
		repository: 'github://cormas/cormas/repository';
		baseline: 'Cormas';
		load
	]
	on: IceGenericError "Failed to connect to github.com: Interrupted system call"
	do: [ : ex |
		MetacelloNotification signal: String cr , ex description , String cr , 'RETRYING ', maxCount asString.
		(Delay forSeconds: 2) wait.
		ex retry
	].
	count := count + 1 ]
```

Please add an issue if the installation expression above does not work due to one of these known exceptions:

  - IceGenericError: Failed to connect to github.com: Interrupted system call.
  - IceGenericError: SecureTransport error: connection closed via error
  - IceGenericError: unexpected return value from ssl handshake -9806

# Features

Work in progress

# Documentation

Work in progress

# Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="http://tomostavern.blogspot.jp/"><img src="https://avatars1.githubusercontent.com/u/836308?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Tomohiro Oda</b></sub></a><br /><a href="https://github.com/cormas/cormas/commits?author=tomooda" title="Code">💻</a> <a href="https://github.com/cormas/cormas/commits?author=tomooda" title="Tests">⚠️</a></td>
    <td align="center"><a href="http://elcep.legtux.org/"><img src="https://avatars2.githubusercontent.com/u/1777267?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Etienne DELAY</b></sub></a><br /><a href="https://github.com/cormas/cormas/commits?author=ElCep" title="Code">💻</a> <a href="https://github.com/cormas/cormas/commits?author=ElCep" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://github.com/hernanmd"><img src="https://avatars2.githubusercontent.com/u/4825959?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Hernán Morales Durand</b></sub></a><br /><a href="https://github.com/cormas/cormas/commits?author=hernanmd" title="Code">💻</a> <a href="https://github.com/cormas/cormas/commits?author=hernanmd" title="Tests">⚠️</a></td>
    <td align="center"><a href="http://macau.unu.edu"><img src="https://avatars0.githubusercontent.com/u/327334?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Serge Stinckwich</b></sub></a><br /><a href="https://github.com/cormas/cormas/commits?author=SergeStinckwich" title="Code">💻</a> <a href="https://github.com/cormas/cormas/commits?author=SergeStinckwich" title="Tests">⚠️</a></td>
    <td align="center"><a href="http://symbios.io"><img src="https://avatars0.githubusercontent.com/u/4181440?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Cédrick Béler</b></sub></a><br /><a href="https://github.com/cormas/cormas/commits?author=cdrick65" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/nbecu"><img src="https://avatars3.githubusercontent.com/u/7630183?v=4?s=100" width="100px;" alt=""/><br /><sub><b>nbecu</b></sub></a><br /><a href="https://github.com/cormas/cormas/commits?author=nbecu" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/npapoylias"><img src="https://avatars1.githubusercontent.com/u/8402525?v=4?s=100" width="100px;" alt=""/><br /><sub><b>npapoylias</b></sub></a><br /><a href="https://github.com/cormas/cormas/commits?author=npapoylias" title="Code">💻</a> <a href="https://github.com/cormas/cormas/commits?author=npapoylias" title="Tests">⚠️</a></td>
  </tr>
  <tr>
    <td align="center"><a href="http://ur-green.cirad.fr"><img src="https://avatars3.githubusercontent.com/u/7630722?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Pierre Bommel</b></sub></a><br /><a href="https://github.com/cormas/cormas/commits?author=pierbo" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/ChLePage"><img src="https://avatars2.githubusercontent.com/u/7639614?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Christophe Le Page</b></sub></a><br /><a href="https://github.com/cormas/cormas/commits?author=ChLePage" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/brun0"><img src="https://avatars3.githubusercontent.com/u/444953?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Bruno Bonté</b></sub></a><br /><a href="https://github.com/cormas/cormas/commits?author=brun0" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/jigyasa-grover"><img src="https://avatars1.githubusercontent.com/u/9291400?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Jigyasa Grover</b></sub></a><br /><a href="https://github.com/cormas/cormas/commits?author=jigyasa-grover" title="Code">💻</a></td>
    <td align="center"><a href="http://peteruhnak.com/blog"><img src="https://avatars3.githubusercontent.com/u/1276328?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Peter Uhnak</b></sub></a><br /><a href="#tool-peteruhnak" title="Tools">🔧</a></td>
    <td align="center"><a href="https://github.com/gabrami34"><img src="https://avatars.githubusercontent.com/u/71649466?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Géraldine Abrami</b></sub></a><br /><a href="https://github.com/cormas/cormas/commits?author=gabrami34" title="Tests">⚠️</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

## Historical contributors

Innocent Bakam, François Bousquet, Alassane Bah, Emmanuel Lieurain, Jean-Christophe Soulié, Paul Guyot, Jean-François Lefevre, Anne Dray.
