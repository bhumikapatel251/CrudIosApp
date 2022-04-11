//
//  DetailView.swift
//  CrudIosApp
//
//  Created by Bhumika Patel on 08/04/22.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    let item: DataModel
    //let product: ProductModel
    @State var title = ""
    @State var body1 = ""
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Creat New Post")
                    .font(Font.system(size: 16, weight: .bold))
                
                TextField("Title", text: $title)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(6)
                    .padding()
                TextField("Writing something... ", text: $body1)
                    .font(.caption)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(6)
                    .padding()
                
                Spacer()
                
            }.padding()
                .onAppear(perform: {
                    //let x : Int = item.total
                    //let myString = String(x)
                    
                   // let tot = item.total
                    self.title = item.name
                    self.body1 = item.username
                   // self.body1 = String(tot)
                    
                    //product = item.products
                    //let parr = item.products
                    //PostModel.products.forEach { products in print(products) }
                   // self.body1 = parr
                    
                    //self.txtPassword.text = self.inputString[index]
                    //print(item.total)

                })
        }
        .navigationBarTitle("Edit Post", displayMode: .inline)
        .navigationBarItems(trailing: trailing)
    }
    var trailing: some View {
        Button(action: { presentationMode.wrappedValue.dismiss()},
               label: { Text("Save")}
        )
    }
}


//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
