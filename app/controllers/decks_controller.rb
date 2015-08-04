class DecksController < ApplicationController
  before_filter :find_deck, only: [ :show, :add_card, :remove_card, :filter_cards, :destroy, :replace_with_defaults, :clear_cards ]
  before_filter :find_card, only: [ :add_card, :remove_card ]

  def index
    @decks = Deck.all
  end

  def new
    @deck = Deck.new
    @players = Player.all
    @characters = Character.all
  end

  def create
    @deck = Deck.create character_id: params[:deck][:character_id], player_id: params[:deck][:player_id]

    redirect_to deck_path(@deck.id)
  end

  def show
  end

  def add_card
    @deck.cards << @card
  end

  def remove_card
    if card = @deck.card_lists.where(card_id: @card.id).first
      card.destroy
    end
  end

  def filter_cards
    q = "%#{params[:q].gsub(/ /, '%')}%"

    cards = Card.by_name.joins(:adventure_deck).joins(:card_type).where(["cards.name like ? OR adventure_decks.number like ? OR card_types.name like ?", q, q, q])

    render partial: 'card_list', object: cards, locals: { action: 'add' }
  end

  def destroy
    @deck.destroy

    redirect_to decks_path, notice: "Deck deleted"
  end

  # Maybe instead I create a user called "Default" and that user gets a deck
  # for every character w/ the default lists.  Make it via seeds.rb.
  # Then here I just pull up that person's deck assign a copy of the cards
  # @deck.
  def replace_with_defaults
    require 'suggested_decks'

    @deck.cards = []

    card_list = SuggestedDecks::CARD_LISTS[@deck.character.name]

    card_list.keys.each do |type|
      card_list[type].each do |card_name|
        card = Card.joins(:card_type).where(name: card_name).where(["card_types.name = ?", type.capitalize]).first
        @deck.cards << card
      end
    end

    redirect_to deck_path(@deck), notice: "Cards replaced by defaults"
  end

  def clear_cards
    @deck.cards = []

    redirect_to deck_path(@deck), notice: "Cards cleared"
  end

  private

  def find_deck
    @deck = Deck.find_by_id params[:id]

    redirect_to root_path, error: "Deck not found" unless @deck
  end

  def find_card
    @card = Card.find params[:card_id]
  end
end
