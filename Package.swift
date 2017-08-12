import PackageDescription

let package = Package(
    name: "Stacked",
    dependencies: [
        .Package(url: "https://github.com/nodes-vapor/cstack.git", majorVersion: 0)
    ]
)
