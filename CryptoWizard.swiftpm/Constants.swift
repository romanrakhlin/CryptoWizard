//
//  File.swift
//  CryptoWizard
//
//  Created by Roman Rakhlin on 4/12/22.
//

import SwiftUI

// Introduction
let introduction_one = ScreenView(text: "Hello there! My namy is NFTdalf and I’am a Crypto Wizard!", image: "wizard")
let introduction_two = ScreenView(text: "Cryptocurrecies are really popular right now. This is truly the future! And I want to help you figure out exactly how it works.", image: "wizard")
let introduction_three = ScreenView(text: "We are going to cover only Bitcoin. Other technologies are build up on top of it.", image: "wizard")
let introduction_four = ScreenView(text: "Are you ready for really interesitng adventure to the world of Cryto? If so, get ready cause we are starting it right now!", image: "wizard")

// Wallet
let wallet_one = ScreenView(text: "The wallet is build from a 32 hexideciamal numbers - called a Private Key.", image: "hex_table")
let wallet_two = ScreenView(text: "Don't tell anyone your private key! Because if you lose it, all funds are going to be stolen!!", image: "wizard")
let wallet_three = ScreenView(text: "You probably ask - how to reacieve funds on my wallet if I can’t tell anyone my wallet address?", image: "wizard")
let wallet_four = ScreenView(text: "To do this, we are going to use SHA-256 Algorithm.", image: "sha-256")
let wallet_five = ScreenView(text: "It desguise the key so it can’t be unmasked. Because it works only ONE WAY.", image: "private_to_address")
let wallet_six = ScreenView(text: "Now you all set!", image: "wizard")

// Transactions
let transactions_one = ScreenView(text: "I sent you 5 BTC. Let’s buy something online!", image: "wizard")
let transactions_two = ScreenView(text: "So, you have chosen an item, this means that:", image: "math")
let transactions_three = ScreenView(text: "This means that you having 3 BTC left to spend.", image: "wizard")
let transactions_four = ScreenView(text: "The Bitcoin doesn’t have balances related to the wallets! The amout of money you can spent is calculated.", image: "wizard")
let transactions_five = ScreenView(text: "This is called UTXO (Unspent Transaction Output).", image: "wizard")
let transactions_six = ScreenView(text: "How your UTXO looks after recieving and buying.", image: "utxo")
let transactions_seven = ScreenView(text: "Your UTXO is looking like that right now.", image: "full_utxo")
let transactions_eight = ScreenView(text: "It's considered really simple by the way.", image: "wizard")
let transactions_nine = ScreenView(text: "UTXOs can be complex.", image: "complex_utxo")

// Network
let network_one = ScreenView(text: "The Network is looking something like this.", image: "network")
let network_two = ScreenView(text: "The network has TWO types of nodes", image: "nodes")
let network_three = ScreenView(text: "Every node has a Mempool!", image: "wizard")
let network_four = ScreenView(text: "Mempool is the storage of UTXOs. Every confirmed UTXO is stored there to be further performed", image: "mempool")
let network_five = ScreenView(text: "And our UTXO is going throught the network right into a Mempool of a node located next to us.", image: "wizard")

// Miners
let miners_one = ScreenView(text: "The main task of miners is to perform all transactions (UTXOs) and they are paid for that", image: "wizard")
let miners_two = ScreenView(text: "They starting from UTXOs from their local Mempool", image: "local_mempool")
let miners_three = ScreenView(text: "The income of Miner is consists of Fee and “Block Reward”", image: "salary")
let miners_four = ScreenView(text: "Block Reward is a Bitcoin. This is where Bitcoin comes from!", image: "wizard")
let miners_five = ScreenView(text: "There are going to be only 21 Million Bitcoins.", image: "21")
let miners_six = ScreenView(text: "”Halvenings” prolonging the exitence of uncreated Bitcoin by cutting Block Reward by half.", image: "wizard")
let miners_seven = ScreenView(text: "Without Helvenings, Bitcoin would be mined in just a couple of years.", image: "wizard")
let miners_eight = ScreenView(text: "This means that miners earning less and less all the time? No!", image: "wizard")
let miners_nine = ScreenView(text: "Bitcoin code has a solution for that. Block Reward is lower and lowe, while Fee is becoming higher!", image: "chart")
let miners_ten = ScreenView(text: "So the income of miners is going to be the same every time!", image: "wizard")
let miners_eleven = ScreenView(text: "After collection all UTXOs from local Mempool, he goes to the Mempools of local nodes.", image: "mempools")

