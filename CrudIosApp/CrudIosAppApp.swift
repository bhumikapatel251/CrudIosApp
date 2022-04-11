//
//  CrudIosAppApp.swift
//  CrudIosApp
//
//  Created by Bhumika Patel on 08/04/22.
//

import SwiftUI

@main
struct CrudIosAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}
