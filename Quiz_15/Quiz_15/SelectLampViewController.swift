//
//  SelectLampViewController.swift
//  Quiz_15
//
//  Created by 이민우 on 2021/02/09.
//

import UIKit

protocol SelectSwitchDelegate {
    // isOnOff 는 On,Off 스위치 , isPink 는 Pink 스위치
    func SelectOnOff(_ controller : SelectLampViewController, isOnOff : Bool, isPink : Bool)
}

class SelectLampViewController: UIViewController {

    @IBOutlet weak var switchPinkValue: UISwitch!
    @IBOutlet weak var switchOnOffValue: UISwitch!
    @IBOutlet weak var lblOnOff: UILabel!
    
    // Switch Value
    var isOn = false
    var isPink = false
    
    // Delegate
    var delegate : SelectSwitchDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 초기값 셋팅
        switchPinkValue.isOn = isPink
        switchOnOffValue.isOn = isOn
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        // Switch Value을 Main으로 보내기
        if delegate != nil{
            delegate?.SelectOnOff(self, isOnOff: isOn, isPink: isPink)
        }
        navigationController?.popViewController(animated: true) // 해당 화면 사라지게 하기
    }
    
    @IBAction func switchOnOff(_ sender: UISwitch) {
        if sender.isOn{ // sender의 상태에 따라 값 변화
            isOn = true
        }else{
            isOn = false
            isPink = false
            switchPinkValue.isOn = false
        }
    }
    
    @IBAction func switchPink(_ sender: UISwitch) {
        if switchOnOffValue.isOn{ // OnOff Switch의 Status가 True일 때만 작동하게 끔 설정
            if sender.isOn{ // sender의 status에 따라 value 변화
                isPink = true
            }else{
                isPink = false
            }
        }else{ // Off 상태에서는 켜지지 않게 하기
            sender.isOn = false
            isPink = false
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
