
class Population

  def initialize
    @members = []
    POPN_SIZE.times { @members <<  random_member }
  end

  def epoch
    calculate_fitness
    breed_next_gen
    mutate_members
    #inject_random_member
    output_members
  end

  def calculate_fitness
    @fitness = @members.collect {|m| m.fitness }
    @total_fitness = @fitness.inject{|a,v| a+v}
    puts "@fitness=#{@fitness.inspect} @total_fitness=#{@total_fitness}"
  end

  def breed_next_gen
    next_gen_members = []
    (POPN_SIZE/2).times do
      parent1 = select_member
      parent2 = select_member
      next_gen_members << parent1.crossover_with(parent2)
      next_gen_members << parent2.crossover_with(parent1)
    end
    @members = next_gen_members
  end

  def select_member
    selection_value = rand(@total_fitness)    
    @fitness.each_with_index do |v,i|
      selection_value -= v
      return @members[i] if selection_value<=0
    end
    raise "fail!"
  end

  def mutate_members
    @members.each {|m| m.mutate }
  end

  def inject_random_member
    @members.first.randomize
  end
  
  def output_members
    @members.each {|m| puts m.inspect }
  end

end
