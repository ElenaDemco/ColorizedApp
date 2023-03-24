//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Yelena Demchenko on 24.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorBoard: UIView!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    @IBOutlet var valueRed: UILabel!
    @IBOutlet var valueGreen: UILabel!
    @IBOutlet var valueBlue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorBoard.layer.cornerRadius = 30
    }
    
    @IBAction func sliderRedAction() {
        let sliderValue = sliderRed.value
        valueRed.text = String(format: "%.2f", sliderValue)
        setupColorBoard()
    }
    
    @IBAction func sliderGreenAction() {
        let sliderValue = sliderGreen.value
        valueGreen.text = String(format: "%.2f", sliderValue)
        setupColorBoard()
    }
    
    @IBAction func sliderBlueAction() {
        let sliderValue = sliderBlue.value
        valueBlue.text = String(format: "%.2f", sliderValue)
        setupColorBoard()
    }
    
    private func setupColorBoard() {
        let red = CGFloat(sliderRed.value)
        let green = CGFloat(sliderGreen.value)
        let blue = CGFloat(sliderBlue.value)
        
        colorBoard.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
    }
}

