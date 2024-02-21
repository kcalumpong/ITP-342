//
//  ContentView.swift
//  CalumpongKristinaHW4
//
//  Created by Kristina Calumpong on 2/19/24.
//

import SwiftUI

struct ContentView: View {
    enum TaxPercentage: Double {
        case sevenFive = 7.5
        case eight = 8
        case eightFive = 8.5
        case nine = 9
        case nineFive = 9.5
    }
    
    @FocusState private var isFocused : Bool
    @State private var bill = ""
    @State private var taxPercent = TaxPercentage.sevenFive
    @State private var isTaxIncludedInSubtotal = true
    @State private var tipPercent = 20.0
    @State private var numSplit = 1
    
    var billAmount: Double {
        return Double(bill) ?? 0.0
    }
    
    var taxAmount: Double {
        return billAmount * (taxPercent.rawValue / 100)
    }
    
    var subtotalAmount: Double {
        return isTaxIncludedInSubtotal ? billAmount + taxAmount : billAmount
    }
    
    var tipAmount: Double {
        return subtotalAmount * (tipPercent / 100)
    }
    
    var totalWithTipAmount: Double {
        return subtotalAmount + tipAmount
    }
    
    var totalPerPersonAmount: Double {
        return totalWithTipAmount / Double(numSplit)
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("Bill Amount", text: $bill)
                .padding()
                .focused($isFocused)
            
            Picker("Tax %", selection: $taxPercent) {
                Text("7.5").tag(TaxPercentage.sevenFive)
                Text("8").tag(TaxPercentage.eight)
                Text("8.5").tag(TaxPercentage.eightFive)
                Text("9").tag(TaxPercentage.nine)
                Text("9.5").tag(TaxPercentage.nineFive)
            }
            .padding()
            .pickerStyle(.segmented)
            .keyboardType(.decimalPad)
            
            Toggle("Include Tax in Subtotal", isOn: $isTaxIncludedInSubtotal)
                .padding()
            
            HStack {
                Text("Tip % (\(Int(tipPercent)))")
                Slider(value: $tipPercent, in: 0...100, step: 1)
            }
            .padding()
            
            Stepper(value: $numSplit, in: 1...20) {
                Text("Split: \(numSplit)")
            }
            .padding()
            
            HStack {
                Spacer()
                VStack() {
                    Text("**Tax:** \(taxAmount.formattedCurrency)")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    Text("**Subtotal:** \(subtotalAmount.formattedCurrency)")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    Text("**Tip:** \(tipAmount.formattedCurrency)")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    Text("**Total with Tip:** \(totalWithTipAmount.formattedCurrency)")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    Text("**Total per Person:** \(totalPerPersonAmount.formattedCurrency)")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .padding()
//            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Button("Clear All") {
                bill = ""
                taxPercent = .sevenFive
                isTaxIncludedInSubtotal = true
                tipPercent = 20.0
                numSplit = 1
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .foregroundStyle(Color.blue)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .background(Color.teal)
        
    }
}

extension Double {
    var formattedCurrency: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}

#Preview {
    ContentView()
}
