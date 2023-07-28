//
//  LoginRequest.swift
//  LoginAPI
//
//  Created by Avinash Kumar on 28/07/23.
//

import Foundation

struct LoginRequest: Encodable {
    let userEmail, userPassword: String
}

