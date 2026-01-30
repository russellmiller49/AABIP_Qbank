import Shared
import SwiftUI

struct DuelArenaView: View {
    let duel: Shared.DuelState
    let enemy: Shared.Enemy

    @Binding var battleEvent: BattleEvent?

    @State private var shakeTrigger: CGFloat = 0
    @State private var shakeAmount: CGFloat = 0
    @State private var bobOffset: CGFloat = 0
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        let isPhone = horizontalSizeClass == .compact
        let attackOffset: CGFloat = (battleEvent == .playerAttack || battleEvent == .enemyAttack) ? 60 : 0

        ZStack {
            RetroDojoBackground()

            HStack {
                RetroHealthBar(current: Int(duel.playerHP), maxHP: 100, label: "YOU")
                Spacer()
                RetroHealthBar(current: Int(duel.enemyHP), maxHP: Int(duel.enemyMaxHP), label: String(enemy.name.prefix(8)))
            }
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

            RetroVirus(isHit: battleEvent?.isEnemyHit ?? false, primaryColor: Color(hex: enemy.themeColor))
                .frame(width: 140, height: 140)
                .offset(x: battleEvent == .enemyAttack ? -attackOffset : 0, y: -bobOffset)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                .padding(.trailing, 40)
                .padding(.bottom, 40)
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: battleEvent)

            RetroMedic(isHit: battleEvent?.isPlayerHit ?? false)
                .frame(width: 160, height: 160)
                .offset(x: battleEvent == .playerAttack ? attackOffset : 0, y: bobOffset)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .padding(.leading, 40)
                .padding(.bottom, 20)
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: battleEvent)

            if let event = battleEvent, case let .enemyHit(damage, isCrit) = event {
                Text("-\(damage)")
                    .font(.system(size: 32, weight: .black, design: .monospaced))
                    .foregroundStyle(isCrit ? Color.yellow : Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                    .padding(.trailing, 80)
                    .padding(.bottom, 100)
            }

            if let event = battleEvent, case let .playerHit(damage) = event {
                Text("-\(damage)")
                    .font(.system(size: 32, weight: .black, design: .monospaced))
                    .foregroundStyle(RetroColors.hpRed)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .padding(.leading, 80)
                    .padding(.bottom, 120)
            }
        }
        .frame(height: isPhone ? 250 : 300)
        .modifier(ShakeEffect(amount: shakeAmount, shakesPerUnit: 4, animatableData: shakeTrigger))
        .onAppear {
            bobOffset = 0
            withAnimation(.linear(duration: 0.6).repeatForever(autoreverses: true)) {
                bobOffset = 10
            }
        }
        .onChange(of: battleEvent) { _, newValue in
            if newValue?.isEnemyHit == true || newValue?.isPlayerHit == true {
                shakeAmount = 15
                withAnimation(.linear(duration: 0.4)) {
                    shakeTrigger += 1
                }
            }
        }
    }
}

// MARK: - Retro Components

private struct RetroColors {
    static let skyBlue = Color(hex: "62A6FF")
    static let floorTan = Color(hex: "D4A86A")
    static let floorDark = Color(hex: "A67C45")
    static let medicWhite = Color.white
    static let medicBlue = Color(hex: "2255AA")
    static let medicSkin = Color(hex: "FFCCAA")
    static let virusGreen = Color(hex: "44AA22")
    static let virusDark = Color(hex: "225511")
    static let virusSpot = Color(hex: "AA44AA")
    static let hpRed = Color(hex: "E71D36")
    static let hpYellow = Color(hex: "FF9F1C")
    static let hpGreen = Color(hex: "2EC4B6")
    static let border = Color.black
}

private struct PixelSprite: View {
    let grid: [String]
    let palette: [Character: Color]
    var pixelSize: CGFloat? = nil

    var body: some View {
        let height = grid.count
        let width = grid.first?.count ?? 0

        let frameWidth = pixelSize.map { CGFloat(width) * $0 }
        let frameHeight = pixelSize.map { CGFloat(height) * $0 }

        Canvas { context, size in
            guard width > 0, height > 0 else { return }
            let cellWidth = size.width / CGFloat(width)
            let cellHeight = size.height / CGFloat(height)

            for (rowIndex, row) in grid.enumerated() {
                for (colIndex, char) in row.enumerated() {
                    if let color = palette[char] {
                        let rect = CGRect(
                            x: CGFloat(colIndex) * cellWidth,
                            y: CGFloat(rowIndex) * cellHeight,
                            width: cellWidth + 1,
                            height: cellHeight + 1
                        )
                        context.fill(Path(rect), with: .color(color))
                    }
                }
            }
        }
        .frame(width: frameWidth, height: frameHeight)
    }
}

private struct RetroMedic: View {
    let isHit: Bool

