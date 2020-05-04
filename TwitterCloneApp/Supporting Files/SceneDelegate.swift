//
//  SceneDelegate.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/2/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        guard let windowScene = scene as? UIWindowScene else { return }
        
        // Create the SwiftUI view that provides the window contents.
        let service = TwitterService()
        let viewModel = SearchTweetsViewModel(twitterService: service)
        let contentView = SearchTweetsView(viewModel: viewModel)

        // Use a UIHostingController as window root view controller.
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
    }
}

