class RkNinja < ApplicationRecord
  def get_rank_options
    rank = RkNinja.all.drop(1)
    rank_options = []

    rank.each do |x|
      rank_options.push([x.rank,x.id])
    end

    rank_options
  end

  def get_rank_options_admin
    rank = RkNinja.all
    rank_options = []

    rank.each do |x|
      rank_options.push([x.rank,x.id])
    end

    rank_options
  end
end
