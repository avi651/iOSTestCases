//
//  LoginAPIResource.swift
//  LoginAPI
//
//  Created by Avinash Kumar on 28/07/23.
//

import Foundation

struct LoginApiResource {
    
    func authenticateUser(request: LoginRequest, completionHandler: @escaping(_ result: LoginResponse?)->()) {

        let urlRequest = generateLoginUrlRequest(request: request)

        URLSession.shared.dataTask(with: urlRequest) { (responseData, serverResponse, serverError) in
            if(serverError == nil && responseData != nil){
                do {
                    let result = try JSONDecoder().decode(LoginResponse.self, from: responseData!)
                    completionHandler(result)
                } catch  {
                    debugPrint("Encoding request body failed")
                }
            }
        }.resume()
    }

    private func generateLoginUrlRequest(request: LoginRequest) -> URLRequest{
        var urlRequest = URLRequest(url: URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/User/Login")!)
        urlRequest.httpMethod = "post"

        do {
            urlRequest.httpBody = try JSONEncoder().encode(request)
        } catch  {
            debugPrint("Encoding request body failed")
        }

        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        return urlRequest
    }
}
