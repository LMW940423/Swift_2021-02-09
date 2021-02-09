//
//  ViewController.swift
//  DatePicker
//
//  Created by 이민우 on 2021/02/04.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    let timeSelector : Selector = #selector(DateViewController.updateTime) // 현재 ViewController에 있는 updateTime이라는 함수를 이용!
    let interval = 1.0 // 시간 interval 1초
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // interval : 시간 간격, target : 실행시킬 곳, selector : 실행할 함수?, userinfo : ?, repeats : 반복할지 안할지?
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"
        lblPickerTime.text = "선택시간 : \(formatter.string(from: datePickerView.date))" // DatePicker에서 date를 가져온다! (년도,월,일 등 다 가져올 수 있을 듯!)
    }
    
    // Async Task로 1초당 1번씩 구동
    // objc 타입으로 func을 생성
    @objc func updateTime(){
        let date = NSDate() // NS : Next Step // OS로 부터 Date를 가져오는 것
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko") // 한국 지역에 맞추기
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" // yyyy(년도) - mm(월) - dd(일) EEE(요일) a((오전/오후)) hh(시간):mm(분):ss(초)
        // a를 제거하고 hh를 HH로 바꾸면 24시간 방식으로 바뀐다!
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))"
    }
}

