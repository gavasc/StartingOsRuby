require "octokit"

class Repository < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  # link is only <user>/<repo>
  validates :link, presence: true

  validate :has_ruby

  has_many :issues

  private

  def has_ruby
    client = Octokit::Client.new

    errors.add(:link, "The repository does not have Ruby as a language!") unless client.languages(link).key?(:Ruby)
  end
end
