class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :state, presence: true
  has_many :employees, dependent: :destroy

  scope :workers_in, ->(state) {includes(:employees).where("state = ?", state)}

  def to_s
    "#{name},  #{state}"
    end
end