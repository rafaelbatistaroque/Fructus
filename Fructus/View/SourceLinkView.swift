import SwiftUI

struct SourceLinkView: View {
    var body: some View {
        GroupBox(){
            HStack{
                Text("Content source")

                Spacer()

                Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)

                Image(systemName: EIcons.arrow_up_right_square.rawValue)
            }
            .font(.footnote)
        }
    }
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
