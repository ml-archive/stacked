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

Currently the CStack library can be installed through the Vapor tap (by running `brew install cstack`). If that doesn't work for some reason or Vapor decides to remove the library from their tap, it can be installed through the Nodes tap by following these steps:

First add the tap:

```
brew tap nodes-vapor/homebrew-tap
```

And next, install the library by running:

```
brew install cstack
```

#### Linux and APT

To install CStack on Linux using APT, you first need to setup the Vapor APT repository. The guide for this can be found [here](https://github.com/vapor/apt). After that, CStack can be installed by doing:

```
apt-get update
```

And then:

```
apt-get install cstack
```

### Integrating `Stacked` in your project

Update your `Package.swift` file.
```swift
.Package(url: "https://github.com/nodes-vapor/stacked.git", majorVersion: 0)
```

### Exporting symbols for the stracktraces

Unfortunately, we're not able to specify the needed flags for running any project wanting stacktraces through SPM, since it uses a limited set of whitelisted flags. Because of that, you would need to manually add these flags when building your project:

```
-Xlinker --export-dynamic
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
