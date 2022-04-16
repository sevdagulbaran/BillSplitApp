//
//  ContentView.swift
//  BillSplitApp
//
//  Created by Sevda Gul Baran on 16.04.2022.
//

import SwiftUI

struct ContentView: View {
        @State private var checkAmount = ""
        @State private var numberOfPeople = 2
        @State private var tipPercentage = 2
        
        let tipPercentages = [10, 15, 20, 25, 0]
        
        var totalPerPerson: Double {
            let peopleCount = Double(numberOfPeople + 2)
            let tipSelection = Double(tipPercentages[tipPercentage])
            let orderAmount = Double(checkAmount) ?? 0
            
            let tipValue = orderAmount / 100 * tipSelection
            let grandTotal = orderAmount + tipValue
            let amountPerPerson = grandTotal / peopleCount
            
            return amountPerPerson
        }
        
        var body: some View {
            NavigationView {
                Form {
                    Section {
                        TextField("Amount", text: $checkAmount)
                            .keyboardType(.decimalPad)
                        
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2 ..< 100){
                                Text("\($0) people")
                            }
                        }
                    }
                    Section {
                        Picker("Tip Percentage", selection: $tipPercentage) {
                            ForEach(0 ..< tipPercentages.count) {
                                Text("\(self.tipPercentages[$0])%")
                            }
                        }.pickerStyle(.segmented)
                    } header: {
                        Text("How much tip do you want to leave?")
                    }
                    
                    Section {
                        Text("$\(totalPerPerson, specifier: "%.2f")")
                    }
                    
                    Section {
                        Text("This is my SwiftUI App, thanks for using.")
                    }
                }
                .navigationTitle("Bill Split")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
}
