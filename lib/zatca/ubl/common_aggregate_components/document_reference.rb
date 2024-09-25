class ZATCA::UBL::CommonAggregateComponents::DocumentReference < ZATCA::UBL::BaseComponent
  attr_reader :id, :issue_date, :issue_time, :document_type_code

  # id: invoice_data[:invoice_number], # KSA-26 Prepayment Invoice ID
  #   issue_date: parse_date(invoice_data[:invoice_date]), # KSA-28 Prepayment Issue Date
  #   issue_time: parse_time(invoice_data[:invoice_time]),# KSA-29 Prepayment Issue Time
  #   document_type_code: "386" # Prepayment document type KSA-30

  def initialize(id:, issue_date:, issue_time:, document_type_code: "386")
    super()

    @id = id
    @issue_date = issue_date
    @issue_time = issue_time
    @document_type_code = document_type_code
  end

  def name
    "cac:DocumentReference"
  end


  def elements
    [
      ZATCA::UBL::BaseComponent.new(name: "cbc:ID", value: @id),
      ZATCA::UBL::BaseComponent.new(name: "cbc:IssueDate", value: @issue_date),
      ZATCA::UBL::BaseComponent.new(name: "cbc:IssueTime", value: @issue_time),
      ZATCA::UBL::BaseComponent.new(name: "cbc:DocumentTypeCode", value: @document_type_code)
    ]
  end
end
