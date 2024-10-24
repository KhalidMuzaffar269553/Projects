

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        List {
            Section { } footer: {
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        ProfileImage(imageName: "cat")
                            .frame(width: 125, height: 125)
                        
                        VStack(spacing: 5) {
                            Text("Pinder")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text("Wroclaw,PWR")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        
                        Divider()
                        RichText(K.Information.description)
                            .font(.system(size: 20, weight: .medium, design: .rounded))
                            .textCase(.uppercase)
                    }
                    .multilineTextAlignment(.center)
                    Spacer()
                }
            }
 
            GuideComponent(title: "Like", subtitle: "Swipe Right", description: "Do you like them? Touch the screen and swipe right. If they do the same, you will be matched!", icon: K.Icon.like, iconColor: .green)
            GuideComponent(title: "Dismiss", subtitle: "Swipe Left", description: "You don't like them? Touch the screen and swipe left. You will no longer see them.", icon: K.Icon.dismiss, iconColor: .red)
            
            Section {
                AppInfoView()
            } header: {
                Text("Credits")
            }
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(HomeViewModel())
    }
}

struct ProfileImage: View {
    
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .foregroundColor(.pink)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.white,
                            lineWidth: 5)
            )
            .shadow(radius: 3)
    }
}
