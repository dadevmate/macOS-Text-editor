//
//  ContentView.swift
//  Text Editor
//
//  Created by Nethan on 4/3/23.
//

import SwiftUI
var indexie = 0

struct ContentView: View {
    @State var documents = UserDefaults.standard.object(forKey: "documents1") as? [String: [String]] ?? ["Welcome": ["This app helps you to write your macOS text documents with ease. Enjoy!"]]
    @State var theIndex = indexie
    @State var newDoc = false
    @State var docTitle = ""
    @State var docText = ""
    @State var seeDoc = false
    @State var font = "title2"
   @State var unsuccessfulSave = false
    @State var fonts = ["title2", "title3", "body", "callout"]
    @State var colorie = "white"
    @State var allColors = ["red", "green", "blue", "orange", "yellow", "purple", "pink", "gray", "black", "white"]
   @State var chosenKey = ""
    @State var shownText = ""
    @State var choseeFont: Font = Font.title2
    @State var choseeFont2: Font = Font.title2
    @State var colorToShow = Color.white
    @State var colorToShow2 = Color.white
  // Sample code to convert color in allColors to of Color type, same goes for fonts as well
    
 /*
  
  for colora in allColors {
      switch colora {
      case "red":
          if documents["first"]?[1] == "red"{
              var colorToShow = Color.red
          }
      default:
          print("bruh")
      }
  }
  
  */
   
