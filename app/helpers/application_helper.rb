module ApplicationHelper
  def format_pennies(val)
    if val.nil?
      val = 0.00
    end
    "$#{sprintf("%.2f", val.to_f / 100)}"
  end
end
