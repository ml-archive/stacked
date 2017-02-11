import PackageDescription

let package = Package(
    name: "Stacked",
    targets: [
        Target(name: "Stacked", dependencies: ["FrameAddress"]),
    ]
)
