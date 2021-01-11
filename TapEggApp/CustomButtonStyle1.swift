//
//  CustomButtonStyle.swift
//  TapEggApp
//
//  Created by kenta tanii on 2021/01/11.
//
import SwiftUI
import Foundation

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
    }
}

