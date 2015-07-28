class DecksController < ApplicationController
  before_filter :find_deck, only: [ :show, :add_card, :remove_card, :filter_cards ]
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

    render partial: 'card_list', object: @deck.cards, locals: { action: 'remove' }
  end

  def remove_card
    @deck.card_lists.where(card_id: @card.id).first.destroy

    render partial: 'card_list', object: @deck.cards, locals: { action: 'remove' }
  end

  def filter_cards
    q = "%#{params[:q]}%"

    cards = Card.joins(:adventure_deck).joins(:card_type).where(["cards.name like ? OR adventure_decks.number like ? OR card_types.name like ?", q, q, q])

    render partial: 'card_list', object: cards, locals: { action: 'add' }
  end

  private

  def find_deck
    @deck = Deck.find params[:id]
  end

  def find_card
    @card = Card.find params[:card_id]
  end
end
