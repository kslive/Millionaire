//
//  Questions.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import Foundation

enum Questions {
    static let questionOne = "Кто из президентов США написал свой собственный рассказ про Шерлока Холмса?"
    static let questionTwo = "Какую пошлину ввели в XII  веке в Англии для того чтобы заставить мужчин пойти на войну?"
    static let questionThree = "Откуда пошло выражение «деньги не пахнут?"
    static let questionFour = "Туристы, приезжающие на Майорку, обязаны заплатить налог…"
    static let questionFive = "Основой для «Сказки о рыбаке и рыбке Пушкина послужила сказка братьев Гримм «Рыбак и его жена». В ней немецкая «коллега» нашей старухи превратилась в:"
}

enum Answer {
    enum QuestionOne {
        static let a = "Джон Кеннеди"
        static let b = "Франклин Рузвельт" // true
        static let c = "Рональд Рейган"
        static let d = "Никто"
    }
    
    enum QuestionTwo {
        static let a = "Налог на тунеядство"
        static let b = "Налог на трусость" // true
        static let c = "Налог на отсутствие сапог"
        static let d = "Налог на алкоголь"
    }
    
    enum QuestionThree {
        static let a = "От подателей за провоз парфюмерии"
        static let b = "От сборов за не стиранные носки"
        static let c = "От налога на туалеты" // true
        static let d = "От женщин легкого поведения"
    }
    
    enum QuestionFour {
        static let a = "На плавки"
        static let b = "На пальмы"
        static let c = "На солнце" // true
        static let d = "На жизнь"
    }
    
    enum QuestionFive {
        static let a = "Папу Римского" // true
        static let b = "Королеву"
        static let c = "Директора рыбзавода"
        static let d = "Командира отряда водолазов"
    }
}
