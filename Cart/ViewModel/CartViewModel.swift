//
//  CartViewModel.swift
//  Cart
//
//  Created by TekHeist
//

import SwiftUI

class CartViewModel: ObservableObject {
    @Published var items = [
        Item(name: "Tek Product 1", details: "Gift", image: "tek1", price: 10.00, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Tek Product 2", details: "Gift", image: "tek2", price: 90.99, quantity: 2, offset: 0, isSwiped: false),
        Item(name: "Tek Product 3", details: "Gift", image: "tek3", price: 100.00, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Tek Product 4", details: "Royal", image: "tek4", price: 50.00, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Tek Product 5", details: "Royal", image: "tek5", price: 100.00, quantity: 1, offset: 0, isSwiped: false)
    ]
}
