class ComprobantesController < ApplicationController
  belongs_to :tipo_contadocumento
  belongs_to :user
  belongs_to :tercero
  has_many :acientos
end
