//
//  RootView.swift
//  swiftuitests
//
//  Created by Philipp Arndt on 2021-06-13.
//

import SwiftUI

var i = 0

struct Element: Identifiable {
	let id = UUID().uuidString
	var name: String
}

struct RootView: View {
	@State var elements: [Element] = []
	
	var body: some View {
		NavigationView {
			VStack {
				if elements.isEmpty {
					Text("Start creating a new element.")
				}
				else {
					Text("Now try to delete the element using swipe action.")
					
					Text("However, it works when using the `Delete all` button.")
					Button("Delete all") {
						deleteAll()
					}
					
					List {
						ForEach(elements) { element in
							Text(element.name)
						}
						.onDelete(perform: delete)
					}
				}
			}
			.toolbar {
				ToolbarItemGroup(placement: .navigationBarTrailing) {
					Button(action: create) {
						Text("create")
					}
				}
			}
		}
	}
	
	func create() {
		i += 1
		elements.append(Element(name: "\(i)"))
	}
	
	func delete(at indexSet: IndexSet) {
		deleteAll()
	}
	
	func deleteAll() {
		elements = []
	}
}
