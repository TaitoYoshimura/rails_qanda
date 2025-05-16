class Question < ApplicationRecord    
    has_many :answers, dependent: :destroy
    # 質問のタイトル、名前、内容をバリデーション
    validates :title, presence: true
    validates :name, presence: true
    validates :content, presence: true, length:{ minimum: 5, maximum: 1000 }
end
