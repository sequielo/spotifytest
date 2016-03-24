class CreateDjs < ActiveRecord::Migration
  def self.up
    create_table :djs do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :djs
  end
end
