class SubDomainConstraint
  def self.matches?(request)
    ::Rails::Logger.info("subdomain routing in effect")
    case request.subdomain
    when 'www', '', 'test', nil
      false
    else
      true
    end
  end
end
