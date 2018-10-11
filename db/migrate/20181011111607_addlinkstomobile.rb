class Addlinkstomobile < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :mobile_id, :integer
  end
end
