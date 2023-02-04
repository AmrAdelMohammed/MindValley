//
//  ContentView.swift
//  MindValleyTask
//
//  Created by Amr on 29/01/2023.
//

import SwiftUI

struct HomeView: View {
    var data: [(image: String, text: String)] = [
        (image: "Image1", text: "Item 1"),
        (image: "Image2", text: "Item 2"),
        (image: "Image3", text: "Item 3"),
        (image: "Image4", text: "Item 4"),
        (image: "Image5", text: "Item 5"),
        (image: "Image6", text: "Item 6"),
        (image: "Image7", text: "Item 7"),
        (image: "Image8", text: "Item 8"),
        (image: "Image9", text: "Item 9")
//        (image: "Image10", text: "Item 10")
    ]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
    
        
        ScrollView {
            HStack {
                Text("Channels")
                    .font(.custom("Roboto-Black", size: 30.0)).fontWeight(.bold).foregroundColor(Color(UIColor(named: "headlineColor")!)).lineLimit(nil)
                Spacer()
            }
            .padding(.top, 50.0)
            .frame(height: 0.0)
            VStack(alignment: .leading) {
                HStack {
                    Text("New Episodes")
                        .font(.custom("Roboto-Black", size: 20.0)).foregroundColor(Color(UIColor(named: "channelFontColor")!))
                    Spacer()
                }
                .padding(.top, 0.0)
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(data.indices) { index in
                            VStack {
                                Image(data[index].image)
                                    .resizable()
                                    .padding(.all,0)
                                    .frame(width: UIScreen.main.bounds.width * 0.4, height: 228)
                                    .mask(RoundedRectangle(cornerRadius: 8))
                                HStack {
                                    Text(data[index].text)
                                        .font(.custom("Roboto-Regular", size: 17.0)).foregroundColor(Color(UIColor(named: "appWhite")!)).multilineTextAlignment(.leading).padding([.top, .leading, .trailing], 0.0)
                                    Spacer()
                                }
                                HStack {
                                    Text("New Episodes")
                                        .font(.custom("Roboto-Black", size: 13.0)).foregroundColor(Color(UIColor(named: "channelFontColor")!)).multilineTextAlignment(.leading).padding([.leading, .bottom, .trailing], 0.0).padding(.top,8.0)
                                    Spacer()
                                }
                            }.frame(width: UIScreen.main.bounds.width * 0.45)
                        }
                    }
                }
                Rectangle()
                    .padding(.horizontal, 0.0)
                    .frame(height: 1.0)
                    .foregroundColor(Color("devidorColor"))
                HStack {
                    Text("List 2")
                        .font(.custom("Roboto-Black", size: 20.0)).foregroundColor(Color(UIColor(named: "channelFontColor")!))
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(data.indices) { index in
                            VStack {
                                Image(data[index].image)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                Text(data[index].text)
                                    .font(.headline)
                            }
                        }
                    }
                }
                Rectangle()
                    .padding(.horizontal, 0.0)
                    .frame(height: 1.0)
                    .foregroundColor(Color("devidorColor"))
                
//                    QGrid(data.text, columns: 2) { GridCell(person: $0) }
                
                LazyVGrid(columns: columns) {
                    ForEach(data.indices) { i in
//                        HStack {
//                            Spacer()
                            Text(data[i].text)
                            .font(.custom("Roboto-Black", size: 17.0)).foregroundColor(Color(UIColor(named: "channelFontColor")!)).padding(.all, 0.0).frame(width: UIScreen.main.bounds.width * 0.4, height: 60.0).foregroundColor(Color("devidorColor")).background(Color("categoryColor")).mask(RoundedRectangle(cornerRadius: 30))
//                            Spacer()
//                        }.frame(height: 60.0).foregroundColor(Color("devidorColor"))

                           
                    }

                }
                .padding([.top, .leading], 10.0)
            }
            .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top )
            .padding(.top, 6.0)
           
        }.padding(.leading, 20.0) .background(Color(UIColor(named: "appBackgroundColor")!))
    }

    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
