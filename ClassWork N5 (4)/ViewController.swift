//
//  ViewController.swift
//  ClassWork N5 (4)
//
//  Created by Magdiel Altynbekov on 5/1/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var controller: JokeController?
    
    private var joke: Joke?

    private lazy var setupLabel: UILabel = {
        let view = UILabel()
        view.text = "setup"
        return view
    }()
    private lazy var punchlineLabel: UILabel = {
        let view = UILabel()
        view.text = "punchline"
        return view
    }()
    private lazy var userPunchlineTextField: UITextField = {
      let view = UITextField()
        view.placeholder = "Введите punchline"
        view.backgroundColor = .white
        view.layer.cornerRadius = 80 / 4
        return view
    }()
    private lazy var punchlineButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("?", for: .normal)
        view.backgroundColor = .green
        view.layer.cornerRadius = 80 / 2
        view.addTarget(self, action: #selector(checkUserAnswer), for: .touchUpInside)
        return view
    }()
    
    
    @objc func checkUserAnswer() {
        if userPunchlineTextField.text == joke?.punchline {
            let correctAlert = UIAlertController(title: "Правильный ответ!", message: "Вы молодец!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            correctAlert.addAction(okAction)
            present(correctAlert, animated: true)
        } else {
            let incorrectAlert = UIAlertController(title: "Неправильный ответ!", message: "Ответ: \(joke?.punchline ?? "punchline")", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            incorrectAlert.addAction(okAction)
            present(incorrectAlert, animated: true)
        }
    }
    
    
    private lazy var nextJokeButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Следущая", for: .normal)
        view.backgroundColor = .red
        view.layer.cornerRadius = 80 / 2
        view.addTarget(self, action: #selector(showNextJoke), for: .touchUpInside)
        return view
    }()
    
    @objc func showNextJoke () {
        joke = controller?.getJoke()
        setupLabel.text = joke?.setup
    }
    
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
        setupSubviews()
        super.viewDidLoad()
        controller = JokeController(view: self)
        
        
        // Do any additional setup after loading the view.
    }
    func setupSubviews() {
        view.addSubview(setupLabel)
        setupLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        view.addSubview(punchlineLabel)
        punchlineLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(setupLabel.snp.bottom).offset(20)
        }
        view.addSubview(userPunchlineTextField)
        userPunchlineTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(punchlineLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(60)
        }
        view.addSubview(punchlineButton)
        punchlineButton.snp.makeConstraints { make in
            make.left.equalTo(50)
            make.top.equalTo(userPunchlineTextField.snp.bottom).offset(80)
            make.width.height.equalTo(120)
        }
        view.addSubview(nextJokeButton)
        nextJokeButton.snp.makeConstraints { make in
            make.right.equalTo(-50)
            make.top.equalTo(userPunchlineTextField.snp.bottom).offset(80)
            make.width.height.equalTo(120)
        }
    }
    
    
    
}

  
