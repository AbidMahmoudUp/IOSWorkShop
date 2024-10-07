//
//  ContentView.swift
//  IOS_WorkShopSwiftUI
//
//  Created by wicked on 07.10.24.
//

import SwiftUI

struct LanguageDescriptionView: View {
    var language:Language
    @State private var isLearned = false
    var body: some View {
        VStack {
            Image(language.image)
                .resizable()
                .scaledToFit()
                .frame(height: 200.0)
            Text(language.name).font(.title).fontWeight(.bold).foregroundColor(Color.black).padding(.all)
            Text(language.description)
            Spacer()
            Button(isLearned ?"Learned":"NotLearned Yet" ){
                isLearned.toggle()
            }.buttonStyle(.borderedProminent).tint(Color(.red))
        }.padding()
        
    }
}

#Preview {
    LanguageDescriptionView(language: Language.listOfLangages[2])
}
