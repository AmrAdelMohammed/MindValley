//
//  ContentView.swift
//  MindValleyTask
//
//  Created by Amr on 29/01/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @ObservedObject private var viewModel: HomeVM
    
    init(viewModel: HomeVM = HomeVM()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        ScrollView {
            HStack {
                Text("Channels")
                    .font(.custom("Roboto-Black", size: 30.0)).fontWeight(.bold).foregroundColor(Color(UIColor(named: "headlineColor")!)).lineLimit(nil).padding([.top, .trailing], 50.0)
                Spacer()
            }
            .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top)
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
                        //                        let newEpisodes =
                        ForEach(viewModel.newEpisodes) { episode in
                            VStack {
                                WebImage(url: URL(string: episode.coverAsset?.url ?? "")).onSuccess { image, data, cacheType in
                                    // Success
                                    // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                                }
                                .resizable()
                                .indicator(.activity) // Activity Indicator
                                .transition(.fade(duration: 1)) // Fade Transition with duration
                                .padding([.top, .leading, .trailing],0)
                                .frame(width: UIScreen.main.bounds.width * 0.4, height: 228)
                                .mask(RoundedRectangle(cornerRadius: 8))
                                HStack {
                                    Text(episode.title ?? "")
                                        .font(.custom("Roboto-Regular", size: 17.0)).foregroundColor(Color(UIColor(named: "appWhite")!)).multilineTextAlignment(.leading).padding([.top, .leading, .trailing], 0.0)
                                    Spacer()
                                }
                                .padding(.top, 10.0)
                                HStack {
                                    Text(episode.channel?.title ?? "")
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
                ForEach(viewModel.channels) { channel in
                    ChannelsView(channel: channel)
            
                    Rectangle()
                        .padding(.horizontal, 0.0)
                        .frame(height: 1.0)
                        .foregroundColor(Color("devidorColor"))
                }
                
                
                
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.categories) { category in
                        //                        HStack {
                        //                            Spacer()
                        Text(category.name ?? "")
                            .font(.custom("Roboto-Black", size: 17.0)).foregroundColor(Color(UIColor(named: "channelFontColor")!)).padding(.all, 0.0).frame(width: UIScreen.main.bounds.width * 0.4, height: 60.0).foregroundColor(Color("devidorColor")).background(Color("categoryColor")).mask(RoundedRectangle(cornerRadius: 30))
                        //                            Spacer()
                        //                        }.frame(height: 60.0).foregroundColor(Color("devidorColor"))
                        
                        
                    }
                    
                }
                .padding([.top, .leading], 10.0)
            }
            .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top )
            .padding(.top, 6.0)
            
        }.padding(.leading, 20.0).padding([.top, .bottom, .trailing], 0.0) .background(Color(UIColor(named: "appBackgroundColor")!)).edgesIgnoringSafeArea(.all)
        
        
    }
    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}

struct ChannelsView: View{
    var channel: Channel
    var body: some View {
        HStack {
            
            HStack {
                AnimatedImage(url: URL(string:channel.iconAsset?.url ?? ""))
                    .resizable()
                    .placeholder {
                        Rectangle().foregroundColor(.gray)
                    }
                    .playbackMode(.bounce)// Activity Indicator
                    .padding([.top, .leading, .trailing], 0.0)
                    .transition(.fade(duration: 1))
                    .frame(width: 50, height: 50)
                    .mask(RoundedRectangle(cornerRadius: 25))
                
                VStack{
                    HStack {
                        Text(channel.title ?? "")
                            .font(.custom("Roboto-Regular", size: 20.0)).foregroundColor(Color(UIColor(named: "appWhite")!)).multilineTextAlignment(.leading).padding(.all, 0.0)
                        Spacer()
                    }
                    .padding(.top, 10.0)
                    .padding([.leading, .bottom, .trailing], 0.0)
                    HStack {
                        Text("\(channel.mediaCount ?? 0)")
                            .font(.custom("Roboto-Black", size: 16.0)).foregroundColor(Color(UIColor(named: "channelFontColor")!)).multilineTextAlignment(.leading).padding([.leading, .bottom, .trailing], 0.0).padding(.top,8.0)
                        Spacer()
                    }
                }
                .padding(.all, 10.0)
            }
            
        }
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                if (channel.series?.count ?? 0) > 0{
                    ForEach(channel.series ?? []) { series in
                        WebImage(url: URL(string: series.coverAsset?.url ?? "")).onSuccess { image, data, cacheType in
                            
                        }
                        .resizable()
                        .indicator(.activity) // Activity Indicator
                        .transition(.fade(duration: 1)) // Fade Transition with duration
                        .padding([.top, .leading, .trailing],0)
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 228)
                        .mask(RoundedRectangle(cornerRadius: 8))
                        HStack {
                            Text(series.title ?? "")
                                .font(.custom("Roboto-Regular", size: 17.0)).foregroundColor(Color(UIColor(named: "appWhite")!)).multilineTextAlignment(.leading).padding([.top, .leading, .trailing], 0.0)
                            Spacer()
                        }
                        .padding(.top, 10.0)
                    }
                }else{
                    ForEach(channel.latestMedia ?? []) { media in
                        VStack {
                            WebImage(url: URL(string: media.coverAsset?.url ?? "")).onSuccess { image, data, cacheType in
                                // Success
                                // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                            }
                            .resizable()
                            .indicator(.activity) // Activity Indicator
                            .transition(.fade(duration: 1)) // Fade Transition with duration
                            .padding([.top, .leading, .trailing],0)
                            .frame(width: UIScreen.main.bounds.width * 0.4, height: 228)
                            .mask(RoundedRectangle(cornerRadius: 8))
                            HStack {
                                Text(media.title ?? "")
                                    .font(.custom("Roboto-Regular", size: 17.0)).foregroundColor(Color(UIColor(named: "appWhite")!)).multilineTextAlignment(.leading).padding(.all, 0.0)
                                Spacer()
                            }
                            .padding(.top, 10.0).padding([.top, .leading, .trailing], 0.0)
                        }.frame(width: UIScreen.main.bounds.width * 0.45)
                        .padding(.all, 0.0)
                    }
                }
            }
        }
    }
}
