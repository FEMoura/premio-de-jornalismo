class Proposal < ActiveRecord::Base
  belongs_to :user
  has_attached_file :archive, styles: {thumb: "360x240>", medium: "1024x768>"}
  do_not_validate_attachment_file_type :archive
  validates_presence_of :category, :title, :vehicle, :publication_date, :archive




  def self.remaining_submissions(params)
      total_submissions = Proposal.where(user_id: params.id).count
    if user_student?(params)
      remaining = 3 - total_submissions
    else
      remaining = 4 - total_submissions
    end
    remaining
  end

  def self.user_student?(params)
    true ? params.user_type == 'Estudante' : false
  end

  def self.remaining_submissions?(params)
    true ? remaining_submissions(params) != 0 : false
  end

  def self.there_is_work_in_the_special_category?(params)
    total = Proposal.where(user_id: params.id).where(category: 'Categoria Especial do Bicentenário de Alagoas').count
    true ? total>0 : false
  end
end
