//
//  AsyncAwaitSampleApp.swift
//  AsyncAwaitSample
//
//  Created by elkabelaya on 03.11.2021.
//

import SwiftUI

@available(iOS 14.0, *)
struct AsyncAwaitSampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

@main
struct AsyncAwaitSampleAppWrapper {
    static func main() {
        if #available(iOS 14.0, *) {
            AsyncAwaitSampleApp.main()
        }
        else {
            UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(AppDelegate.self))
        }
    }
}

