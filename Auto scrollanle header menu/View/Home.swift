//
//  SwiftUIView.swift
//  Auto scrollanle header menu
//
//  Created by George Kakarlis on 24/10/21.
//

import SwiftUI

struct Home: View {
    
    // current tab
    @State var currentTab = ""
    @Namespace var animation
    
    @Environment(\.colorScheme) var scheme
    
    
    var body: some View {
        
        VStack(spacing :0) {
            
            
            VStack {
                
            
            HStack(spacing: 15){
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                }
                Text("George's Gelateria")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                    
                    ScrollViewReader{proxy in
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 30){
                                
                                ForEach(tabsItems){tab in
                                    
                                    VStack{
                                        
                                        Text(tab.tab)
                                            .foregroundColor(currentTab == tab.id ? .black : .gray)
                                        
                                        //for matched geometry effect..
                                        if currentTab == tab.id {
                                            Capsule()
                                                .fill(.black)
                                                .frame(height: 3)
                                                .padding(.horizontal,-10)
                                        }
                                        else {
                                            Capsule()
                                                .fill(.clear)
                                                .matchedGeometryEffect(id: "TAB", in: animation)
                                                .frame(height: 3)
                                                .padding(.horizontal,-10)
                                        }
                                        .onTapGesture{
                                            withAnimation(.easeInOut){
                                                currentTab = tab.id
                                                proxy.scrollTo(currentTab, anchor: .topTrailing)
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal, 30)
                            }
                        }
                        
                    }
                    .padding(.top )
                }
                .padding([.top])
                //divider...
                background(scheme == .dark ? Color.black : Color.white)
                    .overlay(
                        Divider()
                            .padding(.horizontal, -15)
                        ,alignment: .bottom
                    )
                
                
                ScrollView(.vertical,showsIndicators: false){
                    //scroll view reader to scroll the content...
                    ScrollViewReader{proxy in
                        
                        VStack(spacing: 15) {
                            
                            ForEach(tabsItems){tab in
                                
                                //Menu card view
                                MenuCardView(tab: tab)
                                    .padding(.top)
                            }
                        }
                        .padding([.horizontal, .bottom])
                        .onChange(of: currentTab) { newValue in
                            
                            //scrolling to content...
                            withAnimation(.easeInOut){
                                proxy.scrollTo(currentTab, anchor: .topTrailing )
                            }
                        }
                    }
                }
                    //setting coordinate space name for offset...
                .coordinateSpace(name: "SCROLL")
                
            }
        
            // setting first tab...
            .onAppear {
                currentTab = tabsItems.first?.id ?? ""
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

    struct MenuCardView: View{
        var tab: Tab
        
        var body: some View{
            
            VStack(alignment: .leading, spacing: 20) {
                Text(tab.tab)
                    .font(.title.bold())
                    .padding(.vertical)
                
                ForEach(tab.foods){food in
                    
                    //food view...
                    HStack(spacing: 15){
                        
                        VStack(alignment: .leading, spacing: 10){
                            Text(food.title)
                                .font(.title3.bold())
                            Text(food.description)
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text("Price: \(food.price)")
                                .fontWeight(.bold)
                            
                            Divider()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(food.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .cornerRadius(10)
                    }
                }
            }
            //setting id for scroll view reader...
            .id(tab.id)
        }
    }
}
}
