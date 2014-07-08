class Task
  attr_reader :name, :parent

  def initialize(name)
    @name = name
    @parent = nil
  end

  def get_time_required
    0
  end

  def total_number_of_basic_tasks
    1
  end
end

def AddDryIngredientsTask < Task
  def initialize
    super('Add dry ingredients')
  end

  def get_time_required
    1
  end
end

def MixTask < Task
  def initialize
    super('Mix that batter up!')
  end

  def get_time_required
    3
  end
end

def MakeBatterTask < CompositeTask
  def initialize
    super('Make batter')
    @sub_tasks << AddDryIngredientsTask.new
    @sub_tasks << MixTask.new
  end
end

def CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def <<(sub_task)
    @sub_tasks << sub_task
    sub_task.parent = self
  end

  def delete(sub_task)
    @sub_tasks.delete(sub_task)
    sub_task.parent = nil
  end

  def [](index)
    @sub_tasks[index]
  end

  def []=(index, task)
    @sub_tasks[index] = task
  end

  def get_time_required
    @sub_tasks.inject(0) { |total, task| total += task.get_time_required }
  end

  def total_number_basic_tasks
    @sub_tasks.inject(0) { |total, task| total += task.total_number_basic_tasks }
  end
end
