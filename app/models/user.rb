class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :email, :password, :adress, :user_type, :mte, :cpf, :rg, :gender, :phone, :city, :state, :archive

  has_attached_file :archive, styles: {thumb: "360x240>", medium: "1024x768>"}
  do_not_validate_attachment_file_type :archive
  has_many :proposals
end
