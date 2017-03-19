module Support
  module AssertionHelper
    include DriverUtil

    def verify_page_has_content(a_content)
      expect(page).to have_content(a_content)
    end

    def verify_content(context, content, options = {})
      expect(context).to have_content(content, options)
    end

    def verify_checkbox_is_checked(element)
      expect(element).to_be_checked
    end

    def verify_checkbox_is_not_checked(element)
      expect(element).not_to be_checked
    end

    def verify_page_title_has_content(content)
      expect(page).to have_title content
    end

    def verify_no_content(context, content, options = {})
      expect(context).to have_no_content(content, options)
    end

    def verify_selected_option(element, value)
      expect(selected_option_text(element)).to eq(value)
    end

    def verify_page_has_no_content(a_content)
      expect(page).to have_no_content(a_content)
    end

    def verify_page_has_selector(a_selector)
      expect(page).to have_selector(a_selector)
    end

    def verify_page_has_xpath_selector(a_xpath_selector)
      expect(page).to have_selector(:xpath, a_xpath_selector)
    end

    def verify_page_has_no_selector(a_selector)
      expect(page).to have_no_selector(a_selector)
    end

    def verify_link_exists(element, link)
      expect(element).to have_link link
    end

    def verify_no_link_exists(element, link)
      expect(element).to have_no_link link
    end

    def verify_element_exists(a_css)
      verify_page_has_css(a_css)
    end

    def verify_check_box_is_checked(a_check_box)
      expect(find_element(a_check_box)).to be_checked
    end

    def verify_check_box_is_not_checked(a_check_box)
      expect(find_element(a_check_box)).not_to be_checked
    end

    def verify_value(actual, expected)
      expect(actual).to eql(expected)
    end

    def verify_actual_equals_expected(actual, expected)
    expect(actual).to eq(expected)
    end

    def verify_input_contains_value(input, value)
      expect(input).to match(value)
    end
  end
end

