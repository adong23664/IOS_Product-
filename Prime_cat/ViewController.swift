//
//  ViewController.swift
//  Prime_cat
//
//  Created by 楊振東 on 2021/6/17.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{


    @IBOutlet weak var myBtn: UIButton!
    @IBOutlet weak var enterNumber: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultTexView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myBtn.layer.shadowOffset = CGSize(width: 10, height: 10)
        myBtn.layer.shadowColor = UIColor.darkGray.cgColor
        myBtn.layer.shadowOpacity = 0.5
        myBtn.layer.borderWidth = 3
        myBtn.layer.borderColor = UIColor.white.cgColor
        enterNumber.tag = 2
        enterNumber.returnKeyType = .done
        enterNumber.delegate = self
    }
    @IBAction func goBtn(_ sender: Any) {
        var primeArray :[Int] = []
        if let number = Int(enterNumber.text!), number > 1 {
            var primenum = true
            var isPreimNum = true
            for item in 2...number {
                for j in 2..<item {
                    if item % j == 0 {
                        isPreimNum = false
                        break
                    }
                }
                if isPreimNum {
                    primeArray.append(item)
                    print(item , terminator:" ")
                    resultTexView.text = "2~\(number)的質數有: \n\n\(primeArray) "
                }
                 primenum = isPreimNum
                isPreimNum = true
            }
                if primenum == true {
                    print ("\(number) 是質數")
                    imageView.image = UIImage(named: "isPrime")
                } else {
                    print ("\(number) 非質數")
                    imageView.image = UIImage(named: "notPrime")
                }
        }
        enterNumber.resignFirstResponder()
   }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let textField = self.view.viewWithTag(2) as? UITextField{
            textField.resignFirstResponder()
        }
    }
    
    @IBAction func alertBrn(_ sender: Any) {
        let alert = UIAlertController(title: "通知！", message: "所有圖片引用自:蜜桃猫 作者:不觉晓晓\n非營利為目的,若有侵權請告知,必會立刻下架", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
}
