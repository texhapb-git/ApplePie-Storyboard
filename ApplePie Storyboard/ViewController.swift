//
//  ViewController.swift
//  ApplePie Storyboard
//
//  Created by Максим Иванов on 18.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var mainMenuStack: UIStackView!
    @IBOutlet weak var GameStack: UIStackView!
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var guessWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    
    // MARK: -Properties
    var currentGame: Game!
    let incorrectMovesAllowed = 7
    var listOfWords = [String]()
    
    var listOfCountries: [String] = [
        "Австралия",
        "Австрия",
        "Азербайджан",
        "Албания",
        "Алжир",
        "Ангола",
        "Андорра",
        "Аргентина",
        "Армения",
        "Афганистан",
        "Багамы",
        "Бангладеш",
        "Барбадос",
        "Бахрейн",
        "Белоруссия",
        "Белиз",
        "Бельгия",
        "Бенин",
        "Болгария",
        "Боливия",
        "Ботсвана",
        "Бразилия",
        "Бруней",
        "Буркина-Фасо",
        "Бурунди",
        "Бутан",
        "Вануату",
        "Великобритания",
        "Венгрия",
        "Венесуэла",
        "Вьетнам",
        "Габон",
        "Гаити",
        "Гайана",
        "Гамбия",
        "Гана",
        "Гватемала",
        "Гвинея",
        "Гвинея-Бисау",
        "Германия",
        "Гондурас",
        "Гренада",
        "Греция",
        "Грузия",
        "Дания",
        "Джибути",
        "Доминика",
        "Доминикана",
        "Египет",
        "Замбия",
        "Зимбабве",
        "Израиль",
        "Индия",
        "Индонезия",
        "Иордания",
        "Ирак",
        "Иран",
        "Ирландия",
        "Исландия",
        "Испания",
        "Италия",
        "Йемен",
        "Кабо-Верде",
        "Казахстан",
        "Камбоджа",
        "Камерун",
        "Канада",
        "Катар",
        "Кения",
        "Кипр",
        "Киргизия",
        "Кирибати",
        "Китай",
        "Колумбия",
        "Коморы",
        "Конго",
        "ДР Конго",
        "КНДР",
        "Корея",
        "Коста-Рика",
        "Кот-д’Ивуар",
        "Куба",
        "Кувейт",
        "Лаос",
        "Латвия",
        "Лесото",
        "Либерия",
        "Ливан",
        "Ливия",
        "Литва",
        "Лихтенштейн",
        "Люксембург",
        "Маврикий",
        "Мавритания",
        "Мадагаскар",
        "Малави",
        "Малайзия",
        "Мали",
        "Мальдивы",
        "Мальта",
        "Марокко",
        "Мексика",
        "Мозамбик",
        "Молдавия",
        "Монако",
        "Монголия",
        "Мьянма",
        "Намибия",
        "Науру",
        "Непал",
        "Нигер",
        "Нигерия",
        "Нидерланды",
        "Никарагуа",
        "Новая Зеландия",
        "Норвегия",
        "ОАЭ",
        "Оман",
        "Пакистан",
        "Палау",
        "Панама",
        "Парагвай",
        "Перу",
        "Польша",
        "Португалия",
        "Россия",
        "Руанда",
        "Румыния",
        "Сальвадор",
        "Самоа",
        "Сан-Марино",
        "Сейшелы",
        "Сенегал",
        "Сент-Люсия",
        "Сербия",
        "Сингапур",
        "Сирия",
        "Словакия",
        "Словения",
        "США",
        "Сомали",
        "Судан",
        "Суринам",
        "Сьерра-Леоне",
        "Таджикистан",
        "Таиланд",
        "Танзания",
        "Того",
        "Тонга",
        "Тувалу",
        "Тунис",
        "Туркмения",
        "Турция",
        "Уганда",
        "Узбекистан",
        "Украина",
        "Уругвай",
        "Микронезия",
        "Фиджи",
        "Филиппины",
        "Финляндия",
        "Франция",
        "Хорватия",
        "ЦАР",
        "Чад",
        "Черногория",
        "Чехия",
        "Чили",
        "Швейцария",
        "Швеция",
        "Шри-Ланка",
        "Эквадор",
        "Эритрея",
        "Эсватини",
        "Эстония",
        "Эфиопия",
        "ЮАР",
        "Южный Судан",
        "Ямайка",
        "Япония"
    ]
    
    var listOfCities: [String] = [
        "Абу-Даби",
        "Абуджа",
        "Аддис-Абеба",
        "Аккра",
        "Алжир",
        "Амман",
        "Амстердам",
        "Андорра-ла-Велья",
        "Анкара",
        "Антананариву",
        "Апиа",
        "Асмэра",
        "Асунсьон",
        "Афины",
        "Ашхабад",
        "Багдад",
        "Баку",
        "Бамако",
        "Банги",
        "Бангкок",
        "Банжул",
        "Бастер",
        "Бейрут",
        "Белград",
        "Бельмопан",
        "Берлин",
        "Берн",
        "Бисау",
        "Бишкек",
        "Богота",
        "Браззавиль",
        "Бразилиа",
        "Братислава",
        "Бриджтаун",
        "Брюссель",
        "Будапешт",
        "Бухарест",
        "Буэнос-Айрес",
        "Вадуц",
        "Валлетта",
        "Варшава",
        "Ватикан",
        "Вашингтон",
        "Веллингтон",
        "Вена",
        "Виктория",
        "Вильнюс",
        "Виндхук",
        "Вьентьян",
        "Габороне",
        "Гавана",
        "Гватемала",
        "Гитега",
        "Дакар",
        "Дакка",
        "Дамаск",
        "Джакарта",
        "Джибути",
        "Джорджтаун",
        "Джуба",
        "Дили",
        "Додома",
        "Доха",
        "Дублин",
        "Душанбе",
        "Ереван",
        "Загреб",
        "Иерусалим",
        "Иерусалим",
        "Исламабад",
        "Кабул",
        "Каир",
        "Кампала",
        "Канберра",
        "Каракас",
        "Кастри",
        "Катманду",
        "Кигали",
        "Киев",
        "Кингстаун",
        "Кингстон",
        "Киншаса",
        "Кито",
        "Кишинёв",
        "Конакри",
        "Копенгаген",
        "Куала-Лумпур",
        "Либревиль",
        "Лилонгве",
        "Лима",
        "Лиссабон",
        "Ломе",
        "Лондон",
        "Луанда",
        "Лусака",
        "Любляна",
        "Люксембург",
        "Маджуро",
        "Мадрид",
        "Малабо",
        "Мале",
        "Манагуа",
        "Манама",
        "Манила",
        "Мапуту",
        "Масеру",
        "Маскат",
        "Мбабане",
        "Мехико",
        "Минск",
        "Могадишо",
        "Монако",
        "Монровия",
        "Монтевидео",
        "Морони",
        "Москва",
        "Найроби",
        "Нассау",
        "Нгерулмуд",
        "Нджамена",
        "Нейпьидо",
        "Ниамей",
        "Никосия",
        "Нуакшот",
        "Нукуалофа",
        "Нур-Султан",
        "Нью-Дели",
        "Осло",
        "Оттава",
        "Паликир",
        "Панама",
        "Парамарибо",
        "Париж",
        "Пекин",
        "Пномпень",
        "Подгорица",
        "Порт-Вила",
        "Порт-Луи",
        "Порт-Морсби",
        "Порт-о-Пренс",
        "Порт-оф-Спейн",
        "Порто-Ново",
        "Прага",
        "Прая",
        "Претория",
        "Пхеньян",
        "Рабат",
        "Рейкьявик",
        "Рига",
        "Рим",
        "Розо",
        "Сан-Марино",
        "Сан-Сальвадор",
        "Сан-Томе",
        "Сан-Хосе",
        "Сана",
        "Санто-Доминго",
        "Сантьяго",
        "Сараево",
        "Сент-Джонс",
        "Сент-Джорджес",
        "Сеул",
        "Сингапур",
        "Скопье",
        "София",
        "Стокгольм",
        "Сува",
        "Сукре",
        "Сухум",
        "Таллин",
        "Ташкент",
        "Тбилиси",
        "Тегеран",
        "Тегусигальпа",
        "Тирана",
        "Токио",
        "Триполи",
        "Тунис",
        "Тхимпху",
        "Уагадугу",
        "Улан-Батор",
        "Фритаун",
        "Фунафути",
        "Ханой",
        "Хараре",
        "Хартум",
        "Хельсинки",
        "Хониара",
        "Цхинвал",
        "Эль-Кувейт",
        "Эр-Рияд",
        "Южная Тарава",
        "Ямусукро",
        "Яунде"
    ]
    
    
    
    
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
    
    func newGame() {
        mainMenuStack.isHidden = false
        GameStack.isHidden = true
    }
    
    
    func newRound() {
        
        guard !listOfWords.isEmpty else {
            enableButtons(false)
            updateUI()
            return
        }
        let newWord = listOfWords.removeFirst()
        currentGame = Game(guessWord: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
        enableButtons(true)
    }
    
    func startNewGame(gameType: Int) {
        mainMenuStack.isHidden = true
        GameStack.isHidden = false
        
        switch gameType {
        case 1: listOfWords = listOfCountries.shuffled()
        case 2: listOfWords = listOfCities.shuffled()
        default: listOfWords = listOfCountries.shuffled()
        }
        
        newRound()
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
        newGame()
    }
    
    
    
    // MARK: - IB Actions
    
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        
        sender.isEnabled = false
        let touchedLetter = sender.title(for: .normal)!
        currentGame.playerChoose(letter: Character(touchedLetter))
        updateState()
    }
    
    @IBAction func newGameButtonPressed(_ sender: UIButton) {
        
        totalWins = 0;
        totalLosts = 0;
        
        newGame()
    }
    
    @IBAction func mainMenuButtonPressed(_ sender: UIButton) {
        startNewGame(gameType: sender.tag)
    }
}

