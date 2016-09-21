module Admin::EventsHelper

  def has_role?
    event.is_secret || event.is_multi_select
  end

  def event_error_msg_by(field)
    if event.errors[field].present?
      content_tag(:blockquote, :class => "section-footer") do
        h = t("simple_form.labels.event.#{field}")
        h += ': '
        h += event.errors[:title].first
      end
    end
  end
end
