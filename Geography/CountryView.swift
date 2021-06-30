//
//  CountryView.swift
//  Geography
//
//  Created by Martin on 2021-06-27.
//

import SwiftUI

struct CountryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var country:Country
    
    var body: some View {
        List {
            ForEach(Array(country.cities! as! Set<City>), id: \.self) { city in
                Text("\(city.name!)")
            }
        }
        .navigationTitle(country.name ?? "Country")
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        
        let sweden = Country(context: PersistenceController.preview.container.viewContext)
        sweden.name = "Sweden"
        let stockholm = City(context: PersistenceController.preview.container.viewContext)
        stockholm.name = "Stockholm"
        stockholm.country = sweden
        let gothenburg = City(context: PersistenceController.preview.container.viewContext)
        gothenburg.name = "Gothenburg"
        gothenburg.country = sweden

        return NavigationView {
            CountryView(country: sweden)
        }
    }
}
