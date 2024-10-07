//
//  HomeView.swift
//  IOS_WorkShopSwiftUI
//
//  Created by wicked on 07.10.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            List(Language.listOfLangages , id:\.id){
                language in  LanguageItemView(language:     language)
                    .overlay(
                        NavigationLink(
                            destination: LanguageDescriptionView(language: language),
                            label: {EmptyView()}
                        ).opacity(0)
                    )
            }.listStyle(PlainListStyle()).navigationTitle("Languages")
        }
    }
}
struct LanguageItemView: View {
    let language : Language
    var body: some View {
        ZStack {
            Color.white.cornerRadius(8)
            
            HStack{
                image
                info
            }.padding()
        }.shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 6,x: 0,y:2)
    }}
private extension LanguageItemView{
    var image : some View{
        
        Image(language.image)
            .resizable()
            .scaledToFit().frame(width: 50,height: 50 )
    }
    var info : some View{
        VStack(alignment: .leading, spacing: 5 ) {
            
            Text(language.name)
                .font(.headline)
                .lineLimit(2)
            Text(language.description)
                .font(.subheadline)
                .lineLimit(2)
        }
    }
}

#Preview {
    HomeView()
}
