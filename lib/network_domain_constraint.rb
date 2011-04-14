class NetworkDomainConstraint
  def self.matches?(request)
    ['www','test','nil'].include? request.subdomain
  end
end
