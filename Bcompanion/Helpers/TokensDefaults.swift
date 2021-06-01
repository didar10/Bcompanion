//
//  TokensDefaults.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 6/1/21.
//

import Foundation

struct TokensDefaults {
    static let (accessTokenKey) = ("accessToken")
    static let tokensSessionKey = "com.tokens.usersession"
    private static let userDefault = UserDefaults.standard
    
    struct TokenDetails {
        let accessToken: String
        
        init(_ json: [String: String]) {
            self.accessToken = json[accessTokenKey] ?? ""
        }
    }
    
    static func save(access: String){
        userDefault.set([accessTokenKey: access],
                        forKey: tokensSessionKey)
        print("Tokens saved in user defaults")
    }
    
    
    static func getTokens()-> TokenDetails {
        return TokenDetails((userDefault.value(forKey: tokensSessionKey) as? [String: String]) ?? [:])
    }
    
    static func clearTokensData(){
        userDefault.removeObject(forKey: tokensSessionKey)
        print("Tokens deleted from user defaults")
    }
    
}
