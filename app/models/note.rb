class Note < ApplicationRecord
  belongs_to :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :title, presence: true

  # active record has many callbacks (hooks) that get executed at different times
  # during the lifecycle of the activerecord object
  before_save :convert_markdown_to_html

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(new_list) # new_list is assumed to be a list separated by commas
    self.tags = new_list.split(',').map do |item|
      Tag.where(name: item.strip).first_or_create
    end
  end

  private

  def convert_markdown_to_html
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    self.body_html = markdown.render(self.body_md)
  end
end
