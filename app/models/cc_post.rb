class CcPost < ApplicationRecord
  belongs_to :cc_user
  has_many :cc_comments, dependent: :destroy
  has_many :cc_likes, dependent: :destroy
  has_many :cc_users, through: :cc_likes

  # Tipos de reacciones
  Kinds = %w[like dislike].freeze
  KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta"}.freeze
end
