# == Schema Information
#
# Table name: images
#
#  id                      :integer          not null, primary key
#  imageable_id            :integer
#  imageable_type          :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  attachment_file_name    :string
#  attachment_content_type :string
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#
# Indexes
#
#  index_images_on_imageable_type_and_imageable_id  (imageable_type,imageable_id)
#

class Image < ActiveRecord::Base
  belongs_to :imageable
  has_attached_file :attachment, styles: { medium: '300x300>', thumb: '100x100>' },
                             default_url: '/images/:style/missing.png'
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/
  validates :attachment, presence: true

  def source_url=(url)
    self.attachment = URI.parse(url).to_s
  end
  def source_url;end
end
