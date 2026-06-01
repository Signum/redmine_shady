module RedmineShady
  class MailInterceptor
    def self.delivering_email(message)
      if User.current&.pref&.[](:shady)
        message.perform_deliveries = false
        Rails.logger.warn "[redmine_shady] Suppressed notification to #{message.to&.join(', ')} " \
                          "subject=#{message.subject.inspect} user=#{User.current.login}"
      else
        Rails.logger.warn "[redmine_shady] Allowed notification to #{message.to&.join(', ')} " \
                          "subject=#{message.subject.inspect} user=#{User.current&.login || 'nil'}"
      end
    end
  end
end
