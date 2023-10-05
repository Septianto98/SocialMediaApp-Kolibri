//
//  TabBar.swift
//  Kolibriapp
//
//  Created by Brontosaurus on 01/09/23.
//

import SwiftUI

struct TabBar: View {
    @State private var currentTab = Tab.Home
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack (spacing: 0.0) {
            TabView(selection: $currentTab) {
                HomeView()
                    .tag(Tab.Home)
                
                Text("Explore")
                    .tag(Tab.Explore)
                
                Text("Add Thread")
                    .tag(Tab.addthread)
                
                Text("Direct Message")
                    .tag(Tab.Message)
                
                ProfileView()
                    .tag(Tab.Profile)
            }
            .shadow(radius: 4,y: -4)
            
            HStack {
                ForEach(Tab.allCases, id: \.self){ tab in
                    Button {
                        currentTab = tab
                    } label: {
                        if tab == .addthread{
                            Image(tab.rawValue)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 46, height: 46)
                        } else {
                            VStack{
                                Image(tab.rawValue)
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 32, height: 32)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(currentTab == tab ? Color("font") : Color.black.opacity(0.3))
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            .padding(.top, 10)
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
