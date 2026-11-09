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
        func processPayment(amount: Double) {
            print("Processing payment of \(amount)")
        }
    }

    struct PaymentRepository {
        func savePaymentDetails() {
            print("Saving payment details to database")
        }
    }

    struct ReceiptService {
        func sendReceipt() {
            print("Sending receipt to customer")
        }
    }

    static func demo() {
        let processor = PaymentProcessor()
        processor.processPayment(amount: 500)

        let repository = PaymentRepository()
        repository.savePaymentDetails()

        let receipt = ReceiptService()
        receipt.sendReceipt()
    }
}
