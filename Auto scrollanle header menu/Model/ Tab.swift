//
//   Tab.swift
//  Auto scrollanle header menu
//
//  Created by George Kakarlis on 24/10/21.
//

import SwiftUI

struct Food: Identifiable {
    var id = UUID().uuidString
    var title: String
    var description: String
    var price: String
    var image: String
}

var foods = [

    Food(title: "capuccino", description: "An original Italian Coffee made with love", price: "$12", image: "drink2"),
    Food(title: "pizza", description: "A delightful experience when it comes to pure Italian food.", price: "$20", image: "food1"),
    Food(title: "cookies", description: "I wonder who dislikes cookies with milk", price: "$2", image: "$2"),
    Food(title: "waffle", description: "Original Belgian Waffles made with lots of love", price: "$23", image: "hero2"),
    Food(title: "Caramel Ice Cream", description: "Original Italian Ice Cream made with lots of milk", price: "$23", image: "icecream1"),
    Food(title: "Ice Cream", description: "You cant resist in Bubblegum Ice Cream, YES you cant!", price: "$23", image: "icecream5"),
]

//tab model
struct Tab: Identifiable {
    
    var id = UUID().uuidString
    var tab = String
    var foods = [Food]
}

//Tab items...

var tabsItems = [

    Tab(tab: "Home Style", foods: foods.shuffled()),
    Tab(tab: "Promotions", foods: foods.shuffled()),
    Tab(tab: "Snacks", foods: foods.shuffled()),
    Tab(tab: "Traditional", foods: foods.shuffled()),
    
]
