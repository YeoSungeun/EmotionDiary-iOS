//
//  EmotionDiaryViewController.swift
//  EmotionDiary
//
//  Created by 여성은 on 5/17/24.
//
// 노가다 버전^_ㅠ

import UIKit

class EmotionDiaryViewController: UIViewController {
    
 /* 노가다st
    @IBOutlet var emotion1Button: UIButton!
    @IBOutlet var emotion2Button: UIButton!
    @IBOutlet var emotion3Button: UIButton!
    @IBOutlet var emotion4Button: UIButton!
    @IBOutlet var emotion5Button: UIButton!
    @IBOutlet var emotion6Button: UIButton!
    @IBOutlet var emotion7Button: UIButton!
    @IBOutlet var emotion8Button: UIButton!
    @IBOutlet var emotion9Button: UIButton!
  */
    
    @IBOutlet var emotionButtonCollection: [UIButton]!
    @IBOutlet var emotinoLabelCollection: [UILabel]!
    
    @IBOutlet var resetButton: UIButton!
    
    /* 노가다st
    @IBOutlet var emotion1Label: UILabel!
    @IBOutlet var emotion2Label: UILabel!
    @IBOutlet var emotion3Label: UILabel!
    @IBOutlet var emotion4Label: UILabel!
    @IBOutlet var emotion5Label: UILabel!
    @IBOutlet var emotion6Label: UILabel!
    @IBOutlet var emotion7Label: UILabel!
    @IBOutlet var emotion8Label: UILabel!
    @IBOutlet var emotion9Label: UILabel!
     */
    
    var emotionArray: [String] = ["행복해", "즐거워", "사랑해♡", "화나", "심심해", "답답해", "긴장돼", "서운해", "슬퍼"
    ]
    var imageArray: [String] = ["slime1", "slime2", "slime3", "slime4", "slime5", "slime6", "slime7", "slime8", "slime9"]
    
    var countArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "감정 다이어리"
        
        /* 노가다st
        
        setEmotionButton(button: emotion1Button, imageName: "slime1")
        setEmotionLabel(label: emotion1Label, text: "\(emotionArray[0]) \(countArray[0])")
        
        setEmotionButton(button: emotion2Button, imageName: "slime2")
        setEmotionLabel(label: emotion2Label, text: "\(emotionArray[1]) \(countArray[1])")
        
        setEmotionButton(button: emotion3Button, imageName: "slime3")
        setEmotionLabel(label: emotion3Label, text: "\(emotionArray[2]) \(countArray[2])")
        
        setEmotionButton(button: emotion4Button, imageName: "slime4")
        setEmotionLabel(label: emotion4Label, text: "\(emotionArray[3]) \(countArray[3])")
        
        setEmotionButton(button: emotion5Button, imageName: "slime5")
        setEmotionLabel(label: emotion5Label, text: "\(emotionArray[4]) \(countArray[4])")
        
        setEmotionButton(button: emotion6Button, imageName: "slime6")
        setEmotionLabel(label: emotion6Label, text: "\(emotionArray[5]) \(countArray[5])")
        
        setEmotionButton(button: emotion7Button, imageName: "slime7")
        setEmotionLabel(label: emotion7Label, text: "\(emotionArray[6]) \(countArray[6])")
        
        setEmotionButton(button: emotion8Button, imageName: "slime8")
        setEmotionLabel(label: emotion8Label, text: "\(emotionArray[7]) \(countArray[7])")
        
        setEmotionButton(button: emotion9Button, imageName: "slime9")
        setEmotionLabel(label: emotion9Label, text: "\(emotionArray[8]) \(countArray[8])")
        */
        
        setEmotionButtonColletcion()
        setEmotionLabelColletcion()
        setResetButton()

      
    }
    
    func setEmotionButton(button: UIButton, imageName: String) {
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
    }
    
    func setEmotionLabel(label:UILabel, text: String) {
        label.text = text
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
    }
    
    func setEmotionButtonColletcion() {
        var index: Int = 0
        for button in emotionButtonCollection {
            setEmotionButton(button: button, imageName: "\(imageArray[index])")
            index += 1
        }
    }
    
    func setEmotionLabelColletcion() {
        var index: Int = 0
        var key = String(index)
        
        for label in emotinoLabelCollection {
            let countValue = UserDefaults.standard.integer(forKey: key)
            setEmotionLabel(label: label, text: "\(emotionArray[index]) \(countValue)")
            index += 1
            key = String(index)
        }
    }
    
    func setResetButton() {
        resetButton.setTitle("RESET", for: .normal)
        resetButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        resetButton.backgroundColor = .white
        resetButton.layer.cornerRadius = 10
        resetButton.layer.borderColor = UIColor.darkGray.cgColor
        resetButton.layer.borderWidth = 2
        resetButton.tintColor = .lightGray
    }
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        let index = sender.tag
        
        var countValue = UserDefaults.standard.integer(forKey: String(index))
        countValue += 1
        UserDefaults.standard.set(countValue, forKey: String(index))
        print("countValue저장")
        
        emotinoLabelCollection[index].text = "\(emotionArray[index]) \(countValue)"
        
        /* 노가다st
        switch index {
        case 0:
            emotion1Label.text = "\(emotionArray[index]) \(countArray[index])"
        case 1:
            emotion2Label.text = "\(emotionArray[index]) \(countArray[index])"
        case 2:
            emotion3Label.text = "\(emotionArray[index]) \(countArray[index])"
        case 3:
            emotion4Label.text = "\(emotionArray[index]) \(countArray[index])"
        case 4:
            emotion5Label.text = "\(emotionArray[index]) \(countArray[index])"
        case 5:
            emotion6Label.text = "\(emotionArray[index]) \(countArray[index])"
        case 6:
            emotion7Label.text = "\(emotionArray[index]) \(countArray[index])"
        case 7:
            emotion8Label.text = "\(emotionArray[index]) \(countArray[index])"
        case 8:
            emotion9Label.text = "\(emotionArray[index]) \(countArray[index])"
        default:
            return
        }
         */

        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
        }
        print("userdefault 초기화")
        setEmotionLabelColletcion()
        
    }
    
    
    
}
