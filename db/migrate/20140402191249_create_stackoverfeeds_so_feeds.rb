class CreateStackoverfeedsSoFeeds < ActiveRecord::Migration
  def change
    create_table :stackoverfeeds_so_feeds do |t|
      t.string :author
      t.string :entry_id
      t.text :summary
      t.string :title
      t.datetime :updated
      t.datetime :published

      t.timestamps
    end
  end
end
