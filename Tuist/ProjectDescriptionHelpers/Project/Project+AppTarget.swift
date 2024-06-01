//
//  Project+AppTarget.swift
//  Config
//
//  Created by 이숭인 on 5/31/24.
//

import ProjectDescription
import MyPlugin

extension Project {
    static func makeAppTargets(name: String,
                               dependencies: [TargetDependency] = [],
                               bundleIdentifier: String,
                               deploymentTargetVersion: String,
                               destinations: Destinations) -> [Target] {
        let mainTarget = Target.target(name: name,
                                       destinations: destinations,
                                       product: .app,
                                       bundleId: bundleIdentifier,
                                       deploymentTargets: .iOS(deploymentTargetVersion),
                                       infoPlist: makeAppInfoPlist(),
                                       sources: ["BaseProject/Sources/**"],
                                       resources: ["BaseProject/Resources/**"],
                                       dependencies: dependencies)
        
        return [mainTarget]
    }
}
