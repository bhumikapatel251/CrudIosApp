//
//  ContentView.swift
//  CrudIosApp
//
//  Created by Bhumika Patel on 08/04/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}


struct HomeView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State var isPresentedNewPost = false
    @State var title = ""
    @State var body1 = ""
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items, id: \.id) { item in
                    NavigationLink(
                        destination: DetailView(item: item),
                        label: {
                            VStack(alignment: .leading) {
                                
                                Text(item.name)
                                Text(item.username)
                                    .font(.caption)
                                
//                                let x : Int = item.total
//                                let total = String(x)
//                                Text(total)
                               // Text(item.title).font(.caption).foregroundColor(.gray)
                                
                            }
                        }
                    )
                    
                }
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Posts")
            .navigationBarItems(trailing: plusButton)
        }
        .sheet(isPresented: $isPresentedNewPost, content: {
            NewPostView(isPresented: $isPresentedNewPost, title: $title, post: $body1)
        })
    }


var plusButton: some View {
    Button(
        action: { isPresentedNewPost.toggle() },
        label: { Image(systemName: "plus") }
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

