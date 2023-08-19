# frozen_string_literal: true

class UsersTag < ApplicationRecord
  belongs_to :user
  belongs_to :tag
end
