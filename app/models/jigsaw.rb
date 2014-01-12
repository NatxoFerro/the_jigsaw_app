class Jigsaw < ActiveRecord::Base
  belongs_to :user
  has_many :groups, dependent: :destroy
  has_many :documents, as: :resource, dependent: :destroy
  
  attr_accessible :URL, :title, :description, :photo, :phase, :user_id
  
  validates :title, presence: { message: "O titulo e obrigatorio" } 
  validates :title, uniqueness: true, length: { in: 5..20, message: "O titulo debe ter entre 5 e 20 caracteres" }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "O t&iacute;tulo debe conter letras e n&uacute;meros" }
  validates :phase, numericality: { only_integer: true, message: "A fase debe ser un enteiro [0..9]" }
end
