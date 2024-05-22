//
//  NewlyCoinedWordViewController.swift
//  EmotionDiary
//
//  Created by 여성은 on 5/17/24.
//


// 신조어 리스트 배열로 구현

import UIKit

class NewlyCoinedWordViewController: UIViewController {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    
    @IBOutlet var firstNewlyWordButton: UIButton!
    @IBOutlet var secondNewlyWordButton: UIButton!
    @IBOutlet var thirdNewlyWordButton:UIButton!
    @IBOutlet var fourthNewlyWordButton: UIButton!
    
    
    @IBOutlet var resultImageView: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var recentWordLabel: UILabel!
    
    @IBOutlet var recentWordButtons: [UIButton]!
    
    @IBOutlet var resetButton: UIButton!
    
    
    var newWords: [String] = ["쓸쓸비용", "편백족", "만반잘부", "이생망", "스불재", "KIJUL", "~그 잡채", "오뱅알", "중꺽그마", "잼얘"]
    var wordMean: [String] = [
        "외로움을 달래기 위해 쓰는 비용",
        "끼니등을 편의점에서 해결하면서 옷이나 신발등은 백화점에서 명품을 사는 사람",
        "만나서 반갑습니다. 잘 부탁드립니다",
        "이번 생은 망했다",
        "스스로 불러온 재앙",
        "기절을 영어로 표현한 단어 \nex) 맛있어서 kijul",
        "‘그 자체’의 언어유희",
        "오늘 뱅송(방송) 알찼다",
        "중요한 건 꺾였는데도 그냥 하는 마음",
        "재미있는 이야기의 줄임말"
    ]
    var indexArray = [0, 1, 2, 3]
    
    /*
    @IBOutlet var newlyWordButtons: [UIButton]!

    var newWordsDictionary = [
        "쓸쓸비용": "외로움을 달래기 위해 쓰는 비용",
        "편백족":"끼니등을 편의점에서 해결하면서 옷이나 신발등은 백화점에서 명품을 사는 사람",
        "만반잘부": "만나서 반갑습니다. 잘 부탁드립니다",
        "이생망": "이번 생은 망했다",
        "스불재": "스스로 불러온 재앙",
        "KIJUL": "기절을 영어로 표현한 단어 \nex) 맛있어서 kijul",
        "~그 잡채": "‘그 자체’의 언어유희",
        "오뱅알": "오늘 뱅송(방송) 알찼다",
        "중꺽그마": "중요한 건 꺾였는데도 그냥 하는 마음",
        "잼얘": "재미있는 이야기의 줄임말"
    ]
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchTextField.layer.borderWidth = 2
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.setTitle("", for: .normal)
        searchButton.tintColor = .white
        searchButton.backgroundColor = .black
        
        setNewlyWord(button: firstNewlyWordButton, text: "\(newWords[indexArray[0]])")
        setNewlyWord(button: secondNewlyWordButton, text: "\(newWords[indexArray[1]])")
        setNewlyWord(button: thirdNewlyWordButton, text: "\(newWords[indexArray[2]])")
        setNewlyWord(button: fourthNewlyWordButton, text: "\(newWords[indexArray[3]])")
        /*
        setRandomButtonDict(button: newlyWordButtons)
         */
        
