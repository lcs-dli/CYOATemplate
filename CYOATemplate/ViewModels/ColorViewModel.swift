//
//  ColorViewModel.swift
//  CYOATemplate
//
//  Created by David Li on 2024-06-13.
//

import Foundation
import SwiftUI
import Combine

class ColorViewModel: ObservableObject{
    @Published var backgroundColor: Color = .white
}
