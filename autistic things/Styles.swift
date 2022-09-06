//
//  Styles.swift
//  autistic things
//
//  Created by Bruno Sabadini on 03/09/22.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
  
    func makeBody(configuration: Self.Configuration) -> some View {

        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .font(.system(size: 20, weight: .regular, design: .default))
                configuration.label
        }
        .onTapGesture { configuration.isOn.toggle() }

    }
}

struct CheckboxStyleDelete: ToggleStyle {
  
    func makeBody(configuration: Self.Configuration) -> some View {

        return HStack {
            Image(systemName: configuration.isOn ? "trash" : "trash")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .red : .green)
                .font(.system(size: 20, weight: .regular, design: .default))
                configuration.label
        }
        .onTapGesture { configuration.isOn.toggle() }

    }
}

