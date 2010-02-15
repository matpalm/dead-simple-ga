GENE_SIZE = 30
POPN_SIZE = 20

require 'member'
require 'population'

p = Population.new
5000.times { p.epoch }
