//
//  ViewController.swift
//  ApplePie Storyboard
//
//  Created by Максим Иванов on 18.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var guessWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: -Properties
    var currentGame: Game!
    let incorrectMovesAllowed = 7
    var listOfCities = [
        "Александрия",
        "Атланта",
//        "Ахмедабад",
//        "Багдад",
//        "Бангалор",
//        "Бангкок",
//        "Барселона",
//        "Белу-Оризонти",
//        "Богота",
//        "Буэнос-Айрес",
//        "Вашингтон",
//        "Гвадалахара",
//        "Гонконг",
//        "Гуанчжоу",
//        "Дакка",
//        "Даллас",
//        "Далянь",
//        "Дар-эс-Салам",
//        "Дели",
//        "Джакарта",
//        "Дунгуань",
//        "Йоханнесбург",
//        "Каир",
//        "Калькутта",
//        "Карачи",
//        "Киншаса",
//        "Куала Лумпур",
//        "Лагос",
//        "Лахор",
//        "Лима",
//        "Лондон",
//        "Лос-Анджелес",
//        "Луанда",
//        "Мадрид",
//        "Майами",
//        "Манила",
//        "Мехико",
//        "Москва",
//        "Мумбаи",
//        "Нагоя",
//        "Нанкин",
//        "Нью-Йорк",
//        "Осака",
//        "Париж",
//        "Пекин",
//        "Пуна",
//        "Рио-де-Жанейро",
//        "Сан-Паулу",
//        "Санкт-Петербург",
//        "Сантьяго",
//        "Сеул",
//        "Сиань",
//        "Сингапур",
//        "Стамбул",
//        "Сурат",
//        "Сучжоу",
//        "Тегеран",
//        "Токио",
//        "Торонто",
//        "Тяньцзинь",
//        "Ухань",
//        "Филадельфия",
//        "Фошань",
//        "Фукуока",
//        "Хайдарабад",
//        "Ханчжоу",
//        "Харбин",
//        "Хартум",
//        "Хошимин",
//        "Хьюстон",
//        "Цзинань",
//        "Циндао",
//        "Ченнай",
//        "Чикаго",
//        "Чунцин",
//        "Чэнду",
//        "Шанхай",
//        "Шэньчжэнь",
//        "Шэньян",
//        "Эр-Рияд",
//        "Янгон",
    ].shuffled()
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosts = 0 {
        didSet {
            newRound()
        }
    }
    
    // MARK: - Methods
    
    func enableButtons(_ enable: Bool = true) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func newRound() {
        guard !listOfCities.isEmpty else {
            enableButtons(false)
            updateUI()
            return
        }
        let newCity = listOfCities.removeFirst()
        currentGame = Game(guessWord: newCity, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
        enableButtons(true)
    }
    
    func updateCurrentWord() {
        
        var displayWord = [String]()
        
        for letter in currentGame.currentWord {
            displayWord.append(String(letter))
        }
        
        guessWordLabel.text = displayWord.joined(separator: " ")
    }
    
    func updateState() {
        
        if currentGame.incorrectMovesRemaining <= 0 {
            totalLosts += 1
        } else if currentGame.guessWord == currentGame.currentWord {
            totalWins += 1
        } else {
            updateUI()
        }
        
        
    }
    
    func updateUI() {
        let movesRemaining = currentGame.incorrectMovesRemaining
        let imageNameNumber = (movesRemaining + 64) % 8
        let imageName = "Tree\(imageNameNumber)"
        treeImageView.image = UIImage(named: imageName)
        updateCurrentWord()
        scoreLabel.text = "Выигрыши: \(totalWins)   Проигрыши: \(totalLosts)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    
    
    // MARK: - IB Actions
    
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        
        sender.isEnabled = false
        let touchedLetter = sender.title(for: .normal)!
        currentGame.playerChoose(letter: Character(touchedLetter))
        updateState()
    }
    
}

