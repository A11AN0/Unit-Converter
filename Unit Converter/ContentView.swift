//
//  ContentView.swift
//  Unit Converter
//
//  Created by A11AN0.
//

import SwiftUI



struct ContentView: View {
    @State private var lengthInput = 0.0;
    @FocusState private var inputIsFocused:Bool;
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("Length to Convert", value: $lengthInput, format: .number)
                    .keyboardType(.decimalPad)
                    .focused($inputIsFocused)
                } header: {
                    Text("Input")
                }
                
                Section {
                    Text("random text")
                } header: {
                    Text("Output")
                }
            }
            .navigationTitle("Unit Convert")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false;
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
