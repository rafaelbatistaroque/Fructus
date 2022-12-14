import SwiftUI

struct FruitCardView: View {
    var fruit: Fruit

    @State private var IsAnimating: Bool = false

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 6, y: 8)
                    .scaleEffect(IsAnimating ? 1.0 : 0.6)

                Text(fruit.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 2, x: 2, y: 2)

                Text(fruit.headLine)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)

                StartButtonView()
            }
        }
        .onAppear{
            withAnimation(.easeOut(duration: 0.5)){
                IsAnimating = true
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(
            LinearGradient(colors: fruit.gradientColors, startPoint: UnitPoint.top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[1])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
