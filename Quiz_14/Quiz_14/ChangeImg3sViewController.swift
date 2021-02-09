//
//  ViewController.swift
//  Quiz_08
//
//  Created by 이민우 on 2021/02/04.
//

import UIKit

class ChangeImg3sViewController: UIViewController {

    @IBOutlet weak var lblImageName: UILabel!
    @IBOutlet weak var ImgView: UIImageView!
    
    let timeSelector : Selector = #selector(ChangeImg3sViewController.updateTime) // 현재 ViewController에 있는 updateTime이라는 함수를 이용!
    let interval = 3.0 // 시간 interval 3초
    
//    var images = [UIImage?]() // image 저장하는 배열
//    var imageNames = [String?]() // imageName 저장하는 배열
    
    // 선생님 방식
    var imageName = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    var numImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //선생님 방식
        displayImage(number : numImage)
        
        // 이미지 이름 저장
//        for i in 1...6{
//            imageNames.append("flower_0\(i).png")
//        }
        
        // 이미지 파일 연결
//        for i in 1...6{
//            images.append(UIImage(named: "flower_0\(i).png"))
//        }
        
        // 이미지 할당
//        ImgView.image = images[0]
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(){
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko") // 한국 지역에 맞추기
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" // yyyy(년도) - mm(월) - dd(일) EEE(요일) a((오전/오후)) hh(시간):mm(분):ss(초)
        // a를 제거하고 hh를 HH로 바꾸면 24시간 방식으로 바뀐다!
//        changeImaAndTxt()
    
        
        // 선생님 방식
        numImage += 1
        if numImage >= imageName.count{
            numImage = 0
        }
        displayImage(number: numImage)
    }
    
    // text와 image를 바꿔주는 함수
//    func changeImaAndTxt() {
//
//        // lblImageName의 text속 숫자를 뽑아내기
//        let sp1Array = lblImageName.text?.split(separator: "_")
//        let sp2Array = sp1Array![1].split(separator: ".")
//        var intNum = Int(sp2Array[0])
//
//        if intNum == 6{ // 6번째 사진이면 다음 사진은 다시 1번쨰부터!
//            intNum = 0
//        }
//        lblImageName.text = imageNames[intNum!]
//        ImgView.image = images[intNum!]
//    }
    
    // 선생님 방식
    func displayImage(number : Int){
        ImgView.image = UIImage(named: imageName[number])
        lblImageName.text = imageName[number]
    }
}



