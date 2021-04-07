//
//  TextFieldAlertView.swift
//  todoSwiftUI
//
//  Created by ToruYoshifuji on 2021/04/07.
//

import SwiftUI

struct TextFieldAlertView: UIViewControllerRepresentable {
    @Binding var text: String;
    @Binding var isShown: Bool;

    var onDismiss: () -> Void;

    func makeUIViewController(context: Context) -> some UIViewController {
        return UIViewController();
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if (!isShown) {
            return;
        }

        let alert = UIAlertController(
            title: "Add ToDo",
            message: "ToDoを入力してください",
            preferredStyle: .alert
        );

        alert.addTextField { textField in
            textField.text = text;
        }

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) {_ in
            alert.dismiss(
                animated: true,
                completion: {
                    isShown = false;
                }
            );
        })

        alert.addAction(UIAlertAction(title: "OK", style: .default) {_ in
            if let textField = alert.textFields?.first, let text = textField.text {
                self.text = text;
            }

            alert.dismiss(
                animated: true,
                completion: {
                    isShown = false;
                    onDismiss();
                }
            );
        })

        DispatchQueue.main.async{
            uiViewController.present(alert, animated: true, completion: {
                isShown = false;
            })
        }
    }
}

struct TextFieldAlertView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldAlertView(
            text: .constant("PreviewText!!"),
            isShown: .constant(true),
            onDismiss: {
                print("dismissed");
            }
        )
    }
}