        resultImageView.image = UIImage.background
        resultImageView.contentMode = .scaleAspectFill
        resultLabel.text = ""
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0
        resultLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        recentWordLabel.text = "최근 검색어"
        setRecentWordsButtons()
        setResetButton()
        
        
    }
    
    
    // 랜덤신조어 버튼 UI설정 함수
    func setNewlyWord(button: UIButton, text: String) {
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.titleLabel?.textColor = .black
        button.tintColor = .black
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
    }
 
    
    // 0~신조어배열의개수-1 중 4개의 숫자 랜덤으로 중복없이 뽑기
    func setRandomIndex() {
        
        indexArray.removeAll()
        
        while indexArray.count < 4 {
            let number = Int.random(in: 0...newWords.count-1)
            if !indexArray.contains(number) {
                indexArray.append(number)
            }
        }
        
        print("indexArray: \(indexArray)")
    }
    
    // 검색어 입력시
    // 검색어가 배열에 있는 경우 -> 인덱스 찾기 -> 인덱스로 뜻 배열에서 찾기
    // 검색어를 찾지 못한 경우 -> 검색결과없음 return
    func searchMeaning(text: String) -> String {
        var resultIndex: Int = 0
        var resultMeaning: String = ""
        
        resultIndex = newWords.firstIndex(of: text) ?? -1
        
        if resultIndex == -1 {
            resultMeaning = "검색 결과가 없습니다."
        } else {
            resultMeaning = wordMean[resultIndex]
            
        }
        
        return resultMeaning
    }
    /*
    func searchMeaningDict(text: String) -> String {
        guard let resultText = newWordsDictionary[text] else {
            let messge = "검색 결과가 없습니다."
            return messge
        }
        return resultText
    }
     */
    
    // 최근 검색어 배열에 searchTextField.text 추가
    func addRecentWordArray(text: String) {
        var recentWords = UserDefaults.standard.array(forKey: "recentWords") as? [String] ?? []
        
        if text != "" {
            if recentWords.count < 3 {
                recentWords.insert(text, at: 0)
            } else {
                recentWords.removeLast()
                recentWords.insert(text, at: 0)
            }
            
            UserDefaults.standard.set(recentWords, forKey: "recentWords")
            print("userDefault에 최근 검색어 갱신")
        }
    }
    
    func setRecentWordsButtons() {
        let recentWords = UserDefaults.standard.array(forKey: "recentWords") as? [String] ?? []
        print(recentWords)
        
        for button in recentWordButtons {
            button.setTitle("", for: .normal)
            button.setTitleColor(.gray, for: .normal)
            button.layer.style = .none
            button.tintColor = .lightGray
            button.isHidden = true
        }
        
        let count = recentWords.count
        
        if count != 0 {
            for index in 0...count-1 {
                recentWordButtons[index].setTitle(recentWords[index], for: .normal)
                recentWordButtons[index].isHidden = false
            }
        }
    }
    
    func setResetButton() {
        resetButton.setTitle("모두 지우기", for: .normal)
        resetButton.setTitleColor(.gray, for: .normal)
        resetButton.titleLabel?.font = .systemFont(ofSize: 12)
        resetButton.layer.style = .none
        resetButton.tintColor = .lightGray
    }
    
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        
        let searchText = searchTextField.text ?? ""
        // 최근 검색어 배열에 searchTextField.text 추가
        addRecentWordArray(text: searchText)
        setRecentWordsButtons()
     
        
        let resultText = searchMeaning(text: searchText)
        /*
        let resultText = searchMeaningDict(text: searchTextField.text ?? "")
         */
        resultLabel.text = resultText
    }
    
    @IBAction func returnKeyClicked(_ sender: UITextField) {
        let searchText = searchTextField.text ?? ""
        // 최근 검색어 배열에 searchTextField.text 추가
        addRecentWordArray(text: searchText)
        setRecentWordsButtons()
      
        
        let resultText = searchMeaning(text: searchText)
        /*
        let resultText = searchMeaningDict(text: searchTextField.text ?? "")
         */
        resultLabel.text = resultText
    }
    
    @IBAction func recentWordButtonClicked(_ sender: UIButton) {
        let word = sender.titleLabel?.text ?? ""
        searchTextField.text = word
        addRecentWordArray(text: word)
        setRecentWordsButtons()
        let resultText = searchMeaning(text: word)
        resultLabel.text = resultText
    }
    
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
        }
        
        setRecentWordsButtons()
    }
    
    
    @IBAction func randomWordButtonClicked(_ sender: UIButton) {
        var resultText: String = ""
        
        
        
        searchTextField.text = newWords[indexArray[sender.tag]]
        resultText = wordMean[indexArray[sender.tag]]
        
        // 최근검색어 추가
        addRecentWordArray(text: sender.titleLabel?.text ?? "")
        setRecentWordsButtons()
        
        resultLabel.text = resultText
        setRandomIndex()
        
        firstNewlyWordButton.setTitle(newWords[indexArray[0]], for: .normal)
        secondNewlyWordButton.setTitle(newWords[indexArray[1]], for: .normal)
        thirdNewlyWordButton.setTitle(newWords[indexArray[2]], for: .normal)
        fourthNewlyWordButton.setTitle(newWords[indexArray[3]], for: .normal)
        /*
        resultLabel.text = searchMeaning(text: newlyWordButtons[sender.tag].titleLabel?.text ?? "")
        setRandomButtonDict(button: newlyWordButtons)
         */

    }
    
    
    @IBAction func endEditingGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    /*
    func setRandomButtonDict(button: [UIButton]) {
        for (index, word) in newWordsDictionary.enumerated() {
            button[index].setTitle(word.key, for: .normal)
            if index == 3 {
                return
            }
        }
    }
    */
     
    
}

// tapGesture 코드로 추가 시
/*
 extension UIViewController {
     func hideKeyboardWhenTappedBackground() {
          let tapEvent = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
          tapEvent.cancelsTouchesInView = false
          view.addGestureRecognizer(tapEvent)
     }
     
     @objc func dismissKeyboard() {
         view.endEditing(true)
     }
 }
 */
