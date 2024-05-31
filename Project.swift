import ProjectDescription

let project = Project(
    name: "BaseProject",
    targets: [
        .target(
            name: "BaseProject",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.BaseProject",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["BaseProject/Sources/**"],
            resources: ["BaseProject/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "BaseProjectTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.BaseProjectTests",
            infoPlist: .default,
            sources: ["BaseProject/Tests/**"],
            resources: [],
            dependencies: [.target(name: "BaseProject")]
        ),
    ]
)
