class RestfulControllerApp < Sinatra::Base

	# Are you old enough to be eligibile for SS retirement? 
	# http://myssa.org/check-eligibility/
	# Here's the stuff I would like to do: 
	
	# Get a date of birth from a date picker 
	get "date" do 
		# Can I store that date somehow? 
		@date = # Entered date 
	end 

	# check to see if the date is valid. Maybe this? 
	put  Date.strptime('December 09, 2011', '%B %d, %Y')

	# figure out how old the user is based on birthday compared to today's date 
	def age(dob)
  		now = Time.now.utc.to_date
  		now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
	end

	# Display DOB in that field 
	post "birtdate-display:id" do 
		# on html page display date selected
		# check against a database to display "Your full retirement age is [age]" 
	end

	# check to see if the user is at least 61 years and 9 months old 
	validate :over_69_and_9

	def over_69_and_9
	  if dob + 69.years + 9.months <= Date.today
	    errors.add("You're not eligibile yet. You must be at least " :dob)
	  elsif dob + 69.years + 9.months >= Date.today
	  	#user = eligibile
	end

end
