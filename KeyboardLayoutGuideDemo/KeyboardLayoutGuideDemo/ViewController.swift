//
//  ViewController.swift
//  KeyboardLayoutGuideDemo
//
//  Created by Sergey on 28.10.2023.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - Properties
    private let textView: UITextView = {
        let view = UITextView()
        view.isEditable = true
        view.backgroundColor = .secondarySystemFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 22, weight: .regular)
        return view
    }()
    
    private let hideKeyboardButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemMint
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.setTitle("PRESS ME", for: .normal)
        button.layer.cornerRadius = 22
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(textView)
        view.addSubview(hideKeyboardButton)
        
        hideKeyboardButton.addTarget(self,
                                action: #selector(buttonDidTap),
                                for: .touchUpInside)
        
        setupConstaraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textView.becomeFirstResponder()
    }
    
    // MARK: - Private methods
    @objc private func buttonDidTap() {
        textView.resignFirstResponder()
    }
    
    private func setupConstaraints() {
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            textView.bottomAnchor.constraint(equalTo: hideKeyboardButton.topAnchor, constant: -10),
            
            hideKeyboardButton.widthAnchor.constraint(equalToConstant: 300),
            hideKeyboardButton.heightAnchor.constraint(equalToConstant: 50),
            hideKeyboardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //hideKeyboardButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            // MARK: - KeyboardLayoutGuide
            hideKeyboardButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -10),
        ])
    }
}

