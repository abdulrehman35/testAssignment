class Bug < Task
  include AASM

  aasm do
    state :started, initial: true
    state :in_progress
    state :resolved

    event :next do
      transitions from: :started, to: :in_progress
      transitions from: :in_progress, to: :resolved

    end

    event :previous do
      transitions from: :resolved, to: :in_progress
      transitions from: :in_progress, to: :started

    end

    # event :clean do
    #   transitions from: :running, to: :cleaning
    # end

    # event :sleep do
    #   transitions from: [:running, :cleaning], to: :sleeping
    # end
  end
end
