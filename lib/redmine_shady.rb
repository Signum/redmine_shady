module RedmineShady
  def self.intercept_mails
    require_dependency "#{self.name.underscore}/mail_interceptor"
    ActionMailer::Base.register_interceptor(MailInterceptor)
  end

  def self.patch_delivery
    require_dependency "#{self.name.underscore}/message_delivery_patch"
    ActionMailer::MessageDelivery.prepend(MessageDeliveryPatch)
  end

  def self.hook
    require_dependency "#{self.name.underscore}/hook"
  end

  def self.install
    hook
    patch_delivery
    intercept_mails
  end
end
