rails generate model comment content:string commentable_id:integer commentable_type:string

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
 
end


def change
  create_table :comments do |t|
    t.text :content
    t.belongs_to :user, index: true
    t.belongs_to :gossip, index: true

    t.timestamps
  end
end

def change
  create_table :comments do |t|
    t.text :content
    t.integer :commentable_id
    t.string :commentable_type
    t.timestamps
  end
end