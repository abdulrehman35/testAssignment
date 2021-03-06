class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.belongs_to :creator, index: true

      t.timestamps
    end
  end
end
