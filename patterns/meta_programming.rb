require 'pp'

class CompositeBase
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.member_of(composite_name)
    attr_name = "parent_#{composite_name}"
    raise 'Method redefinition' if instance_methods.include?(attr_name)

    code = %Q(
      attr_accessor #{attr_name}
    )
    class_eval code
  end

  def self.composite_of(composite_name)
    code = %Q(
      member_of composite_name

      def sub_#{composite_name}s
        @sub_#{composite_name}s = [] unless @sub_#{composite_name}s
        @sub_#{composite_name}s
      end

      def add_sub_#{composite_name}(child)
        return if sub_#{composite_name}s.include?(child)
        sub_#{composite_name}s << child
        child.parent_#{composite_name} = self
      end

      def remove_sub_#{composite_name}(child)
        return unless sub_#{composite_name}s.include?(child)
        sub_#{composite_name}s.delete child
        child.parent_#{composite_name} = nil
      end
    )
    class_eval code
  end
end

class Tiger < CompositeBase
  member_of(:population)
  member_of(:classification)
end

class Tree < CompositeBase
  member_of(:population)
  member_of(:classification)
end

class Jungle < CompositeBase
  composite_of(:population)
end

class Species < CompositeBase
  composite_of(:classification)
end

tony_tiger = Tiger.new('tony')

se_jungle = Jungle.new('southern jungle tigers')
se_jungle.add_sub_population(tony_tiger)

pp tony_tiger.parent_population

species = Species.new('P. tigers')
species.add_sub_classification(tony_tiger)

pp tony_tiger.parent_classification

species_b = Species.new('D. tigers')
species_b.add_sub_classification(species)
