//
//  ContentView.swift
//  FormFields and Switches
//
//  Created by Oriakhi Collins on 4/3/22.
//

import SwiftUI

struct ContentView: View {
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var isSwitchOn = false;
    @State var numberOfChildren = 1
    @State private var birthDate = Date()
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Information"), content:{
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("Birth Date", selection: $birthDate, displayedComponents: .date)
                    
                    
                }
                
                )
                
                
                
                Section(header: Text("Actions"), content:{
                    Toggle("News Letter" , isOn : $isSwitchOn)
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                    
                    Stepper("No of Gigs", value : $numberOfChildren , in: 1...100 )
                    Text("Number of Children : \(numberOfChildren)")
                    Link("Link to Github", destination : URL(string: "https://github.com/Collins01-max")!)
                }
                
                )
                
            }
            
            
        }
        .navigationTitle("Account")
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Button("Save", action: {
                    
                })
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



#if canImport(UIKit)
extension View{
    func hideKeyboard()  {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#endif
