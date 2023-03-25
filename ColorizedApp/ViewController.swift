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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorBoard.layer.cornerRadius = 30
        
        setupColorBoard()
        updateLabels()
    }
    
    // MARK: - Actions
    
    @IBAction func sliderAction(_sender: UIView) {
        
        switch _sender {
        case valueRed:
            valueRed.text = String(format: "%.2f", sliderRed.value)
        case valueGreen:
            valueGreen.text = String(format: "%.2f", sliderGreen.value)
        default:
            valueBlue.text = String(format: "%.2f", sliderBlue.value)
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
    private func updateLabels() {
        valueRed.text = String(format: "%.2f", sliderRed.value)
        valueGreen.text = String(format: "%.2f", sliderGreen.value)
        valueBlue.text = String(format: "%.2f", sliderBlue.value)
    }
}

