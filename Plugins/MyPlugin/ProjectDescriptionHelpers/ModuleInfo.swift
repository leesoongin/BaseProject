//
//  ModuleInfo.swift
//  MyPlugin
//
//  Created by 이숭인 on 5/31/24.
//

import ProjectDescription

public protocol ModuleInfoType: CaseIterable {
    var rawValue: String { get }
    var path: String { get }
}

public extension TargetDependency {
    // MARK: - Common
    static let ThirdPartyLibrary = TargetDependency.target(name: "ThirdPartyLibrary")
    static let CommonColors = TargetDependency.target(name: "CommonColors")
    static let ResourceKit = TargetDependency.target(name: "ResourceKit")

    // MARK: - Core
    static let CoreKit = TargetDependency.target(name: "CoreKit")
    static let CoreFoundationKit = TargetDependency.target(name: "CoreFoundationKit")
    static let CoreSharedUIKit = TargetDependency.target(name: "CoreSharedUIKit")
    static let CoreUIKit = TargetDependency.target(name: "CoreUIKit")
    static let CoreListKit = TargetDependency.target(name: "CoreListKit")
    static let CoreNetwork = TargetDependency.target(name: "CoreNetwork")

    // MARK: - Service
    static let URLSchemeRouter = TargetDependency.target(name: "URLSchemeRouter")
    static let SwitNetwork = TargetDependency.target(name: "SwitNetwork")
    static let SwitSDK = TargetDependency.target(name: "SwitSDK")
    static let SwitHTTP = TargetDependency.target(name: "SwitHTTP")
}

public struct ModuleInfo {
    // MARK: - Common
    enum Common: String, ModuleInfoType {
        case ThirdPartyLibrary
        case CommonColors
        case ResourceKit
        
        var path: String { "Modules/Common/\(self.rawValue)" }
    }
    
    // MARK: - Core
    enum Core: String, ModuleInfoType {
        case CoreKit
        case CoreFoundationKit
        case CoreSharedUIKit
        case CoreUIKit
        case CoreListKit
        case CoreNetwork
        
        var path: String { "Modules/Core/\(self.rawValue)" }
    }
    
    // MARK: - Service
    enum Service: String, ModuleInfoType {
        case URLSchemeRouter
        case PermissionManager
        case SwitNetwork
        case SwitSDK
        case SwitHTTP
        
        var path: String { "Modules/Service/\(self.rawValue)" }
    }
}

// MARK: - Common
public extension Module {
    static var ThirdPartyLibrary: Module {
        Module(info: ModuleInfo.Common.ThirdPartyLibrary,
               frameworkDependencies: TargetDependency.SPM.all,
               frameworkSettings: makeThirdPartySettings())
    }

    static var CommonColors: Module {
        Module(info: ModuleInfo.Common.CommonColors,
               frameworkResources: [.resources])
    }

    static var ResourceKit: Module {
        Module(info: ModuleInfo.Common.ResourceKit,
               frameworkResources: [.resources],
               frameworkInfoPlist: .extendingDefault(with: [
                "UIAppFonts": [
                    "SF-Pro-Display-Black.otf",
                    "SF-Pro-Display-BlackItalic.otf",
                    "SF-Pro-Display-Bold_new.otf",
                    "SF-Pro-Display-BoldItalic.otf",
                    "SF-Pro-Display-Heavy.otf",
                    "SF-Pro-Display-HeavyItalic.otf",
                    "SF-Pro-Display-Light.otf",
                    "SF-Pro-Display-LightItalic.otf",
                    "SF-Pro-Display-Medium.otf",
                    "SF-Pro-Display-MediumItalic.otf",
                    "SF-Pro-Display-Regular_new.otf",
                    "SF-Pro-Display-RegularItalic.otf",
                    "SF-Pro-Display-Semibold.otf",
                    "SF-Pro-Display-SemiboldItalic.otf",
                    "SF-Pro-Display-Thin.otf",
                    "SF-Pro-Display-ThinItalic.otf",
                    "SF-Pro-Display-Ultralight.otf",
                    "SF-Pro-Display-UltralightItalic.otf",
                    "SF-Mono-Regular.otf"
                ]
               ]))
    }
}

