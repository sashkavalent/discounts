# == Schema Information
#
# Table name: sheet_settings
#
#  id                     :integer          not null, primary key
#  page_with_link_url     :string
#  download_link_selector :string
#  rows_number            :integer
#  columns_number         :integer
#  margin_left            :integer
#  margin_top             :integer
#  margin_right           :integer
#  margin_bottom          :integer
#  type                   :string
#  chain_id               :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_sheet_settings_on_chain_id  (chain_id)
#

class SheetSetting < ActiveRecord::Base
  belongs_to :chain

  def pdf_url
    doc = Nokogiri::HTML(open(page_with_link_url).read)
    result = doc.css(download_link_selector).first.attributes['href'].value
    uri = URI.parse(URI.escape(result))
    return uri if uri.host.present?
    uri = uri.to_s
    uri = uri[1..-1] if uri[0] == '.'
    URI::HTTP.build host: URI(page_with_link_url).host, path: uri
  end
end
