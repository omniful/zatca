class ZATCA::UBL::CommonAggregateComponents::DocumentReference < ZATCA::UBL::BaseComponent
  attr_reader :id, :issue_date, :issue_time, :document_type_code

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
