//
//  ViewController.swift
//  Quiz_15
//
//  Created by 이민우 on 2021/02/09.
//

import UIKit

class ViewController: UIViewController, SelectSwitchDelegate {

    @IBOutlet weak var imgView: UIImageView!
    
    // 이미지 셋팅
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgPink = UIImage(named: "lamp_pink.png")
    
    // Switch Value
    var swIsOn = false
    var swIsPink = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 초기값 설정
        imgView.image = imgOff
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectLampController = segue.destination as! SelectLampViewController
        
        selectLampController.delegate = self
        selectLampController.isOn = swIsOn
        selectLampController.isPink = swIsPink
    }
    
    // Sub에서 가져온 protocol (받아온 값 대입하기)
    func SelectOnOff(_ controller: SelectLampViewController, isOnOff: Bool, isPink: Bool) {
        if isOnOff{ // On인지 확인
            if isPink{ // On상태 일 때 Pink상태 확인
                imgView.image = imgPink
                swIsOn = true
                swIsPink = true
            }else{
                imgView.image = imgOn
                swIsOn = true
                swIsPink = false
            }
        }else{ // Off 상태
            imgView.image = imgOff
            swIsOn = false
            swIsPink = false
        }
    }


}

