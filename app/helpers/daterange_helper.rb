module DaterangeHelper
  def daterange_input form, date_one, date_two
    content_tag(:div, class: ["input-daterange", "input-group"], id: "datepicker", 'data-provide': "datepicker", 'data-date-format': 'dd-M-yyyy', 'data-date-autoclose': 'true') do
      concat(form.text_field date_one, class: ['input-sm', 'form-control'], placeholder: 'Start date')
      concat(content_tag(:span, "to", class: "input-group-addon"))
      concat(form.text_field date_two, class: ['input-sm', 'form-control'], placeholder: 'End date')
    end
  end
end
