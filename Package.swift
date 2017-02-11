import PackageDescription

let package = Package(
    name: "Stacked",
    dependencies: [
        .Package(url: "https://github.com/nodes-vapor/CFrameAddress.git", majorVersion: 0)
    ]
)
