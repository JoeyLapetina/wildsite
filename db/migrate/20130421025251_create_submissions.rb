class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :submission_type
      t.string :submission_url
      t.text :submission_description
      t.string :submitter_name
      t.string :submitter_email

      t.timestamps
    end
  end
end
