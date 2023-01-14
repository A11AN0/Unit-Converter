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
    private var converter = LengthConverter();
    
    private let measurementUnitList = LengthConverter.measurementUnitList
    
    //will make a class for length converter
    //next step - make a function for reading the input measurement and converting it to the middle man value
    class LengthConverter {
        private var middleManVal: Double
        
        init() {
            self.middleManVal = 0.0;
        }
        
        static public let measurementUnitList = ["m","mm","cm", "km","in.", "ft", "mi."];
        //will do a didSet for input/output -- smth smth
        
        private func unitConverter(forUnit measureUnit:String, forNumber numberVal:Double, isOutput:Bool) -> Double {
            //will be used to set the middle man value which will always be in metres when isOutput is false
            //will be used to set the output value - when isOutput is set to true
            switch measureUnit {
            case "mm":
                return isOutput ? numberVal*1000 : numberVal/1000
            case "cm":
                return isOutput ? numberVal*100: numberVal/100
            case "km":
                return isOutput ? numberVal/1000: numberVal * 1000
            case "in.":
                return isOutput ? numberVal * 39.37: numberVal/39.37
            case "ft":
                return isOutput ? numberVal * 3.281: numberVal/3.281
            case "mi.":
                return isOutput ? numberVal/1609: numberVal * 1609
            default:
                return numberVal;
                
            }
        }
        
        public func getOutput(fromMeasureUnit:String, toMeasurementUnit:String, fromNumber:Double) -> Double {
            middleManVal = unitConverter(forUnit: fromMeasureUnit, forNumber: fromNumber, isOutput: false);
            return unitConverter(forUnit: toMeasurementUnit, forNumber: middleManVal, isOutput: true);
        }
        
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
                        Text("\(converter.getOutput(fromMeasureUnit: inputMeasurementUnit, toMeasurementUnit: outputMeasurementUnit, fromNumber: lengthInput), format: .number)")
                        
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

