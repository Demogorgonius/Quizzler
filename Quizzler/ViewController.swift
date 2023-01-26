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
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        [questionLabel,
         backgroundImageView].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        [ self.trueButton,
          self.falseButton,
          self.progressView].forEach {
            stackView.addArrangedSubview($0)
            
        }
        return stackView
    }()
    
    lazy var progressView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 40))
        view.backgroundColor = .clear
        view.alpha = 1.0
        view.addSubview(progressBar)
        return view
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: BackgroundImageViewProperty().frame)
        imageView.image = BackgroundImageViewProperty().image
        imageView.addSubview(buttonsStackView)
        return imageView
    }()
    
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
        label.numberOfLines = 0
        label.text = "Question Text"
        
        return label
    }()
    
//MARK: - Other UI elements
    
    lazy var progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.center = view.center
        progressView.setProgress(0.0, animated: true)
        progressView.trackTintColor = .white
        progressView.tintColor = #colorLiteral(red: 1, green: 0.4588235294, blue: 0.6588235294, alpha: 1)
        return progressView
    }()
    
//MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1923559308, green: 0.2327082157, blue: 0.3624993563, alpha: 1)
        view.addSubview(verticalStackView)
        makeConstraints()
        
    }
    
//MARK: - Methods
    @objc func trueButtonPressed(_ sender: UIButton!) {
        
    }
    
    @objc func falseButtonPressed(_ sender: UIButton!) {
        
    }
    
//MARK: - Add constraints
    
    func makeConstraints() {
        
        verticalStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.centerX.equalTo(backgroundImageView)
            make.centerY.equalTo(backgroundImageView)
            make.height.equalTo(backgroundImageView)
            make.width.equalTo(backgroundImageView)
        }
        
        progressBar.snp.makeConstraints { (make) in
            make.centerX.equalTo(progressView)
            make.centerY.equalTo(progressView)
            make.leading.equalTo(progressView).offset(15)
            make.height.equalTo(10)
        }
        
    }
    
    
    
    


}

