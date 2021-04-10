//
//  TodoTableView.swift
//  todoSwiftUI
//
//  Created by ToruYoshifuji on 2021/04/04.
//

import SwiftUI

struct TodoTableView: View {
    @Binding var todoList: [String];

    var body: some View {
        List {
            ForEach(todoList, id: \.self) { todoItem in
                Text(todoItem)
            }
            .onDelete(perform: removeRow)
        }
        .listStyle(PlainListStyle())
        .animation(.default)
    }

    func removeRow(offset: IndexSet) {
        todoList.remove(atOffsets: offset)
    }
}

struct TodoTableView_Previews: PreviewProvider {
    static var previews: some View {
        TodoTableView(
            todoList: .constant(
                ["example1", "example2", "example3"]
            )
        )
    }
}

