class NetworkDomainConstraint
  def self.matches?(request)
    puts request.subdomain
    ['www','test','blogs'].include? request.subdomain
  end
end
