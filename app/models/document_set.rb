class DocumentSet < ActiveRecord::Base
  include DocumentSetStatistic

  extend FriendlyId
  friendly_id :slug_candidates, :use => [:slugged, :history]
  
  attr_accessible :title, :description, :collection_id, :picture, :is_public

  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_user_id'
  belongs_to :collection
  has_and_belongs_to_many :works

  def show_to?(user)
    self.is_public? || self.collection.show_to?(user)
  end
  
  def intro_block
    self.description
  end
  
  def subjects_disabled
    self.collection.subjects_disabled
  end

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end

  def normalize_friendly_id(string)
    string.truncate(240, separator: ' ', omission: '')
    super
  end

end
