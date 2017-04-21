class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles

  def add_landmark(landmark)
    landmark.figure_id = self.id
  end

  def add_title(title)
    FigureTitle.new({figure_id: self.id, title_id: title.id})
  end
end
