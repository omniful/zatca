class ZATCA::UBL::CommonAggregateComponents::InvoiceLine < ZATCA::UBL::BaseComponent
  # <cac:InvoiceLine>
  # <cbc:ID>1</cbc:ID>
  # <cbc:InvoicedQuantity unitCode="PCE">44.000000</cbc:InvoicedQuantity>
  # <cbc:LineExtensionAmount currencyID="SAR">966.00</cbc:LineExtensionAmount>
  # <cac:TaxTotal>
  #     <cbc:TaxAmount currencyID="SAR">144.90</cbc:TaxAmount>
  #     <cbc:RoundingAmount currencyID="SAR">1110.90</cbc:RoundingAmount>

  # </cac:TaxTotal>
  # <cac:Item>
  #     <cbc:Name>dsd</cbc:Name>
  #     <cac:ClassifiedTaxCategory>
  #         <cbc:ID>S</cbc:ID>
  #         <cbc:Percent>15.00</cbc:Percent>
  #         <cac:TaxScheme>
  #             <cbc:ID>VAT</cbc:ID>
  #         </cac:TaxScheme>
  #     </cac:ClassifiedTaxCategory>
  # </cac:Item>
  # <cac:Price>
  #     <cbc:PriceAmount currencyID="SAR">22.00</cbc:PriceAmount>
  #     <cac:AllowanceCharge>
  #         <cbc:ChargeIndicator>false</cbc:ChargeIndicator>
  #         <cbc:AllowanceChargeReason>discount</cbc:AllowanceChargeReason>
  #         <cbc:Amount currencyID="SAR">2.00</cbc:Amount>
  #     </cac:AllowanceCharge>
  # </cac:Price>
  # </cac:InvoiceLine>

  def initialize(
    invoiced_quantity:, invoiced_quantity_unit_code:,
    line_extension_amount:, tax_total:, item:,
    price:, allowance_charge: nil, document_reference: nil, currency_id: "SAR"
  )
    super()

    @invoiced_quantity = invoiced_quantity
    @invoiced_quantity_unit_code = invoiced_quantity_unit_code
    @line_extension_amount = line_extension_amount
    @tax_total = tax_total
    @item = item
    @price = price
    @allowance_charge = allowance_charge
    @document_reference = document_reference
    @currency_id = currency_id
  end

  def name
    "cac:InvoiceLine"
  end

  def elements
    [
      ZATCA::UBL::BaseComponent.new(name: "cbc:ID", value: index),
      ZATCA::UBL::BaseComponent.new(name: "cbc:InvoicedQuantity", value: @invoiced_quantity, attributes: {unitCode: @invoiced_quantity_unit_code}),
      ZATCA::UBL::BaseComponent.new(name: "cbc:LineExtensionAmount", value: @line_extension_amount, attributes: {currencyID: @currency_id}),
      @document_reference,
      @tax_total,
      @item,
      @price,
      @allowance_charge
    ]
  end
end
