require 'capybara/dsl'
require 'capybara/rspec/matchers'

module DriverUtil
  include Capybara::DSL
  include Capybara::RSpecMatchers

  def goto (url)
    visit url
  end

  def find_element(*locator)
    find(*locator)
  end

  def find_element_by_text(css, value)
    find(css, :text => value)
  end

  def click_element(element)
    element.click
  end

  def find_and_click(*locators)
    click_element(find_element(*locators))
  end

  def find_and_gettext(*locators)
    find_element(*locators).text
  end


  def click_button_element(locator)
    click_button(locator)
  end

  def click_link_element(locator)
    click_link(locator)
  end

  def enter_text(text_field, text)
    fill_in(text_field, :with => text)
  end

  #method takes a block as 2nd parameter - gets called in yield
  def within_element(css, &blk)
    within(css) do
      yield
    end
  end

  def hover_over_element(element)
    element.hover
  end

  def set_value(element, value)
    element.set value
  end

  def select_option(value, element)
    select value, :from => element
  end

  def choose_option(value)
    page.choose(value)
  end

  def set_checkbox(element, value)
    element.set(value)
  end

  def accept_alert
    page.driver.browser.switch_to.alert.accept
  end

  def dismiss_alert
    page.driver.browser.switch_to.alert.dismiss
  end

  def element_has_text?(element, text)
    element.text.include? text
  end

  def element_exists?(element)
      begin
         page.find(element)
         return true
      rescue Capybara::ElementNotFound
         return false
      end
  end

  def element_visible?(element)
    page.find(element).visible?
  end

  def xpath_visible(xpath)
    page.has_selector?(:xpath, xpath)
  end

  def get_html_attributes(element, attribute)
    element[attribute]
  end

  def get_element_text(element)
    element.text
  end

  def get_element_value(element)
    element.value
  end

  # params
  # attribute_name: form attribute name(e.g. :id)
  # attribute_value: form attribute value(e.g. "topquery")
  # Capybara doesn't provide any inbuilt submit form method
  def submit_form(attribute_name, attribute_value)
    page.driver.browser.find_element(attribute_name, attribute_value).submit()
  end

  def get_drop_down_value(*locator)
    find_element(*locator).all('option').collect(&:text)
  end

  def wait_for(*locator,time)
    wait = Selenium::WebDriver::Wait.new(:timeout => time)
    wait.until { page.driver.browser.find_element(*locator).displayed? }
  end

  def page_title(text)
    page.has_title? text
  end

  def execute_javascript(script)
    page.execute_script(script)
  end

  def evaluate_javascript(script)
    page.evaluate_script(script)
  end

  def add_attachment(locator, file_path)
    page.attach_file(locator, file_path)
  end

  def press_return_key(element)
    element.native.send_keys :return
  end

  def get_web_element_using_xpath(a_xpath)
    find(:xpath, a_xpath)
  end

  def check_checkbox(a_checkbox)
    a_checkbox.set true
  end

  def unchecked_checkbox(a_checkbox)
    a_checkbox.set false
  end

  def checkbox_status(a_checkbox)
    a_checkbox.checked?
  end

  def alter_checkbox(a_checkbox)
    if checkbox_status(a_checkbox)
      unchecked_checkbox(a_checkbox)
      return "unchecked"
    else
      check_checkbox(a_checkbox)
      return "checked"
    end
  end
end
