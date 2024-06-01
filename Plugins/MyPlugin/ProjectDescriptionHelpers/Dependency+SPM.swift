//
//  Dependency+SPM.swift
//  MyPlugin
//
//  Created by 이숭인 on 5/31/24.
//

import ProjectDescription

extension TargetDependency {
    public struct SPM {
        public enum External: String, CaseIterable {
            case Alamofire
            case SnapKit
            case Then
            case CombineCocoa
            case CombineExt
            case RxSwift, RxCocoa, RxKeyboard, RxGesture, RxDataSources, RxSwiftExt
            case NSObject_Rx = "NSObject-Rx"
        }
    }
}

public extension TargetDependency.SPM.External {
    var dependency: TargetDependency { TargetDependency.external(name: rawValue) }
    static let all: [TargetDependency] = allCases.map { $0.dependency }
}

public extension TargetDependency.SPM {
    static var all: [TargetDependency] { External.all }
}

