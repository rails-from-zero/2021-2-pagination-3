module ApplicationHelper
  def paginate(entries)
    content_tag :div, class: "pagination" do
      concat render_pagination_link(
               "previous",
               entries.current_page - 1,
               entries.current_page <= 1
             )

      render_page_numbers(entries.total_pages, entries.current_page)

      concat render_pagination_link(
               "next",
               entries.current_page + 1,
               entries.current_page == entries.total_pages
             )
    end
  end

  def render_page_numbers(total_pages, current_page)
    calculator = RenderablePagesCalculator.new(total_pages, current_page)
    calculator.numbers.each do |number|
      if number
        concat render_pagination_link(number, number, number == current_page)
      else
        concat content_tag(:span, "...", class: "gap")
      end
    end
  end

  def render_pagination_link(label, page, disabled)
    content_tag :span, class: ("disabled" if disabled) do
      path = params
               .to_unsafe_h
               .merge(page: page, only_path: true)
               .except(:script_name, :original_script_name)

      link_to_unless disabled, label, path
    end
  end
end
