module RedmineShady
  module MessageDeliveryPatch
    def deliver_later(options = {})
      if User.current&.pref&.[](:shady)
        Rails.logger.warn "[redmine_shady] Shady mode active — delivering synchronously instead of async"
        deliver_now
      else
        super
      end
    end
  end
end
