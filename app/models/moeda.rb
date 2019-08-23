class Moeda < ApplicationRecord
  belongs_to :mining_type#, optional: true
  validates_presence_of :description # Obrigatorio
  validates_presence_of :acronym # Obrigatorio
  validates_presence_of :url_image# Obrigatorio
end
