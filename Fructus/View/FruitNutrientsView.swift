import SwiftUI

struct FruitNutrientsView: View {
    var fruit: Fruit
    var nutrients: [String] = ["Energy", "Sugar", "Fat","Protein", "Vitamins", "Minerals"]

    var body: some View {
        GroupBox() {
            DisclosureGroup("Nutritional value per 100g") {
                ForEach(0..<nutrients.count, id: \.self) { item in
                    Divider()
                        .padding(.vertical, 2)

                    HStack {
                        Group {
                            Image(systemName: EIcons.info_circle.rawValue)
                            Text(nutrients[item])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(.system(.body).bold())

                        Spacer(minLength: 25)

                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                            .font(.footnote)
                    }
                }
            }
        }
    }
}

struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(fruit: fruitsData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
