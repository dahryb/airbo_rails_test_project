module ApplicationHelper
  def charge_info(charge)
    "#{charge.customer.first_name}, #{charge.amount}, #{charge.updated_at.strftime("%d %b, %Y, %I:%M %p")}"
  end
end
