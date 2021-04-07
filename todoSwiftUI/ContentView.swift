//
//  ContentView.swift
//  todoSwiftUI
//
//  Created by ToruYoshifuji on 2021/04/04.
//

import SwiftUI

struct ContentView: View {
    init() {
        setUpNavigationBar();
    }

    func setUpNavigationBar() {
        let appearance = UINavigationBarAppearance();
        appearance.configureWithOpaqueBackground();
        appearance.backgroundColor = UIColor.systemIndigo;
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white];

        UINavigationBar.appearance().standardAppearance = appearance;
        UINavigationBar.appearance().compactAppearance = appearance;
        UINavigationBar.appearance().scrollEdgeAppearance = appearance;
    }

    var body: some View {
        NavigationView() {
            TodoTableView()
                .navigationBarTitle("ToDoリスト", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    handleAddButtonPressed();
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                }))
        }
        .background(Color(.red))
    }

    func handleAddButtonPressed() {
        print("pushed");
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