    var body: some View {
        
        if newDoc {
            VStack {
                HStack {
                    
                    Button("Back") {
                        newDoc = false
                    }
                    .padding()
                    Spacer()
                    Text("Create a new document")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                   
                    Button("Save") {
                        if docTitle.trimmingCharacters(in: .whitespaces) != "" && docText.trimmingCharacters(in: .whitespaces) != "" && colorie.trimmingCharacters(in: .whitespaces) != "" && font.trimmingCharacters(in: .whitespaces) != "" {
                        
                            documents[docTitle] = [docText, colorie, font]
                            
                            UserDefaults.standard.set(documents, forKey: "documents1")
                            
                            newDoc = false
                            docTitle = ""
                            docText = ""
                            font = ""
                            colorToShow2 = Color.white
                        } else {
                            unsuccessfulSave = true
                        }
                          
                    }
                    .padding()
                    .alert("Your save was unsuccessful", isPresented: $unsuccessfulSave) {
                        
                    } message: {
                        Text("Make sure that all fields have been filled!")
                    }
                
                   
                }
                TextField("Title", text: $docTitle)
                    .font(.title)
                Picker(selection: $font, label: Text("Font:").font(.title3).bold()) {
                    ForEach(fonts, id: \.self) { font in
                        Text(font)
                    }
                }
                .onChange(of: font) { _ in
                    switch font {
                    case "title2":
                        if font == "title2"{
                            choseeFont2 = Font.title2
                        }
                    case "title3":
                        if font == "title3"{
                            choseeFont2 = Font.title3
                        }
                    case "body":
                        if font == "body"{
                            choseeFont2 = Font.body
                        }
                    case "callout":
                        if font == "callout"{
                            choseeFont2 = Font.callout
                        }
           
                    default:
                        print("bruh")
                    }
                }
                Picker(selection: $colorie, label: Text("Color:").font(.title3).bold()) {
                    ForEach(allColors, id: \.self) { color in
                        Text("\(color)")
                    }
                }
                .onChange(of: colorie) { _ in
                   switch colorie {
                    case "red":
                        if colorie == "red"{
                             colorToShow2 = Color.red
                        }
                        
                    case "green":
                        if colorie == "green"{
                             colorToShow2 = Color.green
                        }
                    case "blue":
                        if colorie == "blue"{
                             colorToShow2 = Color.blue
                        }
                    case "orange":
                        if colorie == "orange"{
                             colorToShow2 = Color.orange
                        }
                    case "yellow":
                        if colorie == "yellow"{
                             colorToShow2 = Color.yellow
                        }
                    case "purple":
                        if colorie == "purple"{
                             colorToShow2 = Color.purple
                        }
                    case "pink":
                        if colorie == "pink"{
                             colorToShow2 = Color.pink
                        }
                    case "gray":
                        if colorie == "gray"{
                             colorToShow2 = Color.gray
                        }
                    case "black":
                        if colorie == "black"{
                             colorToShow2 = Color.black
                        }
                    case "white":
                        if colorie == "white"{
                             colorToShow2 = Color.white
                        }
                    default:
                        print("bruh")
                    }
                }
                
                TextEditor(text: $docText)
                    .foregroundColor(colorToShow2)
                    .font(choseeFont2)
                    .fontWeight(.ultraLight)
                   
            }
        } else if seeDoc == true {
            ScrollView {
    
                    ForEach(Array(documents), id: \.0) { key, value in
                        
                        if key == chosenKey {
                            
                            VStack {
                                HStack {
                                    Spacer()
                                    Button("Save") {
                                        seeDoc = false
                                        documents[key]?[0] = shownText
                                        UserDefaults.standard.set(documents, forKey: "documents1")
                                        shownText = ""
                                    
                                    }
                                    .padding()
                                }
                                
                                
                                Spacer()
                                Text(key)
                                    .font(.system(size: 60))
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                
                                TextEditor(text: $shownText)
                                    .font(choseeFont)
                                    .fontWeight(.light)
                                    .foregroundColor(colorToShow)
                                    
                                
                                
                                Spacer()
                                
                                
                                
                            }
                            .background(Color.gray)
                            .cornerRadius(8)
                            .onAppear {
                             
                              shownText = value[0]
                                for colora in allColors {
                                    switch colora {
                                    case "red":
                                        if documents[key]?[1] == "red"{
                                             colorToShow = Color.red
                                        }
                                        
                                    case "green":
                                        if documents[key]?[1] == "green"{
                                             colorToShow = Color.green
                                        }
                                    case "blue":
                                        if documents[key]?[1] == "blue"{
                                             colorToShow = Color.blue
                                        }
                                    case "orange":
                                        if documents[key]?[1] == "orange"{
                                             colorToShow = Color.orange
                                        }
                                    case "yellow":
                                        if documents[key]?[1] == "yellow"{
                                             colorToShow = Color.yellow
                                        }
                                    case "purple":
                                        if documents[key]?[1] == "purple"{
                                             colorToShow = Color.purple
                                        }
                                    case "pink":
                                        if documents[key]?[1] == "pink"{
                                             colorToShow = Color.pink
                                        }
                                    case "gray":
                                        if documents[key]?[1] == "gray"{
                                             colorToShow = Color.gray
                                        }
                                    case "black":
                                        if documents[key]?[1] == "black"{
                                             colorToShow = Color.black
                                        }
                                    case "white":
                                        if documents[key]?[1] == "white"{
                                             colorToShow = Color.white
                                        }
                                    default:
                                        print("bruh")
                                    }
                                }
                                
                                for fontie in fonts {
                                    switch fontie {
                                    case "title2":
                                        if documents[key]?[2] == "title2"{
                                            choseeFont = Font.title2
                                        }
                                    case "title3":
                                        if documents[key]?[2] == "title3"{
                                            choseeFont = Font.title3
                                        }
                                    case "body":
                                        if documents[key]?[2] == "body"{
                                            choseeFont = Font.body
                                        }
                                    case "callout":
                                        if documents[key]?[2] == "callout"{
                                            choseeFont = Font.callout
                                        }
                           
                                    default:
                                        print("bruh")
                                    }
                                }

                            }
                            
                        }
                        
                    
                }
            }
        } else {
          
                VStack {
                   
                    
                    HStack {
                        
                        Button {
                            newDoc = true
                            
                        } label: {
                            Image(systemName: "plus")
                                .font(.title3)
                        }
                        
                        
                        
                        
                        Spacer()
                        Image(systemName: "newspaper.fill")
                            .font(.system(size: 50))
                 Spacer()
                        
                    }
                   
                    List {
                        ScrollView {
                            ForEach(Array(documents), id: \.0) { key, value in
                                
                                
                                
                                HStack {
                                    
                                    Image(systemName: "doc.text.fill")
                                        .font(.system(size: 80))
                                    
                                    Text(key)
                                        .font(.largeTitle)
                                        .frame(width: 550, height: 150)
                                    
                                   
                                }
                                .background(Color.gray)
                                .cornerRadius(8)
                                .onTapGesture {
                                    
                                    seeDoc = true
                                    chosenKey = key
                                }
                                
                                
                                
                            }
                        }
                    }
                   
                }
               
            
            .padding()
        }
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
