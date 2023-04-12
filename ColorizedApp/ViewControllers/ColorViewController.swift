//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Yelena Demchenko on 24.03.2023.
//

import UIKit

protocol ColorViewControllerDelegate: AnyObject {
    func applyColor(color:UIColor)
}

final class ColorViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var colorBoard: UIView!
    
    @IBOutlet var colorsStack: UIStackView!
    @IBOutlet var colorLabels: [UILabel]!
    
    @IBOutlet var valuesStack: [UIStackView]!
    @IBOutlet var valueLabels: [UILabel]!
    
    @IBOutlet var slidersStack: UIStackView!
    @IBOutlet var sliders: [UISlider]!
    
    @IBOutlet var userValuesStack: [UIStackView]!
    @IBOutlet var userValuesTF: [UITextField]!
    
    // MARK: - Public Methods
    
    unowned var delegate: ColorViewControllerDelegate?
    var backgroundVC: UIColor!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorBoard.layer.cornerRadius = 5
        colorBoard.backgroundColor = backgroundVC
        
        for (index, slider) in sliders.enumerated() {
            valueLabels[index].text = getString(from: slider)
            userValuesTF[index].text = getString(from: slider)
        }
        
        for textField in userValuesTF {
            textField.delegate = self
            addButtonToKeyboard(for: textField)
        }
        
        setupColorBoard()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - Actions
    
    @IBAction func slidersAction(sender: UISlider) {
        if let sliderIndex = sliders.firstIndex(of: sender) {
            valueLabels[sliderIndex].text = getString(from: sender)
            userValuesTF[sliderIndex].text = getString(from: sender)
            setupColorBoard()
        }
    }
    
    @IBAction func buttonDoneTapped(_ sender: UIButton) {
        delegate?.applyColor(color: colorBoard.backgroundColor ?? .white)
        dismiss(animated: true)
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
    
    private func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func addButtonToKeyboard(for textField: UITextField) {
        
        let keyboardToolBar = UIToolbar()
        keyboardToolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(keyboardDoneButtonTapped)
        )
        
        keyboardToolBar.items = [flexibleSpace, doneButton]
        
        textField.inputAccessoryView = keyboardToolBar
    }
    
    @objc func keyboardDoneButtonTapped() {
        view.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate

extension ColorViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = Float(textField.text ?? "") else { return }
        
        if newValue < 0 || newValue > 1 {
            showAlert(
                title: "Something went wrong!",
                message: "Please enter a range of 0.0 to 1.0"
            )
            textField.text = ""
        } else {
            if let index = userValuesTF.firstIndex(of: textField) {
                sliders[index].value = newValue
                valueLabels[index].text = getString(from: sliders[index])
                setupColorBoard()
            }
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.text = ""
        return true
    }
}

