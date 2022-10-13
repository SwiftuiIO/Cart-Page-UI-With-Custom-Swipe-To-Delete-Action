//
//  CartView.swift
//  Cart
//
//  Created by Swiftuiio.com
//

import SwiftUI

struct CartView: View {
    @StateObject var cartData = CartViewModel()
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(.black)
                }
                
                Text("My cart")
                    //.font(.title2)
                    .fontWeight(.heavy)
                    .font(.custom("Jost-Bold", size: 28))
                
        
                Spacer()
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(cartData.items){ item in
                        // ItemView
                        ItemView(item: $cartData.items[getIndex(item: item)], items: $cartData.items)
                    }
                }
            }
            
            // Bottom View
            VStack {
                HStack {
                    Text("Total")
                        .fontWeight(.heavy)
                        .font(.custom("Jost-Bold", size: 28))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    // Calculating Total Price
                    Text(calculateTotalPrice())
                       // .font(.title)
                        .fontWeight(.heavy)
                        .font(.custom("Jost-Bold", size: 28))
                        .foregroundColor(.black)
                }
                .padding([.top, .horizontal])
                
                Button(action: {}) {
                    Text("Check out")
                        //.font(.title2)
                        .fontWeight(.heavy)
                        .font(.custom("Jost-Bold", size: 28))
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(
                            LinearGradient(gradient: .init(colors: [Color("lightblue"), Color("blue")]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(15)
                }
            }
        }
        .background(Color("gray").ignoresSafeArea())
    }
    
    func getIndex(item: Item) -> Int {
        return cartData.items.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    func calculateTotalPrice() -> String {
        var price: Float = 0
        
        cartData.items.forEach { (item) in
            price += Float(item.quantity) * item.price
        }
        
        return getPrice(value: price)
    }
}