    var body: some View {
        let grid = [
            "....WWWWWW......",
            "...WWWWWWWW.....",
            "...WWRWWRWW.....",
            "...WWWWWWWW.....",
            "....SSSSSS......",
            "....SBSBSS......",
            "....SSSSSS......",
            "...BBBBBBBB.....",
            "..BBBBBBBBBB....",
            "..BBBBBBBBBB....",
            "..BB..BB..BB....",
            "......BB........",
            ".....BBBB.......",
            ".....BBBB.......",
            "....BB..BB......",
            "...BB....BB....."
        ]

        let palette: [Character: Color] = [
            "W": RetroColors.medicWhite,
            "B": RetroColors.medicBlue,
            "S": RetroColors.medicSkin,
            "R": RetroColors.hpRed
        ]

        PixelSprite(grid: grid, palette: palette)
            .opacity(isHit ? 0.3 : 1.0)
    }
}

private struct RetroVirus: View {
    let isHit: Bool
    let primaryColor: Color

    var body: some View {
        let grid = [
            "......D..D......",
            "....D.G..G.D....",
            "...DGGGGGGGGD...",
            "..DGGPGGGPGGGD..",
            ".DGGGGGGGGGGGGD.",
            ".GGPEEEGGGEEEGP.",
            ".GGPEBEGGGEBEGP.",
            "DGGGPEEGGGEEPGGD",
            ".GGGGGGGGGGGGGG.",
            ".DGGGGPPGGGGGGD.",
            "..DGGPPPPGGGGD..",
            "...DGGGGGGGGD...",
            "....D.G..G.D....",
            "......D..D......",
            "................",
            "................"
        ]

        let palette: [Character: Color] = [
            "G": primaryColor,
            "D": RetroColors.virusDark,
            "P": RetroColors.virusSpot,
            "E": Color.white,
            "B": Color.black
        ]

        PixelSprite(grid: grid, palette: palette)
            .opacity(isHit ? 0.3 : 1.0)
    }
}

private struct RetroHealthBar: View {
    let current: Int
    let maxHP: Int
    let label: String

    private func blockColor(for index: Int, hpPercent: CGFloat, blocksFilled: Int) -> Color {
        if index >= blocksFilled {
            return Color.black.opacity(0.5)
        } else if hpPercent > 0.5 {
            return RetroColors.hpGreen
        } else if hpPercent > 0.25 {
            return RetroColors.hpYellow
        } else {
            return RetroColors.hpRed
        }
    }

    var body: some View {
        let safeMax = maxHP > 0 ? maxHP : 1
        let hpPercent = CGFloat(current) / CGFloat(safeMax)
        let blocksTotal: Int = 10
        let rawFilled = Int(hpPercent * CGFloat(blocksTotal))
        let blocksFilled = min(max(rawFilled, 0), blocksTotal)

        VStack(alignment: .leading, spacing: 4) {
            Text(label.uppercased())
                .font(.system(size: 12, weight: .black, design: .monospaced))
                .foregroundStyle(Color.white)

            HStack(spacing: 2) {
                ForEach(0..<blocksTotal) { (index: Int) in
                    Rectangle()
                        .fill(blockColor(for: index, hpPercent: hpPercent, blocksFilled: blocksFilled))
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(height: 16)
            .padding(2)
            .background(Color.gray)
            .overlay {
                Rectangle().stroke(Color.black, lineWidth: 2)
            }
        }
    }
}

private struct RetroDojoBackground: View {
    var body: some View {
        Canvas { context, size in
            let skyHeight = size.height * 0.6
            context.fill(Path(CGRect(x: 0, y: 0, width: size.width, height: skyHeight)), with: .color(RetroColors.skyBlue))

            let floorTop = skyHeight
            context.fill(
                Path(CGRect(x: 0, y: floorTop, width: size.width, height: size.height - floorTop)),
                with: .color(RetroColors.floorTan)
            )

            let centerX = size.width / 2
            let lines = 8
            for i in -lines...lines {
                let xStart = centerX + CGFloat(i) * 20
                let xEnd = centerX + CGFloat(i) * 150

                var path = Path()
                path.move(to: CGPoint(x: xStart, y: floorTop))
                path.addLine(to: CGPoint(x: xEnd, y: size.height))
                path.addLine(to: CGPoint(x: xEnd + 5, y: size.height))
                path.addLine(to: CGPoint(x: xStart + 2, y: floorTop))
                path.closeSubpath()

                context.fill(path, with: .color(RetroColors.floorDark))
            }

            let horizon = CGRect(x: 0, y: floorTop - 2, width: size.width, height: 4)
            context.fill(Path(horizon), with: .color(Color.black))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Effects

private struct ShakeEffect: GeometryEffect {
    var amount: CGFloat
    var shakesPerUnit: CGFloat
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        let translationX = amount * sin(animatableData * .pi * shakesPerUnit)
        return ProjectionTransform(CGAffineTransform(translationX: translationX, y: 0))
    }
}

enum BattleEvent: Equatable {
    case playerAttack
    case enemyAttack
    case playerHit(damage: Int)
    case enemyHit(damage: Int, isCrit: Bool)

    var isPlayerHit: Bool {
        if case .playerHit = self { return true }
        return false
    }

    var isEnemyHit: Bool {
        if case .enemyHit = self { return true }
        return false
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a: UInt64
        let r: UInt64
        let g: UInt64
        let b: UInt64

        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
