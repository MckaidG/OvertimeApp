class AuditLog < ApplicationRecord
  scope :by_start_date, -> { order('start_date DESC') }
  
  enum status: { pending: 0, confirmed: 1}

  validates_presence_of :user_id, :status, :start_date

  belongs_to :user


  after_initialize :set_defaults

  before_update :set_end_date, if: :confirmed?

  private
      def set_end_date
        self.end_date = Date.today
      end

    def set_defaults
      self.start_date ||= Date.today - 6.days
    end
end
