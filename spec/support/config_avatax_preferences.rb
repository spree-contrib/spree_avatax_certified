class MyConfigPreferences
  def self.set_preferences
    Spree::Config.avatax_address_validation_enabled_countries = ["United States", "Canada"]
    Spree::Config.avatax_company_code = ENV['AVATAX_COMPANY_CODE'] || 'test_company'
    Spree::Config.avatax_endpoint = ENV['AVATAX_ENDPOINT'] || 'https://development.avalara.net'
    Spree::Config.avatax_account = ENV['AVATAX_ACCOUNT'] || 'test_account'
    Spree::Config.avatax_license_key = ENV['AVATAX_LICENSE_KEY'] || 'test_license_key'
    Spree::Config.avatax_log = true
    Spree::Config.avatax_address_validation = false
    Spree::Config.avatax_document_commit = true
    Spree::Config.avatax_tax_calculation = true
    Spree::Config.avatax_origin = "{\"Address1\":\"915 S Jackson St\",\"Address2\":\"\",\"City\":\"Montgomery\",\"Region\":\"Alabama\",\"Zip5\":\"36104\",\"Zip4\":\"\",\"Country\":\"United States\"}"
  end
end
