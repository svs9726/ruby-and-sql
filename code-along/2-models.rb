# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

# 1c. Check how many companies before inserting
no_of_companies = Company.all.count
puts "Companies: #{no_of_companies}"

# 2. insert new rows in companies table
# INSERT INTO
new_company = Company.new
puts new_company.inspect
new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "https://apple.com"
p new_company
new_company.save

new_company = Company.new
new_company["name"] = "Amazon"
new_company["city"] = "Seattle"
new_company["state"] = "WA"
new_company["url"] = "https://amazon.com"
new_company.save
p new_company

new_company = Company.new
new_company["name"] = "Airbnb"
new_company["city"] = "San Francisco"
new_company["state"] = "CA"
new_company["url"] = "https://airbnb.com"
new_company.save
p new_company

# 3. query companies table to find all row with California company
no_of_companies = Company.all.count
puts "Companies: #{no_of_companies}"

# cali company
cali_companies = Company.where({"state" => "CA"})
puts cali_companies.inspect
puts "There are #{cali_companies.count} Cali companies"

# 4. query companies table to find single row for Apple
apple = Company.where({"name" => "Apple"})[0]
p apple
p apple["name"]
p apple["id"]

# 5. read a row's column value
apple = Company.find_by({"name" => "Apple"})
p apple["city"]

# 6. update a row's column value
apple["url"] = "https://www.apple.com"
p apple
apple.save
p apple

# 7. delete a row
airbnb = Company.find_by({"name" => "Airbnb"})
p airbnb
airbnb.destroy

no_of_companies = Company.all.count
puts "Companies: #{no_of_companies}"
