module ApplicationHelper

  def gross_income_upload
    return 0 unless Sale.any?

    gross_income_upload = 0
    Sale.find_each do |sale|
      if sale.last_upload
        gross_income_upload = gross_income_upload + sale.purchase_count * sale.item_price
      end
    end
    gross_income_upload
  end

  def all_time_gross
    return 0 unless Sale.any?

    Sale.find_each.sum { |sale| sale.purchase_count * sale.item_price }
  end

end
