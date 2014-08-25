class List < ActiveRecord::Base
  has_many :items, dependent: :destroy
  
  def slab
    redirect_to root_path
  end

end
