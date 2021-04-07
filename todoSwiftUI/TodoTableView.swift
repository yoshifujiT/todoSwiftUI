//
//  TodoTableView.swift
//  todoSwiftUI
//
//  Created by ToruYoshifuji on 2021/04/04.
//

import SwiftUI

struct TodoTableView: View {
    @State var todoList: [String] = [];

    var body: some View {
        List(todoList, id: \.self) { todoItem in
            Text(todoItem)
        }
        .listStyle(PlainListStyle())
    }
}

struct TodoTableView_Previews: PreviewProvider {
    static var previews: some View {
        TodoTableView()
    }
}

