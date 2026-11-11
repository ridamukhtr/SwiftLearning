enum DIPExample {

    // DIP Violation

    struct CardPaymentViolation {
        func processPayment(amount: Double) {
            print("Processing card payment: \(amount)")
        }
    }

    struct PaymentManagerViolation {
        let payment = CardPaymentViolation()

        func checkout(amount: Double) {
            payment.processPayment(amount: amount)
        }
    }

    // DIP

    /// abstraction
    protocol PaymentMethod {
        func processPayment(amount: Double)
    }

    struct CardPayment: PaymentMethod {
        func processPayment(amount: Double) {
            print("Processing card payment: \(amount)")
        }
    }

    struct JazzCashPayment: PaymentMethod {
        func processPayment(amount: Double) {
            print("Processing JazzCash payment: \(amount)")
        }
    }

    // The manager only depends on the protocol. It doesn't need to know the concrete payment type.
    struct PaymentManager {

        /// dependency injection
        let paymentMethod: any PaymentMethod

        init(paymentMethod: any PaymentMethod) {
            self.paymentMethod = paymentMethod
        }

        func checkout(amount: Double) {
            paymentMethod.processPayment(amount: amount)
        }
    }

    static func demo() {
        print("\n=== DIP ===")

        print("-- violation (manager hard-wired to CardPaymentViolation) --")
        let bad = PaymentManagerViolation()
        bad.checkout(amount: 500)

        print("-- fix (manager depends on PaymentMethod protocol) --")
        let cardManager = PaymentManager(paymentMethod: CardPayment())
        let jazzCashManager = PaymentManager(paymentMethod: JazzCashPayment())
        cardManager.checkout(amount: 500)
        jazzCashManager.checkout(amount: 1000)
    }
}
