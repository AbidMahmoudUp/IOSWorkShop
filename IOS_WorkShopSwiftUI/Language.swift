//
//  Language.swift
//  IOS_WorkShopSwiftUI
//
//  Created by wicked on 07.10.24.
//

import Foundation
struct Language:Identifiable{
    
    let id = UUID()
    
    let name:String
    
    let description : String
    
    let image : String
    
}
extension Language {
    
    static let listOfLangages:[Language] = [
        
        Language(name:"Kotlin",description:"Android Programming Language",image:"kotlin"),
        Language(name:"Swift",description:"IOS Programming Language",image:"swift"),
        Language(name:"Dart",description:"Cross Paltform Programming Language",image:"Dart"),
    ]
}
