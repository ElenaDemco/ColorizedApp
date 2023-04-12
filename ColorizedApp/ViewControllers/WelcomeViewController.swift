//
//  WelcomeViewController.swift
//  ColorizedApp
//
//  Created by Yelena Demchenko on 11.04.2023.
//

import UIKit

final class WelcomeViewController: UIViewController, ColorViewControllerDelegate {
    func applyColor(color: UIColor) {
        view.backgroundColor = color
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let colorVC = navigationVC.topViewController as? ColorViewController else { return }
        colorVC.delegate = self
    }
}

