//
//  SceneDelegate.swift
//  Dragon Ride
//
//  Created by Andrés A. on 5/3/21.
//  Copyright © 2021 Andrés A.. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
                       self.window = UIWindow(windowScene: windowScene)
                       let nav1 = UINavigationController()
                        nav1.navigationBar.prefersLargeTitles = true

                       let vc = ListFlightsViewController()
                       self.window?.rootViewController = nav1
                       nav1.pushViewController(vc, animated: true)
                       self.window?.makeKeyAndVisible()
    }

    @available(iOS 13.0, *)
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    @available(iOS 13.0, *)
    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    @available(iOS 13.0, *)
    func sceneWillResignActive(_ scene: UIScene) {
    }

    @available(iOS 13.0, *)
    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    @available(iOS 13.0, *)
    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

