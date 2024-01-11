//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Brashan Mohanakumar on 2023-11-29.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("name", text: $order.name)
                    TextField("Street Address", text: $order.streetAddress)
                    TextField("City", text: $order.city)
                    TextField("Zip", text: $order.zip)
                }
                Section {
                    NavigationLink("Checkout") {
                        CheckoutView(order: order)
                            .onAppear {
                                saveData()
                            }
                    }
                    .disabled(order.hasValidAdress == false)
                }
            }
            .navigationTitle("Delivery Details")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: getData)
    }
    
    func saveData() {
        UserDefaults.standard.set(self.order.name, forKey: "name")
        UserDefaults.standard.set(self.order.streetAddress, forKey: "streetAddress")
        UserDefaults.standard.set(self.order.city, forKey: "city")
        UserDefaults.standard.set(self.order.zip, forKey: "zip")
    }
    
    func getData() {
        UserDefaults.standard.string(forKey: "name")
        UserDefaults.standard.string(forKey: "streetAddress")
        UserDefaults.standard.string(forKey: "city")
        UserDefaults.standard.string(forKey: "zip")
    }
}

#Preview {
    AddressView(order: Order())
}
