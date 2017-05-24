class AuditLog < ApplicationRecord
  enum status: { pending: 0, confirmed: 1}

  validates_presence_of :user_id, :status, :start_date

  belongs_to :user
  

  after_initialize :set_defaults


  private

    def set_defaults
      self.start_date ||= Date.today - 6.days
    end
end
