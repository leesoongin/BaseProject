//
//  Project+Templates.swift
//  Config
//
//  Created by 이숭인 on 5/31/24.
//

import ProjectDescription
import MyPlugin

let organizationNameString: String = "TodayWoon"
let frameworkBundleIdentifier: String = "io.tuist.TodayWoon"
let deploymentTargetVersion: String = "15.1"

public extension Project {
    static func app(name: String,
                    destinations: Destinations = [.iPhone],
                    targets: [Module] = [],
                    dependencies: [TargetDependency] = [],
                    packages: [Package] = []) -> Project {
        
        var makedTargets: [Target] = []
        /// Add app Target
        makedTargets += makeAppTargets(name: name,
                                       dependencies: targets.map { TargetDependency.target(name: $0.name) },
                                       bundleIdentifier: frameworkBundleIdentifier,
                                       deploymentTargetVersion: deploymentTargetVersion,
                                       destinations: destinations)
        
        ///  Add Framework Target
        makedTargets += targets.compactMap { target in
            makeFrameworkTargets(module: target,
                                 bundleIdentifier: frameworkBundleIdentifier,
                                 deploymentTargetVersion: deploymentTargetVersion,
                                 destinations: destinations)
        }
        
        
        return Project(name: name,
                       organizationName: organizationNameString,
                       packages: packages,
                       settings: .settings(defaultSettings: .recommended),
                       targets: makedTargets,
                       schemes: [],
                       resourceSynthesizers: [])
    }
}
