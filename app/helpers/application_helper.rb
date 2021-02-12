module ApplicationHelper
  def paginate(posts)
    content_tag :div, class: "pagination" do
      concat render_pagination_link(
               "previous",
               posts.current_page - 1,
               posts.current_page <= 1
             )

      render_page_numbers(posts.total_pages, posts.current_page)

      concat render_pagination_link(
               "next",
               posts.current_page + 1,
               posts.current_page == posts.total_pages
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
      link_to_unless disabled, label, posts_path(page: page)
    end
  end
end
