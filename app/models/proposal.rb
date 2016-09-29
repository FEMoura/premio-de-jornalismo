class Proposal < ActiveRecord::Base
  belongs_to :user
  has_attached_file :archive, styles: {thumb: "360x240>", medium: "1024x768>"}
  do_not_validate_attachment_file_type :archive
end
