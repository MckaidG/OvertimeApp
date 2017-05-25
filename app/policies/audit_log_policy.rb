class AuditLogPolicy < ApplicationPolicy

  def confirm?
    record.user_id == user.id
  end


  def index?
    return true if admin?
  end

  private

    def admin?
      admin_types.include?(user.type)
    end
end
