class ContactMessage
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Translation
  extend ActiveModel::Naming
  class << self
    def i18n_scope
      :activerecord
    end
  end

  attr_accessor :name, :email, :body

  validates_presence_of :name, :email, :body
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "nemá správný formát (jmeno@server.tld)"

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end
end
