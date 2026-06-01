module RedmineShady
  module Hook
    class ViewListener < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context = {})
        return '' unless User.current.pref[:shady]

        context[:controller].render_to_string(partial: 'hooks/shady_bar')
      end
    end
  end
end
