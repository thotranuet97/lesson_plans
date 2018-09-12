class Lesson < ApplicationRecord
  enum status: [:Nháp, :Xong]
  belongs_to :user
  belongs_to :grade
  belongs_to :subject
  default_scope -> { order(created_at: :desc) }
  scope :grade_id, -> (grade_id) { where grade_id: grade_id }
  scope :subject_id, -> (subject_id) { where subject_id: subject_id }
  scope :publish, -> { where status: :Xong }
  scope :draft, -> { where status: :Nháp }
end
