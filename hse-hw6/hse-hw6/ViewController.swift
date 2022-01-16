//
//  ViewController.swift
//  hse-hw6
//
//  Created by Egor Fedyaev on 20.12.2021.
//

import UIKit
import MyLogger1
import MyLogger2
import MyLogger3

class ViewController: UIViewController {
    
    let loggers = [
        ("Logger (framework)", #selector(logF)),
        ("Logger (package)", #selector(logPackage)),
        ("Logger (pod)", #selector(logPod)),
        ("Logger (Carthage)", #selector(LogC)),
    ]
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.center = view.center
        stack.bounds = view.bounds
        stack.alignment = .center
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(stack)
        
        loggers.forEach { logger in
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 128, height: 24))
            button.setTitle(logger.0, for: .normal)
            button.addTarget(self, action: logger.1, for: .touchUpInside)
            button.setTitleColor(.systemBlue, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(button)
        }
    }
    
    @objc
    func logF() {
        MyLogger1.log("Hello world")
    }
    
    @objc
    func logPackage() {
        MyLogger2.log("Hello world")
    }
    
    @objc
    func logPod() {
        MyLogger3.log("Hello world")
    }
    
    @objc
    func LogC() {
        print("Carthage")
    }
}

