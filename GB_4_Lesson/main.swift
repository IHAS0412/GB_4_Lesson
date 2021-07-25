//
//  main.swift
//  GB_4_Lesson
//
//  Created by Oksana on 25.07.2021.
//

import Foundation

enum Transmission {
    case auto, manual
}
enum StateEngine: String{
    case start, stop
}
enum StateWindows {
    case open, close
}
enum StateDoors {
    case open, closed
}

class Car {
    var brand: String
    var reliseYear: Int
    var producingCountry: String
    var km: Int
    var transmission: Transmission
    var stateEngine: StateEngine
    var engineVolume: Double
    var enginePower: Double
    var stateWindows: StateWindows
    var stateDoors: StateDoors

    
    init(brand: String, reliseYear: Int, producingCountry: String, km: Int, transmission: Transmission, stateEngine: StateEngine, engineVolume: Double, enginePower: Double, stateWindows: StateWindows, stateDoors: StateDoors) {
        self.brand = brand
        self.reliseYear = reliseYear
        self.producingCountry = producingCountry
        self.km = km
        self.transmission = transmission
        self.stateEngine = stateEngine
        self.engineVolume = engineVolume
        self.enginePower = enginePower
        self.stateWindows = stateWindows
        self.stateDoors = stateDoors
    }

    func typeTransmission(to: Transmission) {}
    func changeStatusEngine(to: StateEngine) {}
    func changeStatusWindow(to: StateWindows) {}
    func changeStatusDoor(to: StateDoors) {}
}

class SportCar: Car {
    
    var stateAlarm: StateAlarm
    enum StateAlarm {
        case off, on
    }
    
    init(brand: String, reliseYear: Int, producingCountry: String, km: Int, transmission: Transmission, stateEngine: StateEngine, engineVolume: Double, enginePower: Double, stateWindows: StateWindows, stateDoors: StateDoors, stateAlarm: StateAlarm) {

        self.stateAlarm = stateAlarm
        
        super.init(brand: brand, reliseYear: reliseYear, producingCountry: producingCountry, km: km, transmission: transmission, stateEngine: stateEngine, engineVolume: engineVolume, enginePower: enginePower, stateWindows: stateWindows, stateDoors: stateDoors)
        }

    func carMusic() -> String {
        if (stateAlarm == .off && stateEngine == .start) {
            return("работает")
        } else {
            return("не работает")
        }
    }
    
    func changeStateAlarm(to: StateAlarm) {
        stateAlarm = to
    }
    override func typeTransmission(to: Transmission) {
        transmission = to
    }
    override func changeStatusEngine(to: StateEngine) {
        stateEngine = to
    }
    override func changeStatusWindow(to: StateWindows) {
        stateWindows = to
    }
    override func changeStatusDoor(to: StateDoors) {
        stateDoors = to
    }
}

class TrunkCar: Car {
    
    var stateTrunk: StateTrunk
    
    enum StateTrunk {
        case full, empty
    }
    
    init(brand: String, reliseYear: Int, producingCountry: String, km: Int, transmission: Transmission, stateEngine: StateEngine, engineVolume: Double, enginePower: Double, stateWindows: StateWindows, stateDoors: StateDoors, stateTrunk: StateTrunk) {

        self.stateTrunk = stateTrunk
        
        super.init(brand: brand, reliseYear: reliseYear, producingCountry: producingCountry, km: km, transmission: transmission, stateEngine: stateEngine, engineVolume: engineVolume, enginePower: enginePower, stateWindows: stateWindows, stateDoors: stateDoors)
        }

    func changeStateTrunk(to: StateTrunk) {
        stateTrunk = to
    }
    override func typeTransmission(to: Transmission) {
        transmission = to
    }
    override func changeStatusEngine(to: StateEngine) {
        stateEngine = to
    }
    override func changeStatusWindow(to: StateWindows) {
        stateWindows = to
    }
    override func changeStatusDoor(to: StateDoors) {
        stateDoors = to
    }
}
 
let carSport1 = SportCar (brand: "Dodge",
                 reliseYear: 2007,
                 producingCountry: "USA",
                 km: 150,
                 transmission: .manual,
                 stateEngine: .start,
                 engineVolume: 8.4,
                 enginePower: 608,
                 stateWindows: .open,
                 stateDoors: .open,
                 stateAlarm: .off)

let carSport2 = SportCar (brand: "Nissan GT-R",
                 reliseYear: 2020,
                 producingCountry: "Japan",
                 km: 80,
                 transmission: .auto,
                 stateEngine: .stop,
                 engineVolume: 3.8,
                 enginePower: 570,
                 stateWindows: .close,
                 stateDoors: .closed,
                 stateAlarm: .on)


