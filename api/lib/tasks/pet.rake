#Task que gera os 1000 cachorros pegando a raça no site
require 'open-uri'
namespace :pet do
  desc "TODO"
  task gen: :environment do
  	puts 'Extraindo raças, esse processo pode demorar um pouco!'
 	racas = Nokogiri::HTML(open("http://www.portalfilhotes.com.br/racas-de-a-z/"))
 	pet_breeds = Array.new
 	racas.css('#HOTWordsTxt > ul > li').each do |raca|
 		pet_breeds.push raca.text
 	end
 	num = 1
 	(1..1000).each do ||
 		Pet.create(
 			breed: pet_breeds.sample,
 			genre: ['Macho','Femea'].sample,
 			castrated: [true,false].sample,
 			# Random birthday date (maximum age between 0 and 10)
 			birth: Faker::Date.birthday(0, 10),
 			name: Faker::Cat.name,
 			owner_name: Faker::Name.name,
 			owner_phone: Faker::Base.numerify('(##) ####-####'),
 			# Random date in the past (up to maximum of N days)
 			last_time:Faker::Date.backward([5,10,15,20,25].sample)		
 		)
 	end
 	puts 'Raças extraidas com sucesso!'
end

end
