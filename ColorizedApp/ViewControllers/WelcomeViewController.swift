//
//  WelcomeViewController.swift
//  ColorizedApp
//
//  Created by Yelena Demchenko on 11.04.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - View life cycle
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as! ColorViewController
        colorVC.delegate = self
        colorVC.backgroundVC = view.backgroundColor
    }
}

// MARK: - Color Delegate

extension WelcomeViewController: ColorViewControllerDelegate {
    func applyColor(color: UIColor) {
        view.backgroundColor = color
    }
}
