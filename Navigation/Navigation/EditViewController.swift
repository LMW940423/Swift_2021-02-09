//
//  EditViewController.swift
//  Navigation
//
//  Created by 이민우 on 2021/02/09.
//

import UIKit

// EditViewController에서 ViewController의 함수를 실행해서 데이터 전달하는 것
protocol EditDelegate { // Java의 Interface
    func didMessageEditDone(_ controller : EditViewController, message : String)
    func didImageOnOffDone(_ controller : EditViewController, isOn : Bool)
}

class EditViewController: UIViewController {

    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var swIsOn: UISwitch!
    
    var delegate : EditDelegate? // 위에서 선언한 EditDelegate를 사용
    
    var textWayValue : String = ""
    var textMessage : String = ""
    var isOn : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        lblWay.text = textWayValue
        txtMessage.text = textMessage
        
        swIsOn.isOn = isOn
        
        if isOn{
            lblOnOff.text = "ON"
        }else{
            lblOnOff.text = "OFF"
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        // optional이기에 nil일 경우와 나눠서 구분
        if delegate != nil{
            delegate?.didMessageEditDone(self, message: txtMessage.text!) // Main으로 값을 넘기는 부분
            delegate?.didImageOnOffDone(self, isOn: isOn) // Main으로 값을 넘기는 부분
        }
        navigationController?.popViewController(animated: true) // 가장 마지막에 뜬 화면을 사라지게 하기
    }
    
    @IBAction func swImageOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
            lblOnOff.text = "ON"
        }else{
            isOn = false
            lblOnOff.text = "OFF"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
