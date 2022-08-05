//
//  PlayerListRow.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-02.
//

import SwiftUI

struct PlayerListRow: View {
    @EnvironmentObject var userSettings: UserSettingsState

    @State var showRow: Bool = false
    
    var player: Player
    
    private func showRowAnimation(action: () -> ()) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0)) {
            showRow.toggle()
            action()
        }
    }
    
    var body: some View {
        ZStack {
            Color(AppColor.darkColor)
            
            VStack {
                Spacer()
                
                HStack {
                    Typography(text: player.name, size: TextSize.mediumBody)
                       
                    Spacer()
                    
                    Button {
                        showRowAnimation {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation {
                                    userSettings.deletePlayer(with: player.id)
                                }
                            }
                        }
                    
                    } label: {
                        Image(systemName: AppIcons.trashIcon)
                            .foregroundColor(.red)
                            .frame(width: Space.fivexl, height: Space.fivexl)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                Divider()
                    .frame(height: 1)
                    .background(Color(AppColor.lightColor))
            }
            .offset(x: 0, y: showRow ? 0 : 200)
            .opacity(showRow ? 1 : 0)
            .onAppear {
                showRowAnimation {}
            }
        }
    }
}

struct PlayerListRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerListRow(player: Player(name: "ervin")).previewLayout(.fixed(width: 500, height: 70))

            PlayerListRow(player: Player(name: "ebba")).previewLayout(.fixed(width: 500, height: 70))
        }
    }
}
