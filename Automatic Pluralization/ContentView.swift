/*--------------------------------------------------------------------------------------------------------------------------
    File: ContentView.swift
  Author: Kevin Messina
 Created: 1/10/24
Modified:
 
©2024 Creative App Solutions, LLC. - All Rights Reserved.
----------------------------------------------------------------------------------------------------------------------------
NOTES:
--------------------------------------------------------------------------------------------------------------------------*/



import SwiftUI

struct ContentView: View {
    @State var count: Int = 0
    @State var text: String = "apple"

    private var attributedString: AttributedString {
        let string = "Text(\"^[\\(\( "count" )) \\(\( "item" ))](inflect:true)\")"
        var attrStr = AttributedString(string)
        attrStr.font = .systemFont(ofSize: 20)
        attrStr.foregroundColor = .white
        
        if let range = attrStr.range(of: "Text") { attrStr[range].foregroundColor = .green }
        if let range = attrStr.range(of: "(") { attrStr[range].foregroundColor = .white }
        if let range = attrStr.range(of: "\"^[") { attrStr[range].foregroundColor = .orange }
        if let range = attrStr.range(of: "count") { attrStr[range].foregroundColor = .yellow }
        if let range = attrStr.range(of: "item") { attrStr[range].foregroundColor = .yellow }
        if let range = attrStr.range(of: "](inflect:true)\"") { attrStr[range].foregroundColor = .orange }
        if let range = attrStr.range(of: ")") { attrStr[range].foregroundColor = .white }

        return attrStr
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray4).ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Pluralization Demo")
                        .font(.largeTitle)
                        .bold()
                        .underline()
                    
                    Text(
                        """
                        Apple has a built-in feature available for all developers which handles in many languages the natural \
                        pluralization of words. Avaiallbe in most all of the native supported languages, it handles the rules and \
                        exceptions for each language.
                        
                        Try the word KNIFE. It not only knows to simply pluralize it, (KNIFES is \
                        incorrect), but to properly change the spelling to KNIVES.
                        """
                    )
                    .font(.system(size: 18))
                    .minimumScaleFactor(0.66)
                    .italic()
                    .padding(.all,20)
                    .multilineTextAlignment(.leading)
                }

                Divider()
                    .padding(.bottom,10)

                Group {
                    HStack(alignment: .center ) {
                        VStack(alignment: .center ) {
                            Text("Item:")
                            Spacer()
                        }
                        .frame(height:37)

                        TextField("", text: $text, prompt: Text("Enter Item Name"))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .shadow(color: .black.opacity(0.33), radius: 5, x:5, y:5)
                            .padding(.bottom,20)
                    }
                    
                    HStack {
                        HStack {
                            Text("^[\(count) \(text)](inflect:true)")
                                .frame(alignment: .center)
                                .multilineTextAlignment(.center)
                                .font(.largeTitle)
                                .padding(.all,15)
                        }
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10.0)
                        .padding(.bottom,20)

                        Stepper("") {
                            count += 1
                        } onDecrement: {
                            count -= 1
                        }
                    }
                }
                .padding(.horizontal,30)

                
                VStack{
                    HStack {
                        Text("Samples: ")
                            .bold()

                        Text("Apple, Orange, Person, Deer, Car, Pet, Horse, Bee, Plate, Fork, Knife")
                            .font(.body)
                            .italic()

                        Spacer()
                    }
                    .padding(.top,20)
                    .padding(.leading,20)

                    HStack {
                        Text("Code:")
                            .font(.body)
                            .bold()
                        
                        Spacer()
                    }
                    .padding([.horizontal,.top],20)
                    
                    Text(attributedString)
                        .padding(.vertical,15)
                        .padding(.horizontal,10)
                        .foregroundStyle(.white)
                        .background(.black)
                        .cornerRadius(8.0)
                }
           
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
