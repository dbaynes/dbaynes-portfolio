module ApplicationHelper
  def flash_class(level)
      case level
        when :notice then "info"
        when :success then "success"
        when :error then "error"
        when :alert then "warning"
      end
  end
  #def is_admin?(user)
  #  logger.info("@@@@@@@is_admin!!!!!!")
  #  admin_role = Role.find(:first, :conditions => ["name = ?", "admin"])
  #  return user.roles.include?(admin_role)
  #end
  
end
