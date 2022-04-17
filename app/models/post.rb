class Post < ApplicationRecord
validates :title, presence: :true
validates :content, length: { minimum: 250 }
validates :summary, length: { maximum: 250 }
validates :category, inclusion: ["Fiction", "Non-Fiction"]
validate :title_must_include

private

TITLE_INCLUDES = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
]

def title_must_include
    if TITLE_INCLUDES.none? { |clickbait| clickbait.match title }
        errors.add(:title, "must include clickbait")
    end
end
end
