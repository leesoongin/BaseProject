//
//  Project+InfoPlist.swift
//  Config
//
//  Created by 이숭인 on 5/31/24.
//

import ProjectDescription

extension Project {
    static func makeAppInfoPlist() -> InfoPlist {
        let infoPlist: [String: Plist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen",
            "UISupportedInterfaceOrientations": [
                "UIInterfaceOrientationPortrait"
            ]
        ]
        
        return InfoPlist.extendingDefault(with: infoPlist)
    }
}
