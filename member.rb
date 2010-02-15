
class Array

  def randomize
    clear
    GENE_SIZE.times { self << random_gene_value }
    self
  end

  def random_gene_value
    (rand()*10).to_i
  end

  def fitness
    inject { |a,v| a+v }
  end

  def mutate
    point_wise_mutation
    inversion_mutation
  end

  def point_wise_mutation
    return unless rand() < 0.01
    self[rand(size)] = random_gene_value
  end

  def inversion_mutation
    return unless rand() < 0.01
    from, to = rand(size), rand(size)
    from, to = to, from if from > to    
    splice = self.slice(from,to-from).reverse
    (from...to).each { |idx| self[idx] = splice.shift }
  end

  def crossover_with other    
    self.zip(other).collect { |p| rand()>0.5 ? p[0] : p[1]}
  end
  
end

def random_member
  [].randomize  
end

