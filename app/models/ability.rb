class Ability
  include CanCan::Ability

  def self.version
    :engine
  end

  def initialize(user)
   logger=::Rails.logger
    # Define abilities for the passed in user here. For example:
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    logger.info "cancan called"

    user ||= User.new # guest user (not logged in)

    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      can :manage, Blog do |blog|
        logger.debug user

        puts 'Yuzublog engine ability'
        #user.blog_ids.include? blog.id
        true
      end
      # I'm not sure I like the violation of the law of demeter here, but it is authorization 
      # code, and that does tend to happen.
      can :manage, Post do |post|
        logger.debug "Blog: #{post.blog_id}"
        !(post.nil?) && (!post.blog.nil?) && !(post.blog.authors.nil?) && post.blog.authors.include?(user)
      end
    end
  end
end
