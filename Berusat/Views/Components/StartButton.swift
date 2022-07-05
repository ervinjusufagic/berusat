//
//  StartButton.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct StartButton: View {
    var isDisabled: Bool
    
    var buttonColor: Color {
        isDisabled ? Color(AppColor.disabled) : Color(AppColor.primary)
    }
    
    var body: some View {
        Button {
            print("start button was pressed")
            
        } label: {
            NavigationLink(destination: PackageSelector()) {
                HStack(alignment: .center, spacing: Space.none) {
                    Typography(text: AppText.startButtonText, size: 24, color: buttonColor)
                    Image(systemName: AppIcons.rightArrowIcon)
                        .foregroundColor(buttonColor)
                        .frame(width: Space.fourxl, height: Space.fourxl)
                }
            }            
        }
        .disabled(isDisabled)
    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton(isDisabled: true)
    }
}
