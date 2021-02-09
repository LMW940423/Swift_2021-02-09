//
//  HelpViewController.swift
//  Quiz_16
//
//  Created by 이민우 on 2021/02/09.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = "컬러 구구단은 무지개 색깔을 숫자로 바꾸어 구구단을 계산하는 것입니다.\n\n예를 들어, 빨강 * 빨강 = 4를 의미합니다.\n\n색깔과 숫자의 대입은 다음과 같습니다.\n\n흰색 : 1\n빨강 : 2\n주황 : 3\n노랑 : 4\n초록 : 5\n파랑 : 6\n남색 : 7\n보라 : 8\n검정 : 9"
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
