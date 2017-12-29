# Stacked 📚
[![Swift Version](https://img.shields.io/badge/Swift-3-brightgreen.svg)](http://swift.org)
[![Vapor Version](https://img.shields.io/badge/Vapor-2-F6CBCA.svg)](http://vapor.codes)
[![Circle CI](https://circleci.com/gh/nodes-vapor/stacked/tree/master.svg?style=shield)](https://circleci.com/gh/nodes-vapor/stacked)
[![codebeat badge](https://codebeat.co/badges/349be6f4-6061-4221-9c32-185456d89551)](https://codebeat.co/projects/github-com-nodes-vapor-stacked-master)
[![codecov](https://codecov.io/gh/nodes-vapor/stacked/branch/master/graph/badge.svg)](https://codecov.io/gh/nodes-vapor/stacked)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/nodes-vapor/stacked)](http://clayallsopp.github.io/readme-score?url=https://github.com/nodes-vapor/stacked)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/nodes-vapor/stacked/master/LICENSE)


## 📦 Installation

### Installing CStack

For Stacked to work, you first need to install the [CStack](https://github.com/nodes-vapor/cstack) library on the machine that is going to run your project. Please remember to do this on any machine you might deploy your project to:

#### macOS and Homebrew

First add the tap:

```
brew tap nodes-vapor/homebrew-tap
```

And next, install the library by running:

```
brew install cstack
```

#### Linux and APT

We're working hard on making CStack available on Linux (through APT) and we'll make sure to update this readme as soon as it gets ready.

### Integrating `Stacked` in your project

Update your `Package.swift` file.
```swift
.Package(url: "https://github.com/nodes-vapor/stacked.git", majorVersion: 0)
```


## Getting started 🚀

First remember to import the module:
```swift
import Stacked
```

Second, call `getStackTrace` to get a stacktrace that works on both Mac and Linux:
```swift
FrameAddress.getStackTrace(maxStackSize: 100)
```

Which will return you the stacktrace as a `[String]`.


## 🏆 Credits

This package is developed and maintained by the Vapor team at [Nodes](https://www.nodesagency.com).
The package owner for this project is [Brett](https://github.com/brettRToomey).


## 📄 License

This package is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
