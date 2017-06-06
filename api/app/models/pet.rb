class Pet < ApplicationRecord
	searchkick suggest: [:breed], language: "brazilian"

	def full_search
		"#{breed} #{name} #{owner_name}"
	end

	def search_data
		{
			full_search: full_search,
			breed: breed,
			name: name,
			owner_name:owner_name
		}
	end
end
