json.extract! userprofile, :id, :userEmail, :userName, :phoneNumber, :Address, :DOB, :Occupation, :Gender, :profilePic, :created_at, :updated_at
json.url userprofile_url(userprofile, format: :json)
