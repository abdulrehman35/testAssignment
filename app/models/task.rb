class Task < ApplicationRecord
  #include AASM

  belongs_to :project
  belongs_to :user

  has_one_attached :image

  validate :image_type

  belongs_to :creator, class_name: "User"

  # aasm do
  #   state :started, initial: true
  #   state :in_progress
  #   state :completed
  #   state :resolved

  #   event :next do
  #     transitions from: :started, to: :in_progress
  #     transitions from: :in_progress, to: :completed

  #   end

  #   event :clean do
  #     transitions from: :running, to: :cleaning
  #   end

  #   event :sleep do
  #     transitions from: [:running, :cleaning], to: :sleeping
  #   end
  # end

private

def image_type
   if image.attached? == false
     errors.add(:image, "is missing!")
   end
   if !image.content_type.in?(%('image/jpeg image/png'))
     errors.add(:image, "needs to be a jpeg or png!")
   end
end

end
