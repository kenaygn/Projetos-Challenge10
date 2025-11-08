//
//  SceneDelegate.swift
//  MVVM+Coordinator
//
//  Created by Kenay on 07/11/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

               let window = UIWindow(windowScene: windowScene)
               let navigationController = UINavigationController()

               let appCoordinator = AppCoordinator(nav: navigationController)
               self.appCoordinator = appCoordinator

               window.rootViewController = navigationController
               self.window = window
               window.makeKeyAndVisible()

               appCoordinator.start()
        
    }




}

