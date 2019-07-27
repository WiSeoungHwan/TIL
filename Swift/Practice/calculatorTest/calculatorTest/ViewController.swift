//
//  ViewController.swift
//  calculatorTest
//
//  Created by Wi on 2018. 9. 28..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var operand1 = UILabel()
    var textField1 = UITextField()
    var operand2 = UILabel()
    var textField2 = UITextField()
    var operators = UILabel()
    var operatorsTextField = UITextField()
    var resultButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        CreateCulculatorView()
        
        
        
    }
    func CreateCulculatorView() {
        operand1 = createLabel(labelName: "피연산자1", postition: CGRect(x: 15, y: 60, width: 100, height: 50))
        textField1 = createTextField(position: operand1)
        view.addSubview(operand1)
        view.addSubview(textField1)
        
        operators = createLabel(labelName: "연산자", postition: CGRect(x: 130, y: 60 , width: 100, height: 50))
        operatorsTextField = createTextField(position: operators)
        view.addSubview(operators)
        view.addSubview(operatorsTextField)
        
        operand2 = createLabel(labelName: "피연산자2", postition: CGRect(x: 245, y: 60, width: 100, height: 50))
        textField2 = createTextField(position: operand2)
        view.addSubview(operand2)
        view.addSubview(textField2)
        
        resultButton.frame = CGRect(x: 30, y: 150, width: 300, height: 50)
        resultButton.backgroundColor = .gray
        resultButton.setTitle("결과확인", for: UIControl.State.normal)
        resultButton.titleLabel?.textRect(forBounds: CGRect(x: 60, y: 40, width: 80, height: 60), limitedToNumberOfLines: 1)
        resultButton.titleLabel?.textColor = .black
        resultButton.setTitleColor(.blue, for: UIControl.State.highlighted)
//        resultButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        view.addSubview(resultButton)
        
        
        
        
    }
    func textFieldPositioning(position pos: CGRect) -> CGRect{
        let rect = CGRect(x: pos.origin.x, y: pos.origin.y + 40, width: pos.width, height: pos.height - 20)
        return rect
    }
    func createLabel(labelName name: String, postition pos: CGRect) -> UILabel {
        let label = UILabel(frame: pos)
        label.text = name
        label.textAlignment = .center
        label.font = UIFont(name: name, size: 15)
        return label
    }
    func createTextField(position pos: UILabel) -> UITextField {
        let textField = UITextField(frame: textFieldPositioning(position: pos.frame))
        textField.borderStyle = .line
        return textField
    }
    @objc func buttonDidTap(sender: UIButton){
        var result: Double = 0
         var alertController = UIAlertController()
        //바인딩 해서 넣기
        if let a = textField1.text, let b = operatorsTextField.text, let c = textField2.text{
            alertController = UIAlertController(title: "결과", message: "\(a) \(b) \(c) = \(result)", preferredStyle: UIAlertController.Style.alert)
        }
        
        
        
        let OkAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
        
        alertController.addAction(OkAction)
        present(alertController, animated: true)
    }

}

