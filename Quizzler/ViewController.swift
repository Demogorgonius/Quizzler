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
        stackView.contentMode = .scaleToFill
        stackView.distribution = .fillProportionally
        [self.questionLabel,
         self.trueButton,
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
        return imageView
    }()
    
//MARK: - Buttons
    
        
    lazy var trueButton: UIButton = {
        let button = UIButton(frame: ButtonProperty().buttonFrame)
        button.setBackgroundImage(ButtonProperty().buttonBackgroundImage, for: .normal)
        button.setTitle("True", for: .normal)
        button.titleLabel?.font = ButtonProperty().buttonFont
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(trueButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var falseButton: UIButton = {
        let button = UIButton(frame: ButtonProperty().buttonFrame)
        button.setBackgroundImage(ButtonProperty().buttonBackgroundImage, for: .normal)
        button.setTitle("False", for: .normal)
        button.titleLabel?.font = ButtonProperty().buttonFont
        button.titleLabel?.textColor = .white
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
        view.addSubview(backgroundImageView)
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
        
        verticalStackView.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
 
        }

        
        backgroundImageView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(102)
            make.width.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        progressBar.snp.makeConstraints { (make) in
 
            make.centerY.equalTo(progressView)
            make.leading.equalTo(verticalStackView).offset(15)
            make.trailing.equalTo(verticalStackView).offset(-15)
            make.height.equalTo(10)
        }

        questionLabel.snp.makeConstraints { make in
            make.height.equalTo(614)
            make.width.equalTo(verticalStackView).offset(-15)
            
        }
        
        trueButton.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.trailing.equalToSuperview().offset(-15)
            make.leading.equalToSuperview().offset(15)
            make.centerX.equalTo(verticalStackView)
        }
        
        falseButton.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.trailing.equalToSuperview().offset(-15)
            make.leading.equalToSuperview().offset(15)
            make.centerX.equalTo(verticalStackView)
        }
        
        progressView.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.trailing.equalToSuperview().offset(-15)
            make.leading.equalToSuperview().offset(15)
            make.centerX.equalTo(verticalStackView)
        }
        

        
    }
    
    
    
    


}

