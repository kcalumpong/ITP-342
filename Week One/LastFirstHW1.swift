import UIKit

//Section 1
func add(num1: Int, num2: Int) -> Int {
    return num1 + num2
}
add(num1: 1, num2: 2)

func divide(num1: Double, num2: Double) -> Double {
    return num1 / num2
}
divide(num1: 1.0, num2: 2.0)

func grade(score: Float) -> String? {
    switch score {
    case 0..<59:
        return "F"
    case 60..<64:
        return "D-"
    case 65..<69:
        return "D"
    case 70..<74:
        return "C-"
    case 75..<79:
        return "C"
    case 80..<84:
        return "B-"
    case 85..<89:
        return "B"
    case 90..<94:
        return "A-"
    case 95..<100:
        return "A"
    default:
        return nil
    }
}
grade(score: 95) // "A"
grade(score: 70.2) // "C-"
grade(score: -50) //  nil

func numberOfOcurrences(word: String, letter: Character) -> Int {
    var count: Int = 0
    for w in word {
        if w.lowercased() == letter.lowercased() {
            count += 1
        }
    }
    return count
}
numberOfOcurrences(word: "banana", letter: "a")
numberOfOcurrences(word: "banana", letter: "A")
numberOfOcurrences(word: "BANANA", letter: "a")

//Section 2
struct User {
    var name: String
    var email: String
}
let amy = User(name: "Amy", email: "amy@usc.edu")
amy.name
amy.email

//Section 3
func printValue(value: String?) {
    if let value {
        print(value)
    }else {
      print("No Value")
    }
}
printValue(value: "Testing")
printValue(value: nil)

func printUser(user: User?) {
    if let user {
        "Name: \(user.name), Email \(user.email)"
    }
}
printUser(user: amy)
printUser(user: nil)

//Section 4
extension String {
    var isValidEmail: Bool {
        let regex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let pred = NSPredicate(format:"SELF MATCHES %@", regex)
        return pred.evaluate(with: self)
    }
}
"hello".isValidEmail
"hello@usc.edu".isValidEmail

//Section 5
protocol Greetable {
    func greet() -> String
}

//Section 6
@propertyWrapper
struct ValidEmail {
    var value: String = ""
    
    var wrappedValue: String {
        get {
            return value
        }
        set {
            if newValue.isValidEmail {
                value = newValue
            }
        }
    }
}

//Section 7
class Student: Greetable {
    let name: String
    @ValidEmail var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    func greet() -> String {
        "Hello my name is \(name)"
    }
}

let kristina = Student(name: "Kristina", email: "Not an email")
kristina.email
kristina.email = "kcalumpong@gmail.com"
kristina.email
kristina.email = "Not an email"
kristina.email
kristina.greet()




