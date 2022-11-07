//
//  ContentView.swift
//  BiometricAuth
//
//  Created by g1alexander on 11/7/22.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State var auth = false
    
    
    
    var body: some View {
        VStack {
            Text(auth ? "siuu" : "necesitas iniciar sesion")
            
            Button(auth ? "cerrar" : "authenticator"){
                
                if(auth){
                    auth = false
                }else{
                    authentication()
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(auth ? Color.green : Color.yellow)
        .padding()
    }
    
    private func authentication(){
        
        var error : NSError?
        let laContext = LAContext()
        
        if
            laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "utiliza sensor"){
                autheticated, error in
                
                if autheticated{
                    auth = true
                }
            }
        }else{
            auth = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
