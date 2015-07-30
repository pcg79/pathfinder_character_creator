module DecksHelper
  def card_type_status_class(deck, type)
    type = status_type(type)

    current_count = deck.cards.send(type.to_sym).count

    limit = deck.send("#{type}_count".to_sym)

    if current_count == limit
      "valid"
    elsif current_count > limit
      "over"
    else
      "under"
    end

  rescue NoMethodError => e
    Rails.logger.error "*** [card_type_status_class] NoMethodError caught.  #{e.message}"
    ''
  end

  def status_type(type)
    type.downcase.pluralize
  end
end