let carTrunk1 = TrunkCar (brand: "Renault Kerax",
                 reliseYear: 2019,
                 producingCountry: "France",
                 km: 96,
                 transmission: .auto,
                 stateEngine: .stop,
                 engineVolume: 10.8,
                 enginePower: 379,
                 stateWindows: .close,
                 stateDoors: .open,
                 stateTrunk: .empty)

let carTrunk2 = TrunkCar (brand: "MAN 14.232",
                 reliseYear: 2007,
                 producingCountry: "USA",
                 km: 150,
                 transmission: .auto,
                 stateEngine: .start,
                 engineVolume: 15.2,
                 enginePower: 340,
                 stateWindows: .open,
                 stateDoors: .closed,
                 stateTrunk: .full)

print("""
    ______________________________________________
    Автомобиль: \(carSport1.brand), \(carSport1.reliseYear) года выпуска
    Страна производитель: \(carSport1.producingCountry)
    Пробег: \(carSport1.km) тыс.км
    Коробка передач \(carSport1.transmission)
    Двигатель \(carSport1.engineVolume) л, \(carSport1.enginePower) л.с.
    Готовность автомобиля к эксплуатации:
    Двигатель: \(carSport1.stateEngine == .start ? "включен" : "выключен")
    Окна: \(carSport1.stateWindows == .open ? "открыты" : "закрыты")
    Двери: \(carSport1.stateDoors == .open ? "открыты" : "закрыты")
    Сигнализация: \(carSport1.stateAlarm == .off ? "отключена" : "включена")
    Аудиосистема: \(carSport1.carMusic())
    """)
    
print("""
    ______________________________________________
    Автомобиль: \(carSport2.brand), \(carSport2.reliseYear) года выпуска
    Страна производитель: \(carSport2.producingCountry)
    Пробег: \(carSport2.km) тыс.км
    Коробка передач \(carSport2.transmission)
    Двигатель \(carSport2.engineVolume) л, \(carSport2.enginePower) л.с.
    Готовность автомобиля к эксплуатации:
    Двигатель: \(carSport2.stateEngine == .start ? "включен" : "выключен")
    Окна: \(carSport2.stateWindows == .open ? "открыты" : "закрыты")
    Двери: \(carSport2.stateDoors == .open ? "открыты" : "закрыты")
    Сигнализация: \(carSport2.stateAlarm == .off ? "отключена" : "включена")
    Аудиосистема: \(carSport2.carMusic())
    """)

print("""
    ______________________________________________
    Автомобиль: \(carTrunk1.brand), \(carTrunk1.reliseYear) года выпуска
    Страна производитель: \(carTrunk1.producingCountry)
    Пробег: \(carTrunk1.km) тыс.км
    Коробка передач \(carTrunk1.transmission)
    Двигатель \(carTrunk1.engineVolume) л, \(carTrunk1.enginePower) л.с.
    Готовность автомобиля к эксплуатации:
    Двигатель: \(carTrunk1.stateEngine == .start ? "включен" : "выключен")
    Окна: \(carTrunk1.stateWindows == .open ? "открыты" : "закрыты")
    Двери: \(carTrunk1.stateDoors == .open ? "открыты" : "закрыты")
    Загруженность кузова: \(carTrunk1.stateTrunk == .full ? "пустой" : "полный" )
    """)

print("""
    ______________________________________________
    Автомобиль: \(carTrunk2.brand), \(carTrunk2.reliseYear) года выпуска
    Страна производитель: \(carTrunk2.producingCountry)
    Пробег: \(carTrunk2.km) тыс.км
    Коробка передач \(carTrunk2.transmission)
    Двигатель \(carTrunk2.engineVolume) л, \(carTrunk2.enginePower) л.с.
    Готовность автомобиля к эксплуатации:
    Двигатель: \(carTrunk2.stateEngine == .start ? "включен" : "выключен")
    Окна: \(carTrunk2.stateWindows == .open ? "открыты" : "закрыты")
    Двери: \(carTrunk2.stateDoors == .open ? "открыты" : "закрыты")
    Загруженность кузова: \(carTrunk2.stateTrunk == .full ? "пустой" : "полный" )
    """)

carSport1.reliseYear = 2021
carTrunk1.km = 30
carSport1.changeStatusEngine(to: .stop)
carSport1.changeStatusWindow(to: .close)
carSport1.changeStateAlarm(to: .on)

carSport2.transmission = .manual
carSport2.changeStatusEngine(to: .start)
carSport2.changeStatusDoor(to: .open)
carSport1.changeStateAlarm(to: .off)

carTrunk1.km = 200
carTrunk1.engineVolume = 15.3
carTrunk1.changeStatusWindow(to: .open)
carTrunk1.changeStateTrunk(to: .full)

carTrunk2.reliseYear = 2001
carTrunk2.transmission = .manual
carTrunk2.changeStatusWindow(to: .close)
carTrunk2.changeStatusDoor(to: .open)