// Blockchain
let blockchain_one = ScreenView(text: "The Blockchain is simply the blocks, connected to each other.", image: "blockchain")
let blockchain_two = ScreenView(text: "A Block looks something like this.", image: "block")
let blockchain_three = ScreenView(text: "Hash is a sequnce of 256 leters and numbers (Hexidecimal)", image: "wizard")
let blockchain_four = ScreenView(text: "It is formed from list of UTXOs the miner collected & the HASH of a previus Block", image: "block_content")
let blockchain_five = ScreenView(text: "Thus, each block in Blockchain is conected to each other!", image: "connection")
let blockchain_six = ScreenView(text: "For example, if you to change that instead of 5 BTC you recieved 100 BTC, you would change the UTXO, threrefore the block's hash also changes.", image: "wizard")
let blockchain_seven = ScreenView(text: "So now you have to rebuild whole Blockchain again! This is nearly imposible, because the previous version of blockhain is keep growing.", image: "outpace")
let blockchain_eight = ScreenView(text: "That is why Bitcoin has a rule, the biggest Blockchain is always truth!", image: "wizard")
let blockchain_nine = ScreenView(text: "I forgot to mention, every node in Blockchain besides of Mempool has it’s own version of Blockchain", image: "wizard")
let blockchain_ten = ScreenView(text: "After creating a new Block and adding it to the Blockchain, miner sends this version of blockchain to every node in the network!", image: "spread")

// Consensus
let consensus_one = ScreenView(text: "When something happens in the network, new transaction or something else, all nodes speak with aech other.", image: "wizard")
let consensus_two = ScreenView(text: "Nodes are matching thier verison of the blockchain and tring to reach the consensus.", image: "wizard")
let consensus_three = ScreenView(text: "Only when consensus is reached, the operation is going to be performed!", image: "wizard")

// POW
let pow_one =  ScreenView(text: "What is ”Mining” anyway?", image: "wizard")
let pow_two =  ScreenView(text: "There is another part that miner needs to find to create a hash for a block, which is a random number “Nonce”.", image: "wizard")
let pow_three =  ScreenView(text: "We simply generate random value “Nonce”, then creating a Hash with it and look if hash is smaller than “Target”.", image: "nonce")
let pow_four =  ScreenView(text: "What is the “Target”? Well, it depends on the complexity of the network.", image: "wizard")
let pow_five =  ScreenView(text: "If network has so many miners, “Target” is going to be higher.", image: "wizard")
let pow_six =  ScreenView(text: "Miners are competing with each other, and only one miners is going to win! Win - add his block to the blockchain and get a reward.", image: "wizard")
let pow_seven =  ScreenView(text: "That is why this approach called - Proof of Work, miners are prooving their work (find “Nonce” faster that others) and getting a reward.", image: "wizard")

// Recap
let recap_one = ScreenView(text: "Firstly, we created a Bitcoin Address", image: "wizard")
let recap_two = ScreenView(text: "Then we recieved some funds and created a transaction for buying item", image: "full_utxo")
let recap_three = ScreenView(text: "Our transaction went right into mempool of a local node", image: "utxo_list")
let recap_four = ScreenView(text: "Miner picked up our transaction in that mempoll. Also got the hash of a previous block.", image: "previous")
let recap_five = ScreenView(text: "The network generated a “Target” and we generating “Nonce” over and over again to create a hash smaller than a “Target”", image: "target_math")
let recap_six = ScreenView(text: "Miner generated found the right hash and added the new block with out transaction inside to the blockchain", image: "new_block")
let recap_seven = ScreenView(text: "This version of the blockhain is transfered to every node in the whole network!", image: "spread")
let recap_eight = ScreenView(text: "This means that our transaction has been executed and the seller received his funds!", image: "wizard")

// Data Arrays
let introductionScreens = [introduction_one, introduction_two, introduction_three, introduction_four]
let walletScreens = [wallet_one, nil, wallet_two, wallet_three, nil, wallet_four, wallet_five, nil, wallet_six]
let transactionsScreens = [transactions_one, nil, transactions_two, transactions_three, transactions_four, transactions_five, transactions_six, transactions_seven, transactions_eight, transactions_nine]
let networkScreens = [network_one, network_two, network_three, network_four, network_five]
let minersScreens = [miners_one, miners_two, miners_three, miners_four, miners_five, miners_six, miners_seven, miners_eight, miners_nine, miners_ten, miners_eleven]
let blockchainScreens = [blockchain_one, blockchain_two, blockchain_three, blockchain_four, blockchain_five, blockchain_six, blockchain_seven, blockchain_eight, blockchain_nine, blockchain_ten]
let consensusScreens = [consensus_one, consensus_two, consensus_three]
let POWScreens = [pow_one, pow_two, pow_three, pow_four, pow_five, pow_six, pow_seven]
let recapScreens = [recap_one, recap_two, recap_three, recap_four, recap_five, recap_six, recap_seven, recap_eight]
