class Payslip {
  final int paymentBasicSalaryAmount;
  final int allowancesAmount;
  final int additionsAmount;
  final int deductionsAmount;
  final int netTotalAmount;
  final String currency;
  const Payslip({
    this.paymentBasicSalaryAmount = 0,
    this.allowancesAmount = 0,
    this.additionsAmount = 0,
    this.deductionsAmount = 0,
    this.netTotalAmount = 0,
    this.currency = '',
  });
}
