enum ISPExample {

    // ISP Violation

    protocol PaymentServices {
        func processPayment(amount: Double)
        func refundPayment(amount: Double)
        func saveCard()
        func sendReceipt()
    }

    struct CashPaymentViolation: PaymentServices {
        func processPayment(amount: Double) {
            print("step1 Processing cash payment: \(amount)")
        }

        func refundPayment(amount: Double) {
            print("step1 Refunding cash payment: \(amount)")
        }

        func saveCard() {
            // no need for cash
        }

        func sendReceipt() {
            print("step1 Sending receipt for cash payment")
        }
    }

    // ISP

    protocol PaymentProcessing {
        func processPayment(amount: Double)
    }

    protocol Refundable {
        func refundPayment(amount: Double)
    }

    protocol CardSaving {
        func saveCard()
    }

    protocol ReceiptSending {
        func sendReceipt()
    }

    struct CardPayment: PaymentProcessing, CardSaving {
        func processPayment(amount: Double) {
            print("Processing card payment: \(amount)")
        }

        func saveCard() {
            print("Saving card information")
        }
    }

    struct CashPayment: PaymentProcessing {
        func processPayment(amount: Double) {
            print("Processing cash payment: \(amount)")
        }
    }

    static func demo() {
        print("\n=== ISP ===")

        print("-- violation (cash forced to implement saveCard) --")
        let violation = CashPaymentViolation()
        violation.processPayment(amount: 300)
        violation.saveCard()   // empty, means nothing for cash

        print("-- fix (cash only conforms to PaymentProcessing) --")
        let card = CardPayment()
        card.processPayment(amount: 500)
        card.saveCard()

        let cash = CashPayment()
        cash.processPayment(amount: 100)
    }
}
