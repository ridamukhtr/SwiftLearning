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
        print("-- ISP --")
        // Violation: cash is forced to implement saveCard() even though it means nothing.
        let violation = CashPaymentViolation()
        violation.processPayment(amount: 300)
        violation.saveCard()

        // Fix: cash only conforms to PaymentProcessing. Card picks up CardSaving too.
        let card = CardPayment()
        card.processPayment(amount: 500)
        card.saveCard()

        let cash = CashPayment()
        cash.processPayment(amount: 100)
    }
}
