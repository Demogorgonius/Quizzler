//
//  ViewController.swift
//  Quizzler
//
//  Created by Sergey on 26.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
//MARK: - Variables
    
//MARK: - View/StackView
    
    
    
//MARK: - Buttons
    lazy var trueButton: UIButton = {
        let button = UIButton(frame: ButtonProperty().buttonFrame)
        button.titleLabel?.text = "True"
        button.titleLabel?.font = ButtonProperty().buttonFont
        button.titleLabel?.textColor = .white
        button.setBackgroundImage(ButtonProperty().buttonBackgroundImage, for: .normal)
        button.addTarget(self, action: #selector(trueButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var falseButton: UIButton = {
        let button = UIButton(frame: ButtonProperty().buttonFrame)
        button.titleLabel?.text = "False"
        button.titleLabel?.font = ButtonProperty().buttonFont
        button.titleLabel?.textColor = .white
        button.setBackgroundImage(ButtonProperty().buttonBackgroundImage, for: .normal)
        button.addTarget(self, action: #selector(trueButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
//MARK: - Labels
    
    lazy var questionLabel: UILabel = {
        let label = UILabel(frame: LabelProperty().labelFrame)
        label.textColor = LabelProperty().labelTextColor
        label.font = LabelProperty().labelFont
        
        return label
    }()
    
//MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1923559308, green: 0.2327082157, blue: 0.3624993563, alpha: 1)
        
    }
    
//MARK: - Methods
    @objc func trueButtonPressed(_ sender: UIButton!) {
        
    }
    
    @objc func falseButtonPressed(_ sender: UIButton!) {
        
    }


}

