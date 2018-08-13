//: Playground - noun: a place where people can play

import UIKit

extension String{
    var isValidEmail: Bool{
        let emailFormat = "[A-Z0-9a-z,_%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
}

enum LoginError: Error{
    case informationIncompletion
    case invalidEmail
    case invalidPassword
}

func login() throws {
    let email = "email@gmail.com"
    let password = "1238111"
    
    if email.isEmpty || password.isEmpty{
        throw LoginError.informationIncompletion
    }else if !email.isValidEmail{
        throw LoginError.invalidEmail
    }else if password.count < 5 {
        throw LoginError.invalidPassword
    }
}

do {
    try login()
    print("successfully login")
}catch let loginErr {
    print(loginErr)
}

//do {
//    try login()
//    print(123)
//}catch LoginError.informationIncompletion{
//    print("information imcompletion")
//}catch LoginError.invalidEmail{
//    print("invalid email")
//}catch LoginError.invalidPassword{
//    print("invalid password")
//}catch let error{
//    print("other error", error)
//}







