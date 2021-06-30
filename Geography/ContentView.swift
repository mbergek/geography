//
//  ContentView.swift
//  Geography
//
//  Created by Martin on 2021-06-27.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Country.name, ascending: true)],
        animation: .default)
    private var countries: FetchedResults<Country>

    var body: some View {
        NavigationView {
            List {
                ForEach(countries) { country in
                    NavigationLink(destination: CountryView(country: country) ) {
                        Text("\(country.name!)")
                    }
                }
                .onDelete(perform: deleteCountries)
            }
            .navigationBarItems(leading: EditButton(),
                                trailing:Button(action:{},
                                                label: { Label("Add Country", systemImage: "plus") })
            )
            .navigationTitle("Countries")
        }
    }

    private func addCountry() {
        withAnimation {
            let newCountry = Country(context: viewContext)
            newCountry.name = "New country"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteCountries(offsets: IndexSet) {
        withAnimation {
            offsets.map { countries[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
