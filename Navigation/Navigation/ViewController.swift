//
//  ViewController.swift
//  Navigation
//
//  Created by 이민우 on 2021/02/09.
//

// protocol 순서 Sub => Main으로 데이터 주기
// 1. SubController에서 protocol 생성 및 함수 설정
// 2. 원하는 액션에서 생성한 protocol의 함수 실행
// 3. MainAcivity에서 Sub에서 생성한 protocol 선언 및 함수 선언
// 4. 선언된 함수에 원하는 액션 넣기

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    var isOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = imgOn
    }
    
    // Segue를 통해 데이터 보내기 (Field 값만 건드리는 것이 좋다!)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "Segue : Use Button!" // 해당 컨트롤러의 변수에 값을 대입해준다.
        }else{
            editViewController.textWayValue = "Segue : Use BarButton!" // 해당 컨트롤러의 변수에 값을 대입해준다.
        }
        editViewController.textMessage = txtMessage.text!
        editViewController.delegate = self // Main에서 Sub로 날라갈 때 권한을 준 것
        editViewController.isOn = isOn // Main에서 Sub로 데이터 넘김
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn{
            imgView.image = imgOn
            self.isOn = true
        }else{
            imgView.image = imgOff
            self.isOn = false
        }
    }

}

