import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

//let project = Project.app(name: "TodayWoon",
//                          targets: Module.allModules)



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
            dependencies: [
                .external(name: "Alamofire"),
                .external(name: "Then"),
                .external(name: "SnapKit"),
                .external(name: "CombineExt"),
                .external(name: "CombineCocoa")
            ]
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
