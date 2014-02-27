class CreatePostsAndUsers < ActiveRecord::Migration
  	def change
  	end

	def self.up
		create_table :Posts do |t|
			t.string :title
			t.string :content
		end

		create_table :Users do |t|
			t.id	 :uid
			t.string :name
		end
	end

	def self.down
		drop_table :Posts
		drop_table :Users
	end
end
