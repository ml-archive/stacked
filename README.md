# Stacked
[![Language](https://img.shields.io/badge/Swift-3-brightgreen.svg)](http://swift.org)
[![Build Status](https://travis-ci.org/nodes-vapor/stacked.svg?branch=master)](https://travis-ci.org/nodes-vapor/stacked)
[![codebeat badge](https://codebeat.co/badges/52c2f960-625c-4a63-ae63-52a24d747da1)](https://codebeat.co/projects/github-com-nodes-vapor-stacked)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/nodes-vapor/stacked)](http://clayallsopp.github.io/readme-score?url=https://github.com/nodes-vapor/stacked)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/nodes-vapor/stacked/master/LICENSE)

## 📦 Installation
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

## 📄 License
This package is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).
