module ApplicationHelper

    include ActionView::Helpers::UrlHelper

    # Check for the presence of any alerts
    def any_alerts
        @notice.present? || flash[:notice].present? || @alert.present? || flash[:alert].present?
    end

    # Convert decimal price to string
    def price_str(price)
        if price.present?
            return "#{'USD %.2f' % price}"
        else
            return 'N / A'
        end
    end

end
