import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("isOnboarding") var isOnboarding: Bool = false

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    GroupBox(label: SettingsLabelView(labelText: "Fructus", labelImage: EIcons.info_circle.rawValue)) {
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)

                            Text("Most fruist are naturally low int fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                    }

                    GroupBox(label: SettingsLabelView(labelText: "Customization", labelImage: EIcons.paintbrush.rawValue)) {
                        Divider().padding(.vertical, 4)

                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)

                        Toggle(isOn: $isOnboarding) {
                            Text(isOnboarding ? "Restarted".uppercased() : "Restart".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                                .foregroundColor(isOnboarding ? .green : .secondary)
                        }
                    }
                    .padding()
                    .background(Color(UIColor.tertiarySystemBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous)))
                }

                GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: EIcons.apps_iphone.rawValue)) {
                    Divider().padding(.vertical, 4)
                    SettingsRowView(name: "Developer", content: "Rafael Batista")
                    SettingsRowView(name: "Designer", content: "Rafael Batista")
                    SettingsRowView(name: "Compatibility", content: "iOS 15.5")
                    SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                    SettingsRowView(name: "LinkedIn", linkLabel: "Rafael Batista", linkDestination: "www.linkedin.com/in/rafa-batista/")
                    SettingsRowView(name: "SwiftUI", content: "5.0")
                    SettingsRowView(name: "Version", content: "1.0.0")

                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                    }
                }
            }
            .padding()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
