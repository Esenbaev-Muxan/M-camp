class Attacher < ApplicationRecord
  belongs_to :project
  has_one_attached :uploader
  # mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
   validates :name, presence: true
   validates :uploader, presence: true
end
 