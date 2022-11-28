//
//  AuthenticationViewModel.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 28/11/22.
//

import Foundation

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}

struct RegistrationViewModel {
    
}
