//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Yelena Demchenko on 24.03.2023.
//

import UIKit

final class SetColorViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var colorBoard: UIView!
    
    @IBOutlet var colorsStack: UIStackView!
    @IBOutlet var colorLabels: [UILabel]!
    
    @IBOutlet var valuesStack: [UIStackView]!
    @IBOutlet var valueLabels: [UILabel]!
    
    @IBOutlet var slidersStack: UIStackView!
    @IBOutlet var sliders: [UISlider]!
    
    @IBOutlet var userValuesStack: [UIStackView]!
    @IBOutlet var userValues: [UITextField]!
    
    @IBOutlet var buttonDone: UIButton!
    
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorBoard.layer.cornerRadius = 30
        
        setupColorBoard()
        
        for (index, slider) in sliders.enumerated() {
            valueLabels[index].text = getString(from: slider)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func slidersAction(sender: UISlider) {
        if let sliderIndex = sliders.firstIndex(of: sender) {
            valueLabels[sliderIndex].text = getString(from: sender)
            setupColorBoard()
        }
    }
    
    // MARK: - Private Methods
    
    private func setupColorBoard() {
        
        colorBoard.backgroundColor = UIColor(
            red: CGFloat(sliders[0].value),
            green: CGFloat(sliders[1].value),
            blue: CGFloat(sliders[2].value),
            alpha: 1
        )
    }
    
    private func getString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
