//
//  ContentView.swift
//  Unit Converter
//
//  Created by A11AN0.
//

import SwiftUI



struct ContentView: View {
    @State private var lengthInput = 0.0;
    @State private var inputMeasurementUnit = "m";
    @State private var outputMeasurementUnit = "m";
    @FocusState private var inputIsFocused:Bool;
    
    private let measurementUnitList = ["m","mm","cm", "km", "mm", "in.", "ft", ]
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("Length to Convert", value: $lengthInput, format: .number)
                    .keyboardType(.decimalPad)
                    .focused($inputIsFocused)
                    
                    Picker("Input Units", selection: $inputMeasurementUnit) {
                        ForEach(measurementUnitList, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    
                    
                } header: {
                    Text("Input Length")
                }
                
                Section {
                    Text("\(lengthInput, format: .number)")
                    
                    Picker("Output Units", selection: $outputMeasurementUnit) {
                        ForEach(measurementUnitList, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output Length")
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

