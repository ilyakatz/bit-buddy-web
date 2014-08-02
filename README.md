# BitBuddy

## Goals:

This Bitcoin wallet serves to help paranoid users of Coinbase wallets.

### Privacy freak ( available )

* Problem:

   Bobby used an online auction site to sell a product. Buyer agreed to pay with Bitcoin, so Bobby needs to send his wallet. However, if Bobby sends the buyer his usual wallet, the buyer will be able to see all transactions in the future using the public ledger.

   **Bobby wants to Bitcoin money into his regular wallet but stay anonymous**

* Solution:

  With BitBuddy Bobby can generate a new wallet which will redirect all incoming payments to his regular wallet

### Fat finger variant ( planned )

* Problem

   Copy-pasting wallets from one screen to the next is error prone.

   **Jane would rather select a name from her contact book to send Bitcoin to her friends**

### Trust but verify ( available)

* Problem

   Before adding a trusted contact, the wallet verifies that there is activity associated with the wallet. If the blockchain doesn't return any result, consider sending a test transaction before sending any significant amount

   **When adding a new contact, verify that the wallet is 'active'**

## Setup

* Enable touch events in Chrome
  * https://chrome.google.com/webstore/detail/ripple-emulator-beta/geelfhphabnejjhdalkjhgipohgpdnoc/related

* Register a project in [google console](https://console.developers.google.com/project)
  * https://console.developers.google.com/project/apps~argon-zoo-650/apiui/credential

* Register an application in [Coinbase](https://coinbase.com/oauth/applications)
  * http://127.0.0.1:3000/users/auth/coinbase/callback

* Configure API access in gogole console
  * Contacts

# Docs
https://developers.google.com/api-client-library/javascript/start/start-js
http://stackoverflow.com/questions/19633590/error-invalid-client-no-registered-origin
