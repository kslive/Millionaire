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
        static let a = ["Джон Кеннеди": false]
        static let b = ["Франклин Рузвельт / true": true]
        static let c = ["Рональд Рейган": false]
        static let d = ["Никто": false]
    }
    
    enum QuestionTwo {
        static let a = ["Налог на тунеядство": false]
        static let b = ["Налог на трусость / true": true]
        static let c = ["Налог на отсутствие сапог": false]
        static let d = ["Налог на алкоголь": false]
    }
    
    enum QuestionThree {
        static let a = ["От подателей за провоз парфюмерии": false]
        static let b = ["От сборов за не стиранные носки": false]
        static let c = ["От налога на туалеты / true": true]
        static let d = ["От женщин легкого поведения": false]
    }
    
    enum QuestionFour {
        static let a = ["На плавки": false]
        static let b = ["На пальмы": false]
        static let c = ["На солнце / true": true]
        static let d = ["На жизнь": false]
    }
    
    enum QuestionFive {
        static let a = ["Папу Римского / true": true]
        static let b = ["Королеву": false]
        static let c = ["Директора рыбзавода": false]
        static let d = ["Командира отряда водолазов": false]
    }
}
