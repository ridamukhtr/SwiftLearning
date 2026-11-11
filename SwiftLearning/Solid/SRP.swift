enum SRPExample {

    // SRP Violation

    struct PaymentManager {
        func processPayment(amount: Double) {
            print("step 1: Processing payment of \(amount)")
        }

        func savePaymentDetails() {
            print("step 2: Saving payment details to database")
        }

        func sendReceipt() {
            print("Sending receipt to customer")
        }
    }

    // SRP

    struct PaymentProcessor {
        func process(amount: Double) {
            print("Processing payment of \(amount)")
        }
    }

    struct PaymentRepository {
        func savePayment() {
            print("Saving payment details to database")
        }
    }

    struct ReceiptService {
        func send() {
            print("Sending receipt to customer")
        }
    }

    static func demo() {
        print("\n=== SRP ===")

        print("-- violation (one struct does everything) --")
        let god = PaymentManager()
        god.processPayment(amount: 500)
        god.savePaymentDetails()
        god.sendReceipt()

        print("-- fix (each struct does one thing) --")
        PaymentProcessor().processPayment(amount: 500)
        PaymentRepository().savePaymentDetails()
        ReceiptService().sendReceipt()
    }
}