// MARK: - Core
public extension Module {
    static var CoreKit: Module {
        Module(info: ModuleInfo.Core.CoreKit,
               frameworkDependencies: [
                .ThirdPartyLibrary,
                .CommonColors,
                .CoreFoundationKit,
                .CoreUIKit,
                .CoreListKit
               ])
    }

    static var CoreFoundationKit: Module {
        Module(info: ModuleInfo.Core.CoreFoundationKit,
               frameworkDependencies: [
                .ThirdPartyLibrary
               ])
    }

    static var CoreSharedUIKit: Module {
        Module(info: ModuleInfo.Core.CoreSharedUIKit,
               frameworkDependencies: [
                .ThirdPartyLibrary,
                .CommonColors,
                .ResourceKit,
                .CoreFoundationKit
               ])
    }

    static var CoreUIKit: Module {
        Module(info: ModuleInfo.Core.CoreUIKit,
               frameworkDependencies: [
                .ThirdPartyLibrary,
                .CommonColors,
                .ResourceKit,
                .CoreFoundationKit,
                .CoreSharedUIKit
               ])
    }

    static var CoreListKit: Module {
        Module(info: ModuleInfo.Core.CoreListKit,
               frameworkDependencies: [
                .ThirdPartyLibrary,
                .CommonColors,
                .CoreFoundationKit,
                .CoreSharedUIKit
               ])
    }

    static var CoreNetwork: Module {
        Module(info: ModuleInfo.Core.CoreNetwork,
               frameworkDependencies: [
                .ThirdPartyLibrary,
                .CoreFoundationKit
               ])
    }
}

// MARK: - Service
public extension Module {
    static var URLSchemeRouter: Module {
        Module(info: ModuleInfo.Service.URLSchemeRouter,
               frameworkDependencies: [
                .CoreFoundationKit
               ])
    }

    static var PermissionManager: Module {
        Module(info: ModuleInfo.Service.PermissionManager,
               frameworkDependencies: [
                .ThirdPartyLibrary,
                .CoreFoundationKit
               ])
    }

    static var SwitNetwork: Module {
        Module(info: ModuleInfo.Service.SwitNetwork,
               frameworkDependencies: [
                .ThirdPartyLibrary,
                .CoreFoundationKit,
                .CoreNetwork
               ])
    }

    static var SwitSDK: Module {
        Module(info: ModuleInfo.Service.SwitSDK,
               frameworkDependencies: [
                .ThirdPartyLibrary,
                .ResourceKit
               ],
               frameworkResources: [.resources])
    }
}


//MARK: - All Modules
public extension Module {
    static var allModules: [Module] {
        [
            ThirdPartyLibrary,
            CommonColors,
            ResourceKit,
            CoreKit,
            CoreFoundationKit,
            CoreSharedUIKit,
            CoreUIKit,
            CoreListKit,
            CoreNetwork,
            URLSchemeRouter,
            PermissionManager,
            SwitNetwork,
//            SwitSDK
        ]
    }
}

extension Module {
    private static func makeThirdPartySettings() -> Settings {
        return .settings(
            base: [
                "GCC_PREPROCESSOR_DEFINITIONS": "FLEXLAYOUT_SWIFT_PACKAGE=1",
                "OTHER_LDFLAGS": "-ObjC -all_load -Xlinker -no_warn_duplicate_libraries"
            ],
            debug: ["GCC_PREPROCESSOR_DEFINITIONS": "$(inherited)"],
            release: ["EXCLUDED_SOURCE_FILE_NAMES": "FLEX*"],
            defaultSettings: .recommended)
    }
}
