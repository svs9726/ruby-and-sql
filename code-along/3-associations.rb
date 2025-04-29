# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

puts "Companies: #{Company.all.count}"
puts "Contacts: #{Contact.all.count}"

#figure out company id
apple = Company.find_by({"name" => "Apple"})
p apple

amazon = Company.find_by({"name" => "Amazon"})
p amazon 

# - Insert and read contact data for companies in the database
# 1. insert new rows in the contacts table with relationship to a company
new_contact = Contact.new
new_contact["first_name"] = "Tim"
new_contact["last_name"] = "Cook"
new_contact["email"] = "tim@apple.com"
new_contact["company_id"] = apple["id"]
new_contact.save
p new_contact

new_contact = Contact.new
new_contact["first_name"] = "Craig"
new_contact["last_name"] = "Federighi"
new_contact["email"] = "craig@apple.com"
new_contact["company_id"] = apple["id"]
new_contact.save
p new_contact

new_contact = Contact.new
new_contact["first_name"] = "Jeff"
new_contact["last_name"] = "Bezos"
new_contact["email"] = "jeff@amazon.com"
new_contact["company_id"] = amazon["id"]
new_contact.save
p new_contact

puts "Contacts: #{Contact.all.count}"

# 2. How many contacts work at Apple?
applecontacts = Contact.where({"company_id" => apple["id"]})
p applecontacts
p "Apple people: #{applecontacts.count}"

# 3. What is the full name of each contact who works at Apple?
contacts = Contact.all
for contact in contacts
    puts "#{contact["first_name"]} #{contact["last_name"]}"
end
