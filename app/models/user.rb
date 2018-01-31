class User < ApplicationRecord
  has_secure_password
  
  has_many :skills, foreign_key: :teacher_id
  has_many :lessons, foreign_key: :student_id
  has_many :reviews, foreign_key: :student_id
  has_many :messages, foreign_key: :sender_id
  has_many :messages, foreign_key: :receiver_id
  validates :role, inclusion: { in: ["teacher", "student"] }
  validates :email, :first_name, :last_name, presence: true
  after_create :set_picture_if_nil
  # mount_uploader :photo, PhotoUploader

  def name
  "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

  def set_picture_if_nil
    self.update_columns(photo: "image/upload/v1512662884/dcp0w9sxsmr9uu6ohtpk.png")
  end
end
