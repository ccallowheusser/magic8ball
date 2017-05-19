# check to see if args were passed on command line.
# if so, save then clear the ARGV variable (so other things run, duh!)
# only using first ARGV if additional are included in command line
if ARGV.any?
	@arg = ARGV[0]
	ARGV.clear
else 
	@arg = []
end

# set up the answer array
@arr = [] 
@arr << "Quit playing! Time to get your homeowork done!"
@arr << "It's been a long time since I've heard that question."
@arr << "What do you think?"
@arr << "Why is this important?"
@arr << "This is a witchhunt!"
@arr << "Sorry, I'm on vacation."
@arr << "Please ask a different question."
@arr << "No. I said NO!"
@arr << "That's a great question. What do you think the answer is?"
@arr << "Are you kidding me? You should know the answer to that question!"
@arr << "Mary had a little lamb whose fleece was white as snow."
@arr << "WWJD?"

# set up the easter egg array
@easter_egg = {
	"add_answers" => 1, 
	"reset_answers" => 2,
	"print_answers" => 3,
	"quit" => 4,
	"what is the meaning of life?" => "42",
	"what is my name?" => "Why, Tarzan, of course!",
	"how old am i?" => "Younger than me!",
	"who am i?" => "Well, you're certainly not Marilyn Monroe!"
}

# store the original array so we can reset if needed later
@arr_reset = @arr.clone

# add new answers to the answer array
def add_answers
	continue = true
	while continue
		puts "What answers would you like to add to the Magic 8-Ball? (Quit to end)"
		@ans = gets.chomp
		if @ans.downcase == 'quit'
			continue = false
		else
			@arr.push @ans
		end
		puts "\n\n" # add some screen space
	end
end

# reset the answers array back to the original
def reset_answers
	@arr = @arr_reset.clone
	puts "Answers have been reset to original answers.\n\n"
end

# print answers array 
def print_answers
	@arr.each { |qu| puts qu }
	puts "\n\n" # add some screen space
end

# get a new question from user
# detects the following to treat as special cases:
# print_answers, reset_answers and add_answers
# which are included in easter_egg array
def get_question
	puts "Type a question to get an answer, or type QUIT to end the program."
	quest = gets.chomp.downcase
	case @easter_egg[quest]
	when 1, 2, 3, 4
		magic_eight_ball(@easter_egg[quest])
	when nil
		puts "The Magic 8-Ball says: #{@arr.sample}\n\n"
	else
		puts "The Magic 8-Ball says: #{@easter_egg[quest]}\n\n"	
	end
end

# runs the Magic Eight Ball! 
def magic_eight_ball(arg)
	case arg
	when nil, []
		get_question
	when 1,'add_answers'
		add_answers
	when 2,'reset_answers'
		reset_answers
	when 3,'print_answers'
		print_answers
	when 4, 'quit'
		exit
	else 
		puts "Command line argument not valid.\n\n"
	end
	magic_eight_ball(nil)
end


# start the program!
# if command line options entered, passed to the program as @arg
magic_eight_ball(@arg)