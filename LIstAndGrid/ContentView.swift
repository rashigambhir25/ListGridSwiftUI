//
//  ContentView.swift
//  LIstAndGrid
//
//  Created by Rashi Gambhir on 05/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = "List"
    @State private var select: Set<UUID> = []
    @State var details: [Details] = []
    
    let options = ["List" , "Grid" , "Mix"]
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            switch selection {
            case "List":
                listView
            case "Grid":
                gridView
            case "Mix":
                mixView
            default:
                listView
            }
        }
    }
    
    private var listView: some View {
        List(selection: $select) {
            Section(header: Text("Products")) {
                ForEach(details, id: \.id) { detail in
                    ProductRowList(product: detail).frame( height: 100, alignment: .leading)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button("Delete", role: .destructive) {
                                details.removeAll { $0.id == detail.id }
                            }
                        }
                }
            }
        }
        .listStyle(.plain)
        .onAppear {
            APIService().getDetails(completion: { (details) in
                self.details = details
            })
        }
        .navigationTitle("List View")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack{
                    EditButton()
                    optionsMenu
                }
            }
        }
    }
    
    private var gridView: some View {
        ScrollView(.vertical){
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(details, id: \.id) { detail in
                    ProductRowGrid(product: detail)
                    
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            APIService().getDetails(completion: { (details) in
                self.details = details
            })
        }
        .navigationTitle("Grid View")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack{
                    optionsMenu
                }
            }
        }
    }
    
    private var mixView: some View {
        ScrollView {
            LazyVGrid(columns:[GridItem(.flexible())], spacing: 20, content: {
                ForEach(details, id: \.id) { detail in
                    ProductRowList(product: detail)
                        .frame(minWidth: 300, minHeight: 200)
                        .foregroundColor(.pink)
                    
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.flexible())],alignment: .center, spacing: 20, content: {
                            ForEach((details)) { detail in
                                ProductRowList(product: detail)
                                    .frame(minWidth: 50, minHeight: 200)
                            }
                        })
                    }
                    .padding(.bottom, 20)
                    
                }
            })
        }
        .padding()
        .onAppear {
            APIService().getDetails(completion: { (details) in
                self.details = details
            })
        }
        .navigationTitle("Mix View")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack{
                    optionsMenu
                }
            }
        }
    }
    
    private var optionsMenu: some View {
        Picker("Select layout option", selection: $selection) {
            ForEach(options, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(.menu)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
