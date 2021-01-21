class Table < ActiveRecord::Base
  def name
    ["Table #", self.id].join
  end
end
