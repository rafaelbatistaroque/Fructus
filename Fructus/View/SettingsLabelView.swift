import SwiftUI

struct SettingsLabelView: View {
    var labelText: String
    var labelImage: String

    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Fructus", labelImage: EIcons.info_circle.rawValue)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
