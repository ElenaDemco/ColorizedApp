//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Yelena Demchenko on 24.03.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var colorBoard: UIView!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    @IBOutlet var valueRed: UILabel!
    @IBOutlet var valueGreen: UILabel!
    @IBOutlet var valueBlue: UILabel!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorBoard.layer.cornerRadius = 30
        
        setupColorBoard()
        
        valueRed.text = getString(from: sliderRed)
        valueGreen.text = getString(from: sliderGreen)
        valueBlue.text = getString(from: sliderBlue)
    }
    
    // MARK: - Actions
    
    @IBAction func sliderAction(sender: UISlider) {
        
        switch sender {
        case sliderRed:
            valueRed.text = getString(from: sliderRed)
        case sliderGreen:
            valueGreen.text = getString(from: sliderGreen)
        default:
            valueBlue.text = getString(from: sliderBlue)
        }
        setupColorBoard()
    }
    
    // MARK: - Private Methods
    
    private func setupColorBoard() {
        
        colorBoard.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1
        )
    }
    
    private func getString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

