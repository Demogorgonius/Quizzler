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
    
    var quizzBrain = QuizzBrain()
    
    
    //MARK: - View/StackView
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.alignment = .fill
        stackView.contentMode = .scaleToFill
        stackView.distribution = .fillProportionally
        [self.scoreLabel,
         self.questionLabel,
         self.firstButton,
         self.secondButton,
         self.thirdButton,
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
    
    
    lazy var firstButton: UIButton = {
        let button = UIButton(frame: ButtonProperty().buttonFrame)
        button.setBackgroundImage(ButtonProperty().buttonBackgroundImage, for: .normal)
        button.setTitle("One", for: .normal)
        button.titleLabel?.font = ButtonProperty().buttonFont
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let button = UIButton(frame: ButtonProperty().buttonFrame)
        button.setBackgroundImage(ButtonProperty().buttonBackgroundImage, for: .normal)
        button.setTitle("Two", for: .normal)
        button.titleLabel?.font = ButtonProperty().buttonFont
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var thirdButton: UIButton = {
        let button: UIButton = UIButton(frame: ButtonProperty().buttonFrame)
        button.setBackgroundImage(ButtonProperty().buttonBackgroundImage, for: .normal)
        button.setTitle("Three", for: .normal)
        button.titleLabel?.font = ButtonProperty().buttonFont
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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
    lazy var scoreLabel: UILabel = {
        let label = UILabel(frame: LabelProperty().labelScoreFrame)
        label.font = LabelProperty().labelFont
        label.textColor = LabelProperty().labelTextColor
        label.numberOfLines = 1
        label.textAlignment = .left
        
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
        updateUI()
        makeConstraints()
        
    }
    
    //MARK: - Methods
    @objc func buttonPressed(_ sender: UIButton!) {
        guard let userAnswer = sender.currentTitle else { return }
        let userGotItRight = quizzBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizzBrain.calculateScore(userGotItRight)
        
        if quizzBrain.questionNumber == quizzBrain.quiz.count - 1 {
            let alert = UIAlertController(title: "Your score", message: "Congratulation! Your score: \(quizzBrain.userScore)", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(defaultAction)
            present(alert, animated: true)
        }
        
        quizzBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.3, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
    }
    
    @objc func updateUI () {
        
        firstButton.backgroundColor = UIColor.clear
        firstButton.setTitle(quizzBrain.getAnswerLabel()[0], for: .normal)
        
        secondButton.backgroundColor = UIColor.clear
        secondButton.setTitle(quizzBrain.getAnswerLabel()[1], for: .normal)
        
        thirdButton.backgroundColor = UIColor.clear
        thirdButton.setTitle(quizzBrain.getAnswerLabel()[2], for: .normal)
        
        questionLabel.text = quizzBrain.getQuestionText()
        progressBar.progress = quizzBrain.getProgress()
        scoreLabel.text = "Score: \(quizzBrain.userScore)"
    }
    
    //MARK: - Add constraints
    
    func makeConstraints() {
        
        verticalStackView.snp.makeConstraints { (make) in
            make.height.equalToSuperview().offset(-40)
            make.width.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(40)
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
        
        scoreLabel.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(verticalStackView).offset(-15)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.height.equalTo(544)
            make.width.equalTo(verticalStackView).offset(-15)
            
        }
        
        firstButton.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.trailing.equalToSuperview().offset(-15)
            make.leading.equalToSuperview().offset(15)
            make.centerX.equalTo(verticalStackView)
        }
        
        secondButton.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.trailing.equalToSuperview().offset(-15)
            make.leading.equalToSuperview().offset(15)
            make.centerX.equalTo(verticalStackView)
        }
        
        thirdButton.snp.makeConstraints { (make) in
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

