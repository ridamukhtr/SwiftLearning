enum LSPExample {

    // LSP Violation

    protocol PaymentMethod {
        func processPayment(amount: Double)
    }

    struct CardPaymentViolation: PaymentMethod {
        func processPayment(amount: Double) {
            print("step1 Processing card payment: \(amount)")
        }
    }

    struct CashPaymentViolation: PaymentMethod {
        func processPayment(amount: Double) {
            print("step1 Processing cash payment: \(amount)")
        }
    }

    struct RefundPaymentViolation: PaymentMethod {
        func processPayment(amount: Double) {
            // A PaymentMethod's contract is "take money in". A refund is the opposite,
            // so honouring the same method name here would quietly give wrong behaviour
            // to any caller holding this as a PaymentMethod. That's the LSP violation.
            fatalError("Refund is not a payment")
        }
    }

    // LSP

    protocol PaymentMethodLSP {
        func processPayment(amount: Double)
    }

    protocol RefundablePaymentMethod {
        func refundPayment(amount: Double)
    }

    struct CardPayment: PaymentMethodLSP {
        func processPayment(amount: Double) {
            print("Processing card payment: \(amount)")
        }
    }

    struct RefundPayment: RefundablePaymentMethod {
        func refundPayment(amount: Double) {
            print("Refunding payment: \(amount)")
        }
    }

    struct PaymentManager {
        let paymentMethod: any PaymentMethodLSP

        init(paymentMethod: any PaymentMethodLSP) {
            self.paymentMethod = paymentMethod
        }

        func checkout(amount: Double) {
            paymentMethod.processPayment(amount: amount)
        }
    }

    static func demo() {
        print("\n=== LSP ===")

        print("-- violation (RefundPaymentViolation pretends to be a PaymentMethod) --")
        // Not calling RefundPaymentViolation().processPayment(...) because it
        // fatalErrors — that crash *is* the LSP violation: a caller holding it
        // as a PaymentMethod would break at runtime.
        print("(skipped — calling it would crash; that's the violation)")

        print("-- fix (refund has its own protocol) --")
        let card = CardPayment()
        card.processPayment(amount: 500)

        let refund = RefundPayment()
        refund.refundPayment(amount: 200)

        let manager = PaymentManager(paymentMethod: CardPayment())
        manager.checkout(amount: 1000)
    }
}
