# == Schema Information
#
# Table name: chains
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chain < ActiveRecord::Base
  has_one :logo, as: :imageable, class_name: Image, dependent: :destroy
  has_many :discounts, dependent: :destroy
  has_many :shops, dependent: :destroy
  has_many :sheets, dependent: :destroy
  has_one :sheet_setting, dependent: :destroy

  validates :name, presence: true
  accepts_nested_attributes_for :logo, :sheet_setting

  def builded_logo
    logo || build_logo
  end

  def serializable_hash(*args)
    super(*args).merge(original_image: logo.attachment.url,
                       thumb_image: logo.attachment.url(:thumb))
  end

  def builded_sheet_setting
    sheet_setting || build_sheet_setting
  end

  def update_sheet
    file = open(sheet_setting.pdf_url)
    pdf = Grim.reap(file.path)
    sheet = sheets.create
    pdf.each do |page|
      path = pdf.path + (index = (index || 0) + 1).to_s + '.jpg'
      page.save(path, density: Setting.instance.image_density)
      sheet.images << Image.new(attachment: File.open(path))
    end
    sheet.split_into_discounts
  end
end
