import SwiftUI

@main
struct MyApp: App {
    
    @State var currentChapter: Int = 1
    @State var wallet = Wallet()
    
    var body: some Scene {
        WindowGroup {
            switch currentChapter {
            case 1:
                IntroductionView(currentChapter: $currentChapter)
            case 2:
                WalletView(currentChapter: $currentChapter, wallet: $wallet)
            case 3:
                TransactionsView(currentChapter: $currentChapter)
            case 4:
                NetworkView(currentChapter: $currentChapter)
            case 5:
                MinersView(currentChapter: $currentChapter)
            case 6:
                BlockchainView(currentChapter: $currentChapter)
            case 7:
                ConsensusView(currentChapter: $currentChapter)
            case 8:
                POWView(currentChapter: $currentChapter)
            case 9:
                RecapView(currentChapter: $currentChapter)
            default:
                ThankYouView()
            }
        }
    }
}
