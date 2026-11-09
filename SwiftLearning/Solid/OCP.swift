enum OCPExample {

    // OCP Violation
    // app supports two payment methods: Card, Cash

    struct PaymentManagerViolation {
        func processPayment(method: String, amount: Double) {
            if method == "card" {
                print("step1 Processing card payment: \(amount)")
            } else if method == "cash" {
                print("step1 Processing cash payment: \(amount)")
            }
        }
    }

    // OCP

    protocol PaymentMethod {
        func processPayment(amount: Double)
    }

    struct CardPayment: PaymentMethod {
        func processPayment(amount: Double) {
            print("Processing card payment: \(amount)")
        }
    }

    struct CashPayment: PaymentMethod {
        func processPayment(amount: Double) {
            print("Processing cash payment: \(amount)")
        }
    }

    // now add a new payment method without changing the existing code.

    struct JazzCashPayment: PaymentMethod {
        func processPayment(amount: Double) {
            print("Processing JazzCash payment: \(amount)")
        }
    }

    struct PaymentManager {
        let paymentMethod: any PaymentMethod

        init(paymentMethod: any PaymentMethod) {
            self.paymentMethod = paymentMethod
        }

        func checkout(amount: Double) {
            paymentMethod.processPayment(amount: amount)
        }
    }

    static func demo() {
        let manager = PaymentManager(paymentMethod: JazzCashPayment())
        manager.checkout(amount: 1000)
    }
}
