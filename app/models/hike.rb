class Hike < ActiveRecord::Base
  belongs_to :national_park
  belongs_to :hike_type

  scope :by_difficulty, lambda { | difficulty_level | where(:difficulty => difficulty_level) }
  scope :by_rating, lambda { | rating_level | where(:rating => rating_level) }


  #Save difficulty level, rating, time only for the hard hikes.
  def complete!(rating, time_taken)
    difficulty_level = difficulty_proc.call(time_taken, length)
    update_attributes!(rating: rating,
                       difficulty: difficulty_level, time_taken: time_taken) if can_mark_as_complete?(time_taken)
  end


  #Check if the hike can be marked as complete.Only difficult hikes can be marked as complete
  def can_mark_as_complete?(time_taken)
    if time_taken.present? && length.present?
      difficulty = difficulty_proc.call(time_taken, length)
      difficulty > 1
    else
      false
    end
  end

  #Look up by difficulty level or rating
  def self.look_up(filter_options={})
    difficulty_filter = filter_options[:difficulty]
    rating_filter = filter_options[:rating]
    if filter_options.present?
      if difficulty_filter.present?
        hikes = by_difficulty(difficulty_filter)
      elsif rating_filter.present?
        hikes = by_rating(rating_filter)
      end
    else
      hikes = Hike.includes(:national_park).all
    end
    hikes
  end

  private

  #Calculate the difficulty level based on the miles covered per hour.
  def difficulty_proc
    Proc.new do |time_taken, length|
      miles_per_hour = length/time_taken
      if miles_per_hour < 2
        3
      elsif miles_per_hour < 4
        2
      elsif miles_per_hour >= 4
        1
      end
    end
  end

end
