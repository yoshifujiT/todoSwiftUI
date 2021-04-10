//
//  ContentView.swift
//  todoSwiftUI
//
//  Created by ToruYoshifuji on 2021/04/04.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = "";
    @State var isAlertShown: Bool = false;
    @State var todoList: [String] = [];

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
            TodoTableView(todoList: $todoList)
                .navigationBarTitle("ToDoリスト", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    handleAddButtonPressed();
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                }))
        }
        .background(Color(.red))
        TextFieldAlertView(
            text: $text,
            isShown: $isAlertShown,
            onDismiss: {
                todoList.insert(text, at: 0);
                text = "";
            }
        )
    }

    func handleAddButtonPressed() {
        isAlertShown = true;
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
