//
//  ViewController.swift
//  Quiz_16
//
//  Created by 이민우 on 2021/02/09.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var lblNum1: UILabel!
    @IBOutlet weak var lblNum2: UILabel!
    @IBOutlet weak var txtInput: UITextField!
    
    var num1 = 0
    var num2 = 0
    
    var numColor = ["흰색", "빨강", "주황", "노랑", "초록", "파랑", "남색", "보라", "검정"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 초기값 설정
        lblNum1.text = getNum().0
        lblNum2.text = getNum().1
    }
    
    @IBAction func btnOK(_ sender: Any) {
        let _ = textFieldShouldReturn(txtInput)
    }
    
    // enter쳤을 때도 실행
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        showAlert(bool : outputResult())
        return true
    }
    
    // 결과 출력 함수
    func outputResult() -> Bool{
        let inputNum = Int(txtInput.text!)
        
        // lblNum1,2의 text값에 해당하는 numColor의 index를 뽑은 후 + 1을 하면 1~9까지의 숫자를 얻을 수 있다(도움말에 적힌 숫자와 같아진다)
        num1 = numColor.firstIndex(of: lblNum1.text!)! as Any as! Int + 1
        num2 = numColor.firstIndex(of: lblNum2.text!)! as Any as! Int + 1

        if num2 * num1 == inputNum{
            return true
        }else{
            return false
        }
        
    }
    
    // Alert 생성 함수
    // outputResult()함수로 부터 리턴받은 bool값을 기준으로 나누어 Alert을 띄운다.
    func showAlert(bool : Bool){
        
        if bool{ // 정답일 때
            let alertController = UIAlertController(title: "결과!", message: "정답입니다!", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "다음문제!", style: UIAlertAction.Style.default, handler: { [self]ACTION in
                
                // 새로운 값 부여
                lblNum1.text = "\(getNum().0)"
                lblNum2.text = "\(getNum().1)"
                // 입력칸 초기화
                txtInput.text = ""
            })
            
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }else{ // 오답일 때
            let alertController = UIAlertController(title: "결과!", message: "오답입니다!", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "다시풀기!", style: UIAlertAction.Style.default, handler: { [self]ACTION in
                // 입력칸 초기화
                txtInput.text = ""
            })
            
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    // 랜덤값 생성 함수
    // numColor의 값을 랜덤으로 뽑아내기 위해 index에 random값을 대입
    func getNum() -> (String, String){
        return (numColor[(Int.random(in: 0...8))], numColor[(Int.random(in: 0...8))])
    }
}

