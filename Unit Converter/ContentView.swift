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
    @State private var middleManValue = 4;
    @FocusState private var inputIsFocused:Bool;
    
    private let measurementUnitList = LengthConverter.measurementUnitList
    
    //will make a class for length converter
    class LengthConverter {
        static public let measurementUnitList = ["m","mm","cm", "km","in.", "ft", "mi."];
        
    }
    
    
    var body: some View {
        NavigationView {
                Form {
                    
                    //required spacers To move contents to center of screen
                    Section {
                        VStack {
                            ForEach(0..<7) { _ in
                                Spacer()
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                    
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
                        //need to horizontally align this
                        HStack {
                            Spacer()
                            Image(systemName: "arrow.up.and.down")
                                 .imageScale(.large)
                                 .foregroundColor(.accentColor)
                                 .font(.system(size: 50))
                            Spacer()
                            
                            
                        }
                    }
                    .listRowBackground(Color.clear)
                    
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
            .navigationTitle("Unit Converter")
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

