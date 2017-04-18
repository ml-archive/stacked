# Stacked
[![Language](https://img.shields.io/badge/Swift-3-brightgreen.svg)](http://swift.org)
[![Build Status](https://travis-ci.org/nodes-vapor/stacked.svg?branch=master)](https://travis-ci.org/nodes-vapor/stacked)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/nodes-vapor/stacked/master/LICENSE)

## Integration
Update your `Package.swift` file.
```swift
.Package(url: "https://github.com/nodes-vapor/stacked.git", majorVersion: 0)
```

## Getting started 🚀
First remember to import the module:
```
import Stacked
```

Second, call `getStackTrace` to get a stacktrace that works on both Mac and Linux:
```swift
FrameAddress.getStackTrace(maxStackSize: 100)
```

Which will return you the stacktrace as a `[String]`.

## 🏆 Credits
This package is developed and maintained by the Vapor team at [Nodes](https://www.nodesagency.com).

## 📄 License
This package is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).
